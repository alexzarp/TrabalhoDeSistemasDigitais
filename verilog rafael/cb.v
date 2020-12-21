module cb
(
    input clock,
          start,
          reset,
    output [1:0] m0, // controle do mux0
                 m1, // controle do mux1
                 m2, // controle do mux2
    output h, // controle de qual operação deve ser feita no ciclo atual
           lx, // enable do Reg_X
           ls, // controle do Reg_S
           lh, // controle do Reg_H
           ready, // sinal para se está pronto para começar (estado A)
           valid // sinal para se terminou o cálculo
);

reg [3:0] state;

assign h = ~state[2] | (~state[1] & ~state[0]);
assign lx = ~state[2] & ~state[1];
assign ls = ~state[2] | (~state[1] & state[0]) | (state[1] & ~state[0]);
assign lh = 1;
assign m0[1] = ~state[0] | (state[2] & state[1]);
assign m0[0] = state[1];
assign m1[1] = state[0];
assign m1[0] = ~state[2] | (~state[1] & ~state[0]);
assign m2[1] = (~state[1] & state[0]) | (state[2] & state[1]);
assign m2[0] = state[0] | state[2];
assign ready = (~state[2] & ~state[1]) & ~state[0];
assign valid = (state[3] & ~state[2]) & (~state[1] & ~state[0]);

always @(reset)
begin
    state = 0;
end

always @(posedge clock)
begin
    // vergonha dessa parte do código, talvez depois eu volte nisso e corrija
    if(state == 9)
        state = 0;

    else if(state != 0 || (state == 0 && start))
        state = state + 1;
end

endmodule