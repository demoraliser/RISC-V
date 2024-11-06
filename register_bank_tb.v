`timescale 1ns / 1ps


module RF_tb(

    );
       wire [63:0]readData1,readData2;
    reg [63:0]writeData;reg [63:0]inst;
    reg RegWrite,clk;
              reg [4:0] readReg1,readReg2 ,writeReg;



RF1 dut( 
    readData1,readData2,writeData,RegWrite,clk, readReg1 ,readReg2,writeReg
);

    always #1 clk=~clk;
    
    initial begin
    
//       inst [19:15]       =readReg1;
//       inst   [24:20]     =readReg2 ;
//       inst    [11:7]     =writeReg;
           
    clk=1'b0;RegWrite=0;
       $monitor(" Time=%d,  readData1=%b",$time,  readData1);
    #2 readReg1=5'b00011;
    #2 readReg2=5'b00001;
//    #2 readReg1=5'b00010;
//    #2 readReg1=5'b00011;
//    #2 readReg1=5'b00100;
//    #2 readReg1=5'b00101;
//    #2 readReg1=5'b00110;
//    #2 readReg1=5'b00111;
//    #2 readReg1=5'b01000;
//    #2 readReg1=5'b01001;
    #201 
    RegWrite=1;writeData=64'd5;writeReg=5'd0;
    #20 $finish;
    end
    
endmodule
