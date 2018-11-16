/////////////////////////////
//Sang Woo Shin 15372
//Decoders for I/O
//Procesador
////////////////////////////

module Decoder #(parameter N=4,M=16)(input logic load,clk,input logic [N-1:0] binary, output logic [M-1:0] onehot);
	
	
	always @(clk)begin
		if (load)begin
			case(binary)
				4'd0:  onehot<=16'b0000000000000001;
				4'd1:  onehot<=16'b0000000000000010;
				4'd2:  onehot<=16'b0000000000000100;
				4'd3:  onehot<=16'b0000000000001000;
				4'd4:  onehot<=16'b0000000000010000;
				4'd5:  onehot<=16'b0000000000100000;
				4'd6:  onehot<=16'b0000000001000000;
				4'd7:  onehot<=16'b0000000010000000;
				4'd8:  onehot<=16'b0000000100000000;
				4'd9:  onehot<=16'b0000001000000000;
				4'd10: onehot<=16'b0000010000000000;
				4'd11: onehot<=16'b0000100000000000;
				4'd12: onehot<=16'b0001000000000000;
				4'd13: onehot<=16'b0010000000000000;
				4'd14: onehot<=16'b0100000000000000;
				4'd15: onehot<=16'b1000000000000000;
				default: onehot<=16'b0;
			endcase
		end
		if (~load) begin
			onehot<=16'b0;
			
		end
		end
	
	


endmodule