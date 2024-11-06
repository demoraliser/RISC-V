`timescale 1ns / 1ps

module adder(
input [63:0]x,y,
output reg [63:0]sum,
output reg c
    );
 always @(x,y)
 begin
 {c,sum}=x+y;

 end
 endmodule
