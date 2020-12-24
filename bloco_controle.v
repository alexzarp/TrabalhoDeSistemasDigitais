module bloco_controle(
    input clock,
          start,
          reset,

    output valid,
           ready,
           h,
           LX,
           LH,
           LS,

    output [1:0] m0,
                 m1,
                 m2
);

reg [2:0] state;

assign h = state == 1 ? 1 : state == 2 ? 1 : state == 3 ? 1 : state == 4 ? 1 : 0;
assign LS = state == 2 ? 1 : state == 3 ? 0 : state == 4 ? 1 : state == 5 ? 0 : state == 6 ? 1 : state == 7 ? 0 : state == 8 ? 0 : 0;
assign LH = state == 2 ? 0 : state == 3 ? 1 : state == 4 ? 0 : state == 5 ? 1 : 0;
assign LX = state == 1 ? 1 : state == 2 ? 0 : state == 3 ? 0 : 0;
assign m0 = state == 3 ? 1 : state == 4 ? 2 : state == 6 ? 3 : 0;
assign m1 = state == 2 ? 1 : state == 3 ? 0 : state == 4 ? 0 : state == 5 ? 3 : state == 6 ? 3 : 0;  
assign m2 = state == 2 ? 0 : state == 3 ? 2 : state == 4 ? 0 : state == 5 ? 2 : state == 6 ? 1 : 0;
assign ready = state == 0 ? 1 : 0; 
assign valid = state == 7 ? 1 : 0;

    always @(posedge clock or reset)
    begin
        if (reset)
            state <= 0;
        else begin
            if ((state == 0 && ~start) || state == 7)
                state <= 0;
            else 
                state <= state + 1;
        end
    end

endmodule