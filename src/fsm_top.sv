module fsm_top(
    input logic clk,
    input logic m, a,
    input logic btnC, btnD,
    output logic d,                  // Producto fue dispensado (desde Mealy)
    output logic [2:0] p,            // Código del producto (desde Mealy)
    output logic [2:0] c             // Crédito acumulado (desde Moore)
);

    logic int_clk;
    logic [2:0] credit;
    logic dispense_signal;

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
