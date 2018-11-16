//---------------------------------------
//Sang Woo Shin 15372
//Lab 7 - PC
//----------------------------------------

module ALU #(parameter N=4)(input logic [N-1:0] A,B, input logic [4:0] S, input logic nCin, output logic Cout, eq, output logic [N-1:0] Result);
  
  logic [N:0] Oper,Ans;
  
  always@(*)begin
    
    case(S)
      5'b00000: Ans[3:0]<=A;
      5'b00110: Ans<=A-B;
      5'b11010: Ans[3:0]<=B;
      5'b01001: Ans<=A+B;
      5'b10001: Ans[3:0]<=A[3:0]~|B[3:0];
	default: Ans=0;
	
    endcase
      
    Cout=Ans[4];
    Result<={Ans[3:0]};
   
  end
  
  always @(*)begin
  if (Ans[3:0]==4'b0)begin
      eq=1;	
    end
    else begin
      eq=0;
    end
	end
  endmodule
    