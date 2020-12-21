module bloco_controle(
    input clock,
          start,
          reset,

    output valid,
           ready,
           h,
           Reg_X,
           Reg_H,
           Reg_S,

    output [1:0] m0,
                 m1,
                 m2
);

assign h = state == 1 ? 1 : state == 2 ? 1 : state == 3 ? 1 : 0;
assign Reg_H = state == 2 ? 1 : state == 4 ? 0;
assign Reg_S = state == 4 ? 1 : state == 5 ? 1 : state == 6 ? 1 : 0;
assign Reg_X = state == 1 ? 1 : 0;
assign m0 = state == 1 ? 0 : state == 2 ? 1 : state == 3 ? 2 : state == 4 ? 0 : 3;
assign m1 = state == 1 ? 1 : state == 2 ? 0 : state == 3 ? 0 : state == 4 ? 3 : 0;
assign m2 = state == 1 ? 0 : state == 2 ? 3 : state == 3 ? 0 : start == 4 ? 2 : state == 5 ? 2 : 0;
assign start = state == 1 ? 1 : 0;

    always @(posedge clock or reset)
    begin
        if (reset) begin
            state <= 0;
        end
        else begin
            if ((state == 0 && ~start) || state == 7)
                state <= state;
            else 
                state <= state + 1;
        end
        $display("state = %d, m0 = %d", state, m0);
    end

endmodule