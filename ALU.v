`timescale 1ns / 1ps

module ALU(x,y,ALUControl,cout,zero,result);
input [63:0]x,y;
input [3:0]ALUControl;
output reg cout;
output reg[63:0]result;
output reg zero;

always @(x,y,ALUControl)
begin
case(ALUControl)
4'b0010:{cout,result}=x+y;
4'b0110:{cout,result}=x-y;
4'b0000:result=x&y;
4'b0001:result=x|y;
default:result=64'bx;
endcase

if(result==0)
            begin
                 zero=1;
            end
else
    begin
         zero=0;
    end

end
endmodule
