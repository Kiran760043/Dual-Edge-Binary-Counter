///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Dual Edge Binary Counter
// Engineer: kiran
// Reference: https://www.youtube.com/watch?v=zmOy5XPrjQk
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module test_bench();
    //inputs for the DUT
        reg clk;
        reg rst;
    //outputs form the DUT
        wire [3:0]out;
        
        dual_edge_counter DUT (.clk(clk),.rst(rst),.out(out));
    
    initial 
        begin
            $display($time," << Simulation Results >> ");
            $monitor($time,"clk = %b, rst = %b, out = %b",clk,rst,out);
        end
    
    always #5 clk = ~clk;
    
    initial
        begin
            rst = 1;
            clk = 0;
            #10
            rst = 0;
            #100
            rst = 1;
            #10
            rst = 0;
            #100
            $finish;
            
        end
        
endmodule

