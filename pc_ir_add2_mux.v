`timescale 1ns / 1ps


module pc_ir_add2_mux(
input start,clk,sel,
input [63:0]t3,
output [31:0]inst
    );
    
     wire [63:0]pcout,t1,t0,pcin;
     reg [63:0]r1=64'd4;
    
     pc pc_dut(            
  .pcin(pcin),     
  .clk(clk),
  .rst(start),        
  .pcout(pcout));    

    IR IR_dut(              
   .address_in(pcout),
   .inst(inst));
   
       adder add1(        
  .x(pcout),
  .y(r1),     
  .sum(t0),
  . c( ) );
   
   adder add2(        
  .x(pcout),
  .y(t3),     
  .sum(t1),
  . c( ) );    
  
  mux mux1(
   .sel(sel), 
 .in0(t0),.in1(t1),  
   .out(pcin));

endmodule
