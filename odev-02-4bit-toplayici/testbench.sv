module testbench;

reg [3:0] a, b;
reg cin;
wire [3:0] toplam;
wire cout;

toplayici uut(a, b, cin, toplam, cout);

initial begin

a = 4'd3;
b = 4'd2;
cin = 0;
#10;
$display("3 + 2 = %d", {cout, toplam});
if ({cout, toplam} !== 5'd5) $fatal(1, "Test hatasi");

a = 4'd5;
b = 4'd7;
cin = 0;
#10;
$display("5 + 7 = %d", {cout, toplam});
if ({cout, toplam} !== 5'd12) $fatal(1, "Test hatasi");

a = 4'd9;
b = 4'd6;
cin = 0;
#10;
$display("9 + 6 = %d", {cout, toplam});
if ({cout, toplam} !== 5'd15) $fatal(1, "Test hatasi");

a = 4'd15;
b = 4'd1;
cin = 0;
#10;
$display("15 + 1 = %d", {cout, toplam});
if ({cout, toplam} !== 5'd16) $fatal(1, "Test hatasi");

a = 4'd10;
b = 4'd5;
cin = 1;
#10;
$display("10 + 5 + 1 = %d", {cout, toplam});
if ({cout, toplam} !== 5'd16) $fatal(1, "Test hatasi");

$display("Tum testler basarili.");
$finish;

end

endmodule
