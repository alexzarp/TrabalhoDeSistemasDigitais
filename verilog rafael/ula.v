module ula
(
    input h,
    input signed [15:0] _x, // complemento de 2
                        _y, // complemento de 2
    output signed [15:0] _z // complemento de 2
);

assign _z = (h) ? (_x * _y) : (_x + _y);

endmodule
