/////////////////////////////
//Sang Woo Shin 15372
//Breadboard-PCB
//Procesador
////////////////////////////

`include "ProgramCounter.sv"
`include "ALU.sv"
`include "FlipFlops.sv"
`include "ROM.sv"
`include "TristateBuffer.sv"
`include "RAM.sv"
`include "DecoderIO.sv"

module Board #(parameter N=4)(input logic clk, reset, input logic [N-1:0] In0,In1,In2, output logic C,Z, output logic [N-1:0] Out0,Out1,Out2,Accu);

wire [15:0] control;
wire [3:0] operand,ALUR,Aout;
wire [11:0] address,loadAdd;
wire [7:0] progbyte;
wire [6:0] uRomAddress;
wire [1:0] CarryZero;
wire [3:0] databus;
wire [15:0] outputE;
wire [15:0] inputE;


PC ProgCounter(.LOAD(loadAdd),.reset(reset),.loadE(~control[14]),.incPC(control[15]),.clk(clk),.INS(address));

FFT Phase(.clk(clk),.reset(reset),.T(1'b1),.Q(uRomAddress[0]));

FFD2 CZ(.clk(control[12]),.reset(reset),.D(CarryZero),.Q(uRomAddress[2:1]));

ControlROM uROM(.address(uRomAddress),.ProgOut(control));

ProgROM pROM(.address(address),.ProgOut(progbyte));

FFD8 Fetch(.clk(uRomAddress[0]),.reset(reset),.D(progbyte),.Q({uRomAddress[6:3],operand}));

TristateB Oper(.tri_en(~control[1]),.entrada(operand),.salida(databus));

FFD4 A(.clk(control[13]),.reset(reset),.D(ALUR),.Q(Aout));

ALU ALU(.A(Aout),.B(databus),.S(control[10:6]),.nCin(control[11]),.Cout(CarryZero[1]),.eq(CarryZero[0]),.Result(ALUR));

TristateB TriALU(.tri_en(~control[3]),.entrada(ALUR),.salida(databus));

RAM DRAM(.clk(clk), .we(~control[4]), .cs(~control[5]), .address(loadAdd),.data(databus));

Decoder OutDecode(.load(~control[0]),.binary(operand),.onehot(outputE));

Decoder InputDecode(.load(~control[2]),.binary(operand),.onehot(inputE));

TristateB Input0(.tri_en(inputE[0]),.entrada(In0),.salida(databus));

TristateB Input1(.tri_en(inputE[1]),.entrada(In1),.salida(databus));

TristateB Input2(.tri_en(inputE[2]),.entrada(In2),.salida(databus));

FFD4 Output0(.clk(outputE[0]),.reset(reset),.D(databus),.Q(Out0));

FFD4 Output1(.clk(outputE[1]),.reset(reset),.D(databus),.Q(Out1));

FFD4 Output2(.clk(outputE[2]),.reset(reset),.D(databus),.Q(Out2));

assign loadAdd= {operand,progbyte};


endmodule


