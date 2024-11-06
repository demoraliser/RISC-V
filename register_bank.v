`timescale 1ns / 1ps

module RF1(
    readData1,readData2,writeData,RegWrite,clk,  readReg1 ,readReg2,writeReg
);
    input clk,RegWrite;
   input [4:0]readReg1 , readReg2,writeReg;
    input[63:0] writeData;
    output reg [63:0]  readData1,readData2;
    
    
 integer i;
    reg[63:0] RF[31:0];
    initial
    begin
    for(i=0;i<10;i=i+1)
    begin
    RF[i]=i;
    end

    
    end
    always @(readReg1,readReg2)
    begin
    readData1 = RF[readReg1];
    readData2 = RF[readReg2];
     end
    always @(posedge clk)
        if (RegWrite) 
                     begin
                          RF[writeReg]<=writeData;
                     end     
endmodule
