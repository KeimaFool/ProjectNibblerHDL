/////////////////////////////
//Sang Woo Shin 15372
//Tristates
//Procesador
////////////////////////////

module TristateB #(parameter N=4)(input logic tri_en, input logic [N-1:0] entrada, output wire [N-1:0] salida);

	assign salida = (tri_en) ? entrada: 4'bz;

endmodule