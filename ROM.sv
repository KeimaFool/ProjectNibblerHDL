/////////////////////////////
//Sang Woo Shin 15372
//ROMs
//Procesador
////////////////////////////

module ProgROM #(parameter N=12,M=8)(input logic [N-1:0] address, output logic[M-1:0] ProgOut);

	logic [N-1:0] memory [0:500];
	
	assign ProgOut=memory[address];
	
	initial begin
		$readmemb("CodeROM.list",memory);
	end
endmodule

module ControlROM #(parameter N=7,M=16)(input logic [N-1:0] address, output logic[M-1:0] ProgOut);

	always @(*)begin
		casex(address) //i3-i2-i1-i0-/C-/Z-Phase  
			7'bxxxxxx0: ProgOut<=16'b1111100000110111; //any
			7'b00000x1: ProgOut<=16'b0011100000110111; //JC
			7'b00001x1: ProgOut<=16'b1111100000110111; //JC
			7'b00010x1: ProgOut<=16'b1111100000110111; //JNC
			7'b00011x1: ProgOut<=16'b0011100000110111; //JNC
			7'b0010xx1: ProgOut<=16'b0110000110111101; //CMPI
			7'b0011xx1: ProgOut<=16'b1110000110011111; //CMPM
			7'b0100xx1: ProgOut<=16'b0100011010111101; //LIT
			7'b0101xx1: ProgOut<=16'b0100011010111011; //IN
			7'b0110xx1: ProgOut<=16'b1100011010011111; //LD
			7'b0111xx1: ProgOut<=16'b1111100000000111; //ST
			7'b1000x01: ProgOut<=16'b0011100000110111; //JZ
			7'b1000x11: ProgOut<=16'b1111100000110111; //JZ
			7'b1001x01: ProgOut<=16'b1111100000110111; //JNZ
			7'b1001x11: ProgOut<=16'b0011100000110111; //JNZ
			7'b1010xx1: ProgOut<=16'b0100101001111101; //ADDI
			7'b1011xx1: ProgOut<=16'b1100101001011111; //ADDM
			7'b1100xx1: ProgOut<=16'b0011100000110111; //JMP
			7'b1101xx1: ProgOut<=16'b0111100000110110; //OUT
			7'b1110xx1: ProgOut<=16'b0100010001111101; //NORI
			7'b1111xx1: ProgOut<=16'b1100010001011111; //NORM
			default: 	ProgOut<=16'b0111100000111111;
		endcase
	
	end
endmodule