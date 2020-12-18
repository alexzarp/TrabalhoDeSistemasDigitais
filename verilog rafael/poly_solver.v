`include "cb.v"
`include "ula.v"
`include "mux.v"

module poly_solver
(
    input clock,
          start,
          reset,
    input signed [7:0] _x,
    input signed [15:0] a,
                        b,
                        c,
    output ready,
           valid,
    output signed [15:0] y
);

reg signed [15:0] Reg_S, // reg da esq
                  Reg_H, // reg da dir
                  Reg_x;

assign y = Reg_S;

wire signed [15:0] out_m0, // saída do mux0
                   out_m1, // saída do mux1
                   out_m2, // saída do mux2
                   out_ula; // saída da ula

wire [1:0] m0, // controle do mux0
           m1, // controle do mux1
           m2; // controle do mux2

wire h,
     lx,
     ls,
     lh;

// enables dos regs
always @(posedge clock)
begin
    if(lx)
    begin
        Reg_x <= _x; // casting para 16 bits com representação em complemento de 2
    end

    if(ls)
    begin
        Reg_S <= out_ula;
    end

    if(lh)
    begin
        Reg_H <= out_ula;
    end

end

cb cb0(clock, start, reset, m0, m1, m2, h, lx, ls, lh, ready, valid);

mux mux0(a, a, b, c, m0, out_m0); // a como argumento duplo apenas para evitar erros de compilação/simulação
mux mux1(out_m0, Reg_x, Reg_S, Reg_H, m1, out_m1);
mux mux2(Reg_x, out_m0, Reg_S, Reg_H, m2, out_m2);

ula ula0(h, out_m2, out_m1, out_ula);

endmodule