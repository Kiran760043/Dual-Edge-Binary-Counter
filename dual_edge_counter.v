///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Dual Edge Binary Counter
// Engineer: kiran
// Reference: https://www.youtube.com/watch?v=zmOy5XPrjQk
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module dual_edge_counter(clk, rst, out);

    input  wire clk;
    input  wire rst;
    output wire [3:0]out;
    
    reg [3:0]count;
    reg [3:0]countb;
        
    always@(posedge clk or posedge rst)
        begin   
            if(rst)begin
                count <= 4'h0;
            end else begin
                count <= count + 1;
            end      
        end
        
    always@(negedge clk or negedge rst)
        begin   
            if(rst)begin
                countb <= 4'h0;
            end else begin
                countb <= countb + 1;
            end      
        end
    
    assign out = count + countb;
endmodule
