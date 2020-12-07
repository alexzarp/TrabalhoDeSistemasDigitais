// Multiplexador controlador 4x1

module mux(
    input signed [15:0] zero_zero,
                        zero_um,
                        um_zero,
                        um_um,
    input unsigned [1:0] seletor,
    output signed [15:0] saida
);

assign saida = seletor == 0 ? zero_zero : seletor == 1 ? zero_um : seletor == 2 ? um_zero : um_um;

endmodule