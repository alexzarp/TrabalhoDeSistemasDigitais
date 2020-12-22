`include "bloco_operativo.v"
`include "bloco_controle.v"

module yankeeSolver (
    input clock,
          start,
          reset,  
    input signed [7:0] x,
    input signed [15:0] a,
    input signed [15:0] b,
    input signed [15:0] c,
    output signed [15:0] result,

    output ready,
    output valid
);

wire [1:0] m0,
           m1,
           m2;

wire h,
     LX,
     LS,
     LH;

bloco_controle bloco_controle1(clock, start, reset, valid, ready, h, LX, LH, LS, m0, m1, m2);
bloco_operativo bloco_operativo1(clock, h, LS, LX, LH, m0, m1, m2, a, b, c, x, result);
endmodule