// Code your design here

module mux4to1_8bit(
    input logic [7:0] in0,
    input logic [7:0] in1,
    input logic [7:0] in2,
    input logic [7:0] in3,
    input logic [1:0] sel,
    output logic [7:0] y
);

    always_comb begin
        case (sel)
            2'b00: y = in0;
            2'b01: y = in1;
            2'b10: y = in2;
            2'b11: y = in3;
            default: y = 8'b0;
        endcase
    end

endmodule
