//---------------------------------------
//Sang Woo Shin 15372
//Lab 7 - Testbench
//Processor
//----------------------------------------

`include "Board.sv"



module testbench();
  
  parameter N=4;
  logic clk,reset,en;
  logic [11:0] address;
  logic [3:0] W;
  
  Board Bread(.clk(clk),.reset(reset),.getAdd(address),.W(W));
  
  initial begin
    $display("\t\tTime\t\t clk \t reset \t address \t W");
    $monitor("%d \t \t %b \t %b \t %d \t %d ",$time, clk,reset,address,W);
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