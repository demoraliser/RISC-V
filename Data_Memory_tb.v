`timescale 1ns / 1ps

module DM_tb(

    );
    reg clk,mem_write,mem_read;
    reg[63:0]address,write_data;
    wire [63:0]read_data;
    
    DM dut(clk,              
     address,   
     write_data,
    mem_write,        
    mem_read,         
     read_data  );
    integer i;
    always #10 clk=~clk;
    
    initial
    begin
    clk=1;#2 mem_read=1;
    for (i=0;i<10;i=i+1)
    begin
    address=i;
    #20;
    end
    #500 mem_read=0;mem_write=1;
        for (i=0;i<10;i=i+1)
    begin
    address=i;write_data=5*i;
    #20;
    end
    #500
    #2 mem_read=1;mem_write=0;
        for (i=0;i<10;i=i+1)
        begin
        address=i;
        #20;
        end
    end
    
endmodule
