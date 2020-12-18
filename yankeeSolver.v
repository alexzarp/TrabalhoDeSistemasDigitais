`include "multiplexador.v"

module yankeeSolver (
    input clock,
          start,
          reset,  
    input signed [7:0] x,
    input signed [15:0] a,
    input signed [15:0] b,
    input signed [15:0] c,
    input enable,
    input reset,
    output signed [15:0] result,

    output ready,
    output valid
);

reg signed [15:0] Reg_S, //registrador da soma
                  Reg_H, //registrador da multiplicação
                  Reg_X; //registrador que contém o X

assign result = Reg_S;

reg [3:0] state;

wire signed [15:0] saida_m0,
                   saida_m1,
                   saida_m2,
                   saida_ula;

reg [15:0] temp;

assign valid = state == 15;
assign ready = state == 0;

assign result = a * x * x + b * x + c;

always @(posedge clock or reset)
begin
    if (reset) begin
        state <= 0;
    end
    else begin
        if (state == 0 && ~enable)
            state <= state;
        else 
            state <= state + 1;
    end
end


endmodule