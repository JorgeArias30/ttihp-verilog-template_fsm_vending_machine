module fsm_top(
    input clk,
    input m,
    input a,
    input btnC,
    input btnD,
    output d,
    output [2:0] p,
    output [2:0] c
);

    wire int_clk;
    wire [2:0] credit;
    wire dispense_signal;

    // Prescaler de reloj
    clock_prescaler clk_prsc (
        .clk(clk),
        .clk_out(int_clk)
    );

    // FSM tipo Moore
    moore moore_inst (
        .clk(int_clk),
        .reset(btnC),
        .m(m),
        .a(a),
        .dispense(dispense_signal),
        .c(credit)
    );

    // FSM tipo Mealy
    mealy mealy_inst (
        .clk(int_clk),
        .reset(btnD),
        .C(credit),
        .K(dispense_signal),
        .A(d),
        .P(p)
    );

    // Mostrar crédito acumulado
    assign c = credit;

endmodule
