module moore(
    input logic clk,         // Señal de reloj
    input logic reset,       // Señal de reset asíncrona
    input logic m,           // Moneda insertada
    input logic a,           // Seleccionar producto
    output logic dispense,   // Señal de dispensación
    output logic [2:0] c     // Crédito acumulado
);

    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5} statetype;
    statetype current_state, next_state;

    // Registro de estado
    always_ff @(posedge clk, posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Lógica de transición y salida
    always_comb begin
        next_state = current_state;
        dispense = 1'b0;

        case (current_state)
            S0: begin
                if (m && !a) next_state = S1;
                end
            S1: begin
                if (m && !a) next_state = S2;
                else if (!m && a) begin
                    next_state = S0;
                    dispense = 1'b1;
                end
            end
            S2: begin
                if (m && !a) next_state = S3;
                else if (!m && a) begin
                    next_state = S0;
                    dispense = 1'b1;
                end
            end
            S3: begin
                if (m && !a) next_state = S4;
                else if (!m && a) begin
                    next_state = S0;
                    dispense = 1'b1;
                end
            end
            S4: begin
                if (m && !a) next_state = S5;
                else if (!m && a) begin
                    next_state = S0;
                    dispense = 1'b1;
                end
            end
            S5: begin
                if (!m && a) begin
                    next_state = S0;
                    dispense = 1'b1;
                end
            end
            default: begin
                next_state = S0;
                dispense = 1'b0;
            end
        endcase
    end

    // Lógica de salida del crédito
    always_comb begin
        case (current_state)
            S0: c = 3'b000;
            S1: c = 3'b001;
            S2: c = 3'b010;
            S3: c = 3'b011;
            S4: c = 3'b100;
            S5: c = 3'b101;
            default: c = 3'b000;
        endcase
    end

endmodule
