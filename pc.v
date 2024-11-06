`timescale 1ns / 1ps
module pc(
input [63:0]pcin,
input clk,rst,
output reg [63:0]pcout
);

always@(posedge clk,posedge rst) //trying negedge
begin
if(rst)
begin
pcout<=0;
end
else
begin
pcout<=pcin;
end

end

endmodule
