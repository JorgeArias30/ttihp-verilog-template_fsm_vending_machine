`default_nettype none
// `include "fsm_top.v"
module tt_um_fsm_vending_machine_JorgeArias30 (
    input  wire [7:0] ui_in,     // ui_in[0]: moneda (m), ui_in[1]: aceptar (a), ui_in[2]: reset FSM Moore, ui_in[3]: reset FSM Mealy
    output wire [7:0] uo_out,    // uo_out[0]: señal de dispensado, uo_out[3:1]: producto, uo_out[6:4]: crédito
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire clk,
    input  wire ena,
    input  wire rst_n
);

    // Señales internas
    wire int_clk;
    wire [2:0] credit;
    wire dispense_signal;
    wire [2:0] producto;

    // Prescaler de reloj 
    assign int_clk = clk;

    // Instancia del módulo FSM
    fsm_top fsm_inst (
        .clk(int_clk),
        .m(ui_in[0]),
        .a(ui_in[1]),
        .btnC(ui_in[2]),
        .btnD(ui_in[3]),
        .d(dispense_signal),
        .p(producto),
        .c(credit)
    );

    // Salida combinada
    assign uo_out[0]   = dispense_signal;
    assign uo_out[3:1] = producto;
    assign uo_out[6:4] = credit;
    assign uo_out[7]   = 1'b0;

    // Pines bidireccionales en alta impedancia
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
























/*module tt_um_fsm_vending_machine_JorgeArias30(
//    input  wire [7:0] ui_in,     // ui_in[0]: moneda (m), ui_in[1]: aceptar (a), ui_in[2]: reset FSM Moore, ui_in[3]: reset FSM Mealy
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


fsm_top fsm_inst (
                  .clk(int_clk),
                  .m([0]ui_in),
                  .a([1]ui_in),
                  .btnC([1]ui_in),
                  .btnD([1]ui_in),
                  .d([0]uio_out),
                  .p([1:3]uio_out),
                  .c([4:6]uio_out)
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
*/
