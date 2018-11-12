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

module Board ();

wire [15:0] control;
wire [3:0] databus,operand,ALUR,Aout;
wire [11:0] address,loadAdd;
wire [7:0] progbyte;
wire [6:0] uRomAddress;
wire [1:0] CarryZero;
logic clk,reset;


PC ProgCounter(.LOAD(loadAdd),.reset(reset),.loadE(~control[14]),.incPC(control[15]),.clk(clk),.INS(address));

FFT Phase(.clk(clk),.reset(reset),.T(1'b1),.Q(uRomAddress[0]));

FFD2 CZ(.clk(control[12]),.reset(reset),.D(~CarryZero),.Q(uRomAddress[2:1]));

ControlROM uROM(.address(uRomAddress),.ProgOut(control));

ProgROM pROM(.address(address),.ProgOut(progbyte));

FFD8 Fetch(.clk(clk),.reset(reset),.D(progbyte),.Q({uRomAddress[6:3],operand}));

TristateB Oper(.tri_en(~control[1]),.entrada(operand),.salida(databus));

FFD4 A(.clk(control[13]),.reset(reset),.D(ALUR),.Q(Aout));

ALU ALU(.A(Aout),.B(databus),.S(control[10:6]),.nCin(control[11]),.Cout(CarryZero[1]),.eq(CarryZero[0]),.Result(ALUR));

//TristateB TriALU(.tri_en(~control[3]),.entrada(ALUR),.salida(databus));

assign W=Aout;
assign getAdd=address;

initial begin
    $display("\t\tTime\t\t clk \t phase \t\t progByte \t ALUR \t \t control \t Aout ");
    $monitor("%d \t \t %b \t %b \t %b \t %b \t %b \t\t %b \t %b",$time, clk,uRomAddress,progbyte,ALUR,control,Aout, CarryZero);
    //Initial values
    clk=0;
	reset=0;
	
	
    //Start
	#1 reset=1;
	#1 reset=0;
	
  end
  
  initial begin
    #100 $finish;
  end
  
 always
    #2 clk = ~clk;
	
  
  initial 
    begin
  	  $dumpfile("dump.vcd");
  	  $dumpvars(1);
    end

endmodule


