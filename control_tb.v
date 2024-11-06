`timescale 1ns / 1ps

module control_tb(

    );
    
    reg [31:0] A;           
    reg  reset;           
        wire Branch,         
        MemRead,        
        MemtoReg,       
        MemWrite,       
        
        ALUSrc,         
        RegWrite   ;
        wire [3:0]ALUControl;  
        
        
        control dut(             
        A,            
         reset,            
         Branch,          
         MemRead,         
         MemtoReg,        
         MemWrite,        
        ALUControl,  
         ALUSrc,          
         RegWrite);
         

         initial
         begin
        
          reset=1;A=32'b0;#5 reset=0;
        #35 A=32'b0000000_00000_00001_000_00010_0110011;//add
         #20 A=32'b0100000_00000_00001_000_00010_0110011;//sub
         #20 A=32'b0000000_00000_00001_111_00010_0110011;//and
         #20 A=32'b0000000_00000_00001_110_00010_0110011;//or
        
         #20 A=32'b0000000_00000_00001_110_00010_0000011;//load
         #20 A=32'b0000000_00000_00001_110_00010_0100011;//store
         
         #20 A=32'b0000000_00000_00001_110_00010_1100011;//branch
         
      
      #20 $finish;
         end
        
                     
endmodule
