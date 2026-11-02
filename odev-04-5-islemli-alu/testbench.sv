`ifndef SECIM
`define SECIM 0
`endif

module testbench;

reg [3:0] a, b;
reg [2:0] select;
wire [7:0] sonuc;

alu uut(a, b, select, sonuc);

initial begin

a = 4'b0110;
b = 4'b0011;

select = `SECIM;
#10;

case (select)
    3'b000: $display("Islem: Toplama");
    3'b001: $display("Islem: Cikarma");
    3'b010: $display("Islem: AND");
    3'b011: $display("Islem: OR");
    3'b100: $display("Islem: Carpma");
    default: $display("Gecersiz secim");
endcase

$display("A = %b", a);
$display("B = %b", b);
$display("Sonuc = %b", sonuc);
$display("Sonuc (Ondalik) = %0d", sonuc);

$finish;

end

endmodule
