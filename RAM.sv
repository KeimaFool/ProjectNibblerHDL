/////////////////////////////
//Sang Woo Shin 15372
//RAM(síncrono Single Port)
//Procesador
////////////////////////////

module RAM #(parameter N=12, M=4)(input logic clk, we,cs, input logic [N-1:0] address, inout wire [M-1:0] data);

logic [M-1:0] memory [0:4095];
logic [M-1:0] data_out;

assign data = (cs &&  ! we) ? data_out : 4'bz;

always @(posedge ~clk)begin //WRITE
	if(cs && we)begin
		memory[address]<=data;
	

	end
		//READ
	if(cs && !we)begin
		data_out<=memory[address];
	
	end
end

endmodule

