`timescale 1ns / 1ps

module mux(input sel,
input [63:0]in0,in1,
output reg[63:0] out);

always@(sel,in0,in1)
begin
case(sel)
1'b0:
     begin
          out=in0;
     end
     
1'b1:
     begin
          out=in1;
     end
endcase
end

endmodule
