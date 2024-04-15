`timescale 1ns / 1ps

module full_adder(
    output cout,
    output sum,
    input x,
    input y,
    input cin
    );
    
    assign sum = x ^ y ^ cin;
    assign cout = (x & y) | (x & cin) | (y & cin);
endmodule