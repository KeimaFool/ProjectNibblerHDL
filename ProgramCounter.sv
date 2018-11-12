//---------------------------------------
//Sang Woo Shin 15372
//Lab 7 - PC
//----------------------------------------



module PC #(parameter N=12)(input logic [N-1:0] LOAD, input logic reset,loadE,incPC, clk, output logic [N-1:0] INS);
  
  always @ (posedge clk or posedge reset)begin
    if (reset)begin
    INS<=0;
    end
    else begin
      
      if (loadE)INS<=LOAD;
      
      if (incPC) INS<=INS+1;
      
    end
    
  end
    
endmodule