module clock_prescaler(
    input clk,
    output clk_out
);

    reg [31:0] myreg;

    always @(posedge clk)
        myreg <= myreg + 1;

    assign clk_out = myreg[26];

endmodule
