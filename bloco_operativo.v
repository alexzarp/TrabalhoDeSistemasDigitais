module bloco_operativo (
    input h,
    input signed [15:0] a,
                        b,
                        
    output signed [15:0] o
);

assign o = h ? (a * b) : (a + b);

endmodule
