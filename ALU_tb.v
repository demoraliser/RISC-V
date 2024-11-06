`timescale 1ns / 1ps


module ALU_tb(

    );
    reg [63:0]x,y;
    reg [3:0]ALUControl;
    wire  cout;
    wire [63:0]result;
    wire  zero;
    
    ALU a(x,y,ALUControl,cout,zero,result);
    
    initial
    begin
    #10 x=64'b1;y=64'b0;ALUControl=4'b0010;
    #10 x=64'b110;y=64'b011;ALUControl=4'b0110;
    #10 x=64'b110;y=64'b001;ALUControl=4'b0000;
    #10 x=64'b110;y=64'b011;ALUControl=4'b0001;
    #100 $finish;
    end
endmodule
