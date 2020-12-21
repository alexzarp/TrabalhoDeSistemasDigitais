module boco_controle(
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
assign Reg_S = state 
assign m0 = state == 1 ? 0 : state == 2 ? 1 : state == 3 ? 2 : state == 4 ? 0 : 3;
assign m1 = 

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