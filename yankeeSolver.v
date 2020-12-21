`include "bloco_operativo.v",
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

bloco_controle bloco_controle1(clock, start, reset, valid, ready, h, Reg_X, Reg_H, Reg_S, m0, m1, m2);
bloco_operativo bloco_operativo1(clock, a, b, c, x, h, Reg_X, Reg_H);

endmodule