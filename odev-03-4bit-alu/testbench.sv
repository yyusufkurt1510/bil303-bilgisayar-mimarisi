/*
4 Bit ALU Testi

EDA Playground - Compile Options:
-Wall -g2012 -DSECIM=0  Toplama
-Wall -g2012 -DSECIM=1  Cikarma
-Wall -g2012 -DSECIM=2  AND
-Wall -g2012 -DSECIM=3  OR

Run Options bos birakilir.
*/

`ifndef SECIM
`define SECIM 0
`endif

module testbench;

reg [3:0] a, b;
reg [1:0] select;
wire [3:0] sonuc;

alu uut(a, b, select, sonuc);

initial begin

a = 4'b0110;
b = 4'b0011;

select = `SECIM;
#10;

case (select)
    2'b00: $display("Islem: Toplama");
    2'b01: $display("Islem: Cikarma");
    2'b10: $display("Islem: AND");
    2'b11: $display("Islem: OR");
endcase

$display("A = %b", a);
$display("B = %b", b);
$display("Sonuc = %b", sonuc);

$finish;

end

endmodule
