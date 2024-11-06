`timescale 1ns / 1ps

module cnt_op(
input [31:0]A,
input reset,clk,
input [63:0] imm,
 output Branch, 
 cout,zero,    
output MemRead,
output MemtoReg,
output MemWrite,
output ALUSrc,
output RegWrite,
output [3:0] ALUControl
,output [63:0]result,
output [63:0]readData1,
output [63:0]readData2,
output [63:0]writeData

    );
    wire[63:0] ALUIn2,DM_out;

 
    control  u1(
       .inst(A), 
       .reset(reset) ,
       .Branch(Branch) ,    
       .MemRead(MemRead),
       .MemtoReg(MemtoReg),
       .MemWrite(MemWrite),
       .ALUControl(ALUControl),
       .ALUSrc(ALUSrc),
       .RegWrite(RegWrite)
    );
    
  RF1 RF(
             .readData1(readData1),.readData2(readData2),.writeData(writeData),.RegWrite(RegWrite),.clk(clk),. readReg1(A[19:15]) ,.readReg2(A[24:20]),.writeReg(A[11:7])
         );
  mux mux2(.sel(ALUSrc),.in0(readData2),.in1(imm),.out(ALUIn2));
  
  DM DM(
         
     .clk(clk),
      .address(result),                           
     . write_data(readData2),
    . mem_write(MemWrite),
    . mem_read(MemRead),
     . read_data(DM_out)
       );  
     
   ALU u4( .x(readData1),.y(ALUIn2),.ALUControl(ALUControl),.cout(cout),.zero(zero),.result(result));
    
    
    mux mux3(.sel(MemtoReg),.in0(result),.in1(DM_out),.out(writeData));
    
endmodule
