/////////////////////////////
//Sang Woo Shin 15372
//FlipFlops(D y T)
//Procesador
////////////////////////////

module FFT(input logic clk,T,reset, output logic Q);
	
always @(posedge clk or posedge reset)begin
	if (T && clk)begin
		Q=~Q;
	end
	
	if (reset)begin
		Q=0;
	end
end

endmodule

module FFD8 #(parameter N=8)(input logic clk, reset, input logic [N-1:0] D, output logic [N-1:0] Q);

always @(posedge clk or posedge reset)begin
	if (reset)begin
		Q<=0;
	end
	
	if (clk)begin
		Q<=D;
	end
	end
endmodule

module FFD4 #(parameter N=4)(input logic clk, reset, input logic [N-1:0] D, output logic [N-1:0] Q);

always @(posedge clk or posedge reset)begin
	if (reset)begin
		Q<=0;
	end
	
	if (clk)begin
		Q<=D;
	end
	end
endmodule

module FFD2 #(parameter N=2)(input logic clk, reset, input logic [N-1:0] D, output logic [N-1:0] Q);

always @(posedge clk or posedge reset)begin
	if (reset)begin
		Q<=0;
	end
	
	if (clk)begin
		Q<=D;
	end
end

endmodule