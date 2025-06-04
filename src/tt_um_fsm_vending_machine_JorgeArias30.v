`default_nettype none
`include "fsm_top.v"

module tt_um_fsm_vending_machine_JorgeArias30(

  input  wire [3:0] ui_in,
  output wire [2:0] product,
  output wire [2:0] credit
  output wire [5:0] uo_out;

  input  wire clk;
  input  wire ena;
  input  wire rst_n;
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

  wire [0]   m       = ui_in;
  wire [1]   a       = ui_in;
  wire [2]   btnC    = ui_in;
  wire [3]   btnD    = ui_in;
  wire [2:0] product = uo_out;
  wire [5:3] credit  = uo_out;

  
  
  

fsm_top fsm_vending_machine(
    input clk,
    input m,
    input a,
    input btnC,
    input btnD,
    output d,
    output [2:0] p,
    output [2:0] c
);
