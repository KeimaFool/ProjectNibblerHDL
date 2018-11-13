//---------------------------------------
//Sang Woo Shin 15372
//Lab 7 - Testbench
//Processor
//----------------------------------------

`include "RAM.sv"



module testbench();
  
  parameter N=4;
  logic clk,we,cs,reset;
  logic [11:0] address;
  logic [3:0] data;
  
  RAM RAMY(.clk(clk), .we(we), .cs(cs), .address(address),.data(data));
  
  initial begin
    $display("\t\tTime\t\t clk \t we \t cs \t add \t data");
    $monitor("%d \t \t %b \t %b \t %b \t %d \t %d ",$time, clk,we,cs,address,data);
    //Initial values
    clk=0;
	reset=0;
	we=0;
	cs=0;
	address=0;
	
	
    //Start
	#1 reset=1;
	#1 reset=0;
	address=12'd20;
	#5 cs=1;
	we=1;
	#5 cs=0;
	#5 address=12'd5;
	#5 cs=1;
	we=0;
	
	
	
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