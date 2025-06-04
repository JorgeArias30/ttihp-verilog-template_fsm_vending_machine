`default_nettype none
`include "fsm_top.v"

module tt_um_fsm_vending_machine_JorgeArias30(

  input  wire [4:0] ui_in,    // ui_in,
  output wire [6:0] uo_out,  // product, credit uo_out
  input wire  [4:0] uio_in,
  input wire  [6:0] uio_out,
  output wire [6:0] uio_oe,
//  output wire [13:0] uio_in,
//  output wire [13:0] uio_out, 
//  output wire [13:0] uo_oe,
  input  wire clk,
  input  wire ena,
  input  wire rst_n
/*
  input wire m,       // m - Moneda
  input wire a;       // a - Aceptado
  input wire btnC,    // btnC - Reset Moore
  input wire btnD,    // btnD - Reset Mealy
  input wire d,       // d - Entregar
*/

  );

// Señales internas
 wire       int_c;
 wire [2:0] credit;
 wire       disp_sign;

//  wire [0]   moneda    = ui_in;
  wire [1]   aceptado  = ui_in;
  wire [2]   btnC      = ui_in;
  wire [3]   btnD      = ui_in;
  wire [2:0] product   = uo_out;
  wire [5:3] credit    = uo_out;

  
  
  

fsm_top fsm_vending_machine(
  .clk(clk),
  .m(moneda),
  .a(aceptado),
  .btnC(btnC),
  .btnD(btnD),
  .d(disp_sign),
  .p(product),
  .c(credit)
);

endmodule
