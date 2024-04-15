`timescale 1ns / 1ps

module adder8(
	output overflow,
    output cout, //MSB, determines if answer is positive or negative
    output [7:0] s,
    input [7:0] x,
    input [7:0] y,
    input cin // if 1, subtract, if 0, add. This is XOR'ed with b
    );
    
    wire [7:0] yin;
    assign yin[0] = y[0]^cin;
    assign yin[1] = y[1]^cin;
    assign yin[2] = y[2]^cin;
    assign yin[3] = y[3]^cin;
    assign yin[4] = y[4]^cin;                          
    assign yin[5] = y[5]^cin;
    assign yin[6] = y[6]^cin;
    assign yin[7] = y[7]^cin;
    
      
    wire [8:1] carry; 
     full_adder FA0(carry[1],s[0],x[0],yin[0],cin);
     full_adder FA1(carry[2],s[1],x[1],yin[1],carry[1]);
     full_adder FA2(carry[3],s[2],x[2],yin[2],carry[2]);
     full_adder FA3(carry[4],s[3],x[3],yin[3],carry[3]);
     full_adder FA4(carry[5],s[4],x[4],yin[4],carry[4]);
     full_adder FA5(carry[6],s[5],x[5],yin[5],carry[5]);
     full_adder FA6(carry[7],s[6],x[6],yin[6],carry[6]);
     full_adder FA7(carry[8],s[7],x[7],yin[7],carry[7]);
     
     assign overflow = (x[7] & y[7] & ~s[7]) | (~x[7] & ~y[7] & s[7]);
     assign cout = cin^carry[8];
   
endmodule