`timescale 1ns / 1ps


module DM(
  
input wire clk,
input wire [63:0] address,
input wire [63:0] write_data,
input wire mem_write,
input wire mem_read,
output reg [63:0] read_data
);

reg [63:0] memory [0:255];  

integer i;
initial
    begin
    for(i=0;i<10;i=i+1)
    begin
   memory[i]=i;
    end
    end

 always @(posedge clk) begin
   if (mem_write) 
   begin
   memory[address] <= write_data;  
    end
    end

 always @(mem_read,address) 
 begin
  if (mem_read) 
  begin
    read_data = memory[address]; 
    end 
    else 
    begin
      read_data = 64'b0;  
    end
    end
endmodule
