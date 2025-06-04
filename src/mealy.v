module mealy(
    input clk,
    input reset,
    input [2:0] C,     // Crédito actual
    input K,           // Señal de dispensación (desde Moore)
    output reg A,      // Producto fue dispensado
    output reg [2:0] P // Código del producto entregado
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 1'b0;
            P <= 3'b000;
        end else begin
            if (K) begin
                A <= 1'b1;
                case (C)
                    3'b001: P <= 3'b001; // Chocolate pequeño
                    3'b010: P <= 3'b010; // Nacho
                    3'b011: P <= 3'b011; // Galleta
                    3'b100: P <= 3'b100; // Gaseosa en lata
                    3'b101: P <= 3'b101; // Gaseosa en botella 450ml
                    default: P <= 3'b000; // Ningún producto
                endcase
            end else begin
                A <= 1'b0;
                P <= 3'b000;
            end
        end
    end

endmodule
