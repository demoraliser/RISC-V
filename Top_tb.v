`timescale 1ns / 1ps


module Top1_tb(

    );
    
    reg reset,clk,start;
    wire [63:0]readData1,readData2,ALUOut,writeData;
    wire [31:0]inst;
    
        wire [63:0]ALUIn2,imm_out,DM_out;
        wire [3:0] ALUControl;
        wire Branch,cout,zero,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite; 
    
    Top1 dut(.reset(reset),.clk(clk),.start(start),
   . readData1(readData1),.readData2(readData2),
   . ALUOut(ALUOut),
   . inst(inst),
   . writeData(writeData),
    .ALUIn2(ALUIn2),
    .imm_out(imm_out),
    .DM_out(DM_out),
    .ALUControl(ALUControl),
    .Branch(Branch),
    .cout(cout),
    .zero(zero),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite)
        );
        
      always #10  clk=~clk;
        
        initial
        begin
        clk=1;start=1;reset=0;
        #5 start=0;
        
        #2000 $finish;
        end
        
endmodule
