`include "multiplexador.v"
`include "ula.v"

module bloco_operativo(
    input clock,
          h,
          LS,
          LX,
          LH,
    input [1:0] m0,
                m1,
                m2,
    input signed [15:0] a,
                        b,
                        c,
    input signed [7:0] x,
    output signed [15:0] result
);

wire signed [15:0] saida_m0,
                   saida_m1,
                   saida_m2,
                   saida_ula;

reg signed [15:0] Reg_S,
                  Reg_H,
                  Reg_X;

assign result = Reg_S;

// controle entrada dos regs
always @(posedge clock)
begin
    if (LX)
        Reg_X <= x;

    if (LS)
        Reg_S <= saida_ula;

    if (LH)
        Reg_H <= saida_ula;

end

ula ula1(h, clock, saida_m2, saida_m1, saida_ula);

multiplexador multiplexador0(a, a, b, c, m0/*controlador*/, saida_m0);
multiplexador multiplexador1(saida_m0, Reg_X, Reg_S, Reg_H, m1/*controlador*/, saida_m1);
multiplexador multiplexador2(Reg_X, saida_m0, Reg_S, Reg_H, m2/*controlador*/, saida_m2);

endmodule