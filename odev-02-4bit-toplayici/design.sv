module toplayici(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] toplam,
    output cout
);

assign {cout, toplam} = {1'b0, a} + {1'b0, b} + cin;

endmodule
