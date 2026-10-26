module alu(
    input [3:0] a,
    input [3:0] b,
    input [1:0] select,
    output reg [3:0] sonuc
);

always @(*) begin
    case (select)
        2'b00: sonuc = a + b;
        2'b01: sonuc = a - b;
        2'b10: sonuc = a & b;
        2'b11: sonuc = a | b;
        default: sonuc = 4'b0000;
    endcase
end

endmodule
