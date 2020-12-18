// mux 4x1
module mux(
    input signed [15:0] a,
                        b,
                        c,
                        d,
    input unsigned [1:0] sel,
    output signed [15:0] out
);

assign out = sel == 0 ? a : sel == 1 ? b : sel == 2 ? c : d; 

endmodule
