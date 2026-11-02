module alu(
    input [3:0] a,
    input [3:0] b,
    input [2:0] select,
    output reg [7:0] sonuc
);

always @(*) begin
    case (select)
        3'b000: sonuc = a + b;
        3'b001: sonuc = a - b;
        3'b010: sonuc = a & b;
        3'b011: sonuc = a | b;
        3'b100: sonuc = a * b;
        default: sonuc = 8'b00000000;
    endcase
end

endmodule
