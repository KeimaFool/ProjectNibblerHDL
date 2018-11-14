//---------------------------------------
//Sang Woo Shin 15372
//Lab 7 - Testbench
//Processor
//----------------------------------------

`include "Board.sv"



module testbench();
  
  parameter N=4;
  logic clk,reset,C,Z;
  logic [N-1:0] Accu,In0,In1,In2,Out0,Out1,Out2;
  logic [15:0] test;
  
  Board Processor(.clk(clk), .reset(reset), .C(C),.Z(Z), .Accu(Accu),.In0(In0),.In1(In1),.In2(In2),.Out0(Out0),.Out1(Out1),.Out2(Out2));
  
  initial begin
    $display("\t\tTime\t\t clk \t reset \t C \t Z \t Accu \t In0 \t In1 \t In2 \t Out0 \t Out1 \t Out2");
    $monitor("%d \t \t %b \t %b \t %b \t %b \t %d \t %d \t %d \t %d \t %d \t\t %d \t %d ",$time, clk,reset,C,Z,Accu, In0,In1,In2,Out0,Out1,Out2);
	
	
    //Initial values
    clk=0;
	reset=0;
	In0=0;
	In1=0;
	In2=0;
	
	
    //Start
	#1 reset=1;
	#1 reset=0;
	
	
  end
  
  initial begin
    #200 $finish;
  end
  
 always
    #2 clk = ~clk;
	
  
  initial 
    begin
  	  $dumpfile("dump.vcd");
  	  $dumpvars(1);
    end
endmodule