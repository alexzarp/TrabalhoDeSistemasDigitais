`include "bloco_operativo.v"
`include "bloco_controle.v"
`include "multiplexador.v"

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

reg signed [15:0] Reg_S,
                  Reg_H,
                  Reg_X;

assign result = Reg_S;

wire signed [15:0] saida_m0,
                   saida_m1,
                   saida_m2,
                   saida_bloco_operativo;

wire [1:0] m0,
           m1,
           m2;

wire h,
     controle_LX,
     controle_LS,
     controle_LH;

always (@posedge clock)
begin
    if (controle_LX)
    begin
        Reg_X <= a;
    end

    if (controle_LS)
    begin
        Reg_S <= saida_bloco_operativo;
    end

    if (controle_LH)
    begin
        Reg_H <= saida_bloco_operativo;
    end
end

bloco_controle bloco_controle1(clock, start, reset, valid, ready, h, Reg_X, Reg_H, Reg_S, m0, m1, m2);
bloco_operativo bloco_operativo1(clock, a, b, c, x, h, Reg_X, Reg_H);

multiplexador multiplexador0(a, a, b, c, m0/*controlador*/, saida_m0);
multiplexador multiplexador1(saida_m0, Reg_X, Reg_S, Reg_H, m1/*controlador*/, saida_m1);
multiplexador multiplexador2(Reg_X, saida_m0, Reg_S, Reg_H, m2/*controlador*/, saida_m2);

endmodule