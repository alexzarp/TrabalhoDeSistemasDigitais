module ula (
    input h,
          clock, // TIRAR ISSO TB
    input signed [15:0] a,
                        b,
                        
    output signed [15:0] o
);

assign o = h ? (a * b) : (a + b);

// TODO TIRAR ISSO PLMDDS
always @(posedge clock)
begin
    $display("valores m2 = %d, m1 = %d, op = %d, result = %d", a, b, h, o);
end
endmodule
