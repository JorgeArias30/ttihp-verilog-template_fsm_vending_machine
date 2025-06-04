`default_nettype none
// `include "fsm_top.v"

module tt_um_fsm_vending_machine_JorgeArias30(



    input  wire [7:0] ui_in,     // ui_in[0]: moneda (m), ui_in[1]: aceptar (a), ui_in[2]: reset FSM Moore, ui_in[3]: reset FSM Mealy
    output wire [7:0] uo_out,    // uo_out[0]: señal de dispensado, uo_out[3:1]: producto, uo_out[6:4]: crédito
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire clk,
    input  wire ena,
    input  wire rst_n
);

    // Señales internas
    wire int_clk;
    wire [2:0] credit;
    wire dispense_signal;
    wire [2:0] producto;

    // Prescaler de reloj
    clock_prescaler clk_prsc (
        .clk(clk),
        .clk_out(int_clk)
    );

    // FSM tipo Moore: maneja el crédito
    moore moore_inst (
        .clk(int_clk),
        .reset(ui_in[2]),     // reset Moore FSM
        .m(ui_in[0]),         // moneda insertada
        .a(ui_in[1]),         // aceptar moneda
        .dispense(dispense_signal),
        .c(credit)
    );

    // FSM tipo Mealy: maneja la entrega del producto
    mealy mealy_inst (
        .clk(int_clk),
        .reset(ui_in[3]),     // reset Mealy FSM
        .C(credit),
        .K(dispense_signal),
        .A(uo_out[0]),        // señal de dispensado
        .P(producto)          // producto entregado
    );

    // Salida combinada
    assign uo_out[0]   = dispense_signal; // señal de dispensado
    assign uo_out[3:1] = producto;        // código del producto
    assign uo_out[6:4] = credit;          // crédito actual
    assign uo_out[7]   = 1'b0;            // sin uso

    // Pines bidireccionales en alta impedancia
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule


endmodule
