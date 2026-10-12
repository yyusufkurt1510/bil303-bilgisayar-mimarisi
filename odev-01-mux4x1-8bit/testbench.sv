// Code your testbench here
// or browse Examples

module tb;

    logic [7:0] in0, in1, in2, in3;
    logic [1:0] sel;
    logic [7:0] y;

    mux4to1_8bit dut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .y(y)
    );

    initial begin
        in0 = 8'd10;
        in1 = 8'd20;
        in2 = 8'd30;
        in3 = 8'd40;

        sel = 2'b00;
        #10;
        $display("sel=%b, sonuc=%d", sel, y);

        sel = 2'b01;
        #10;
        $display("sel=%b, sonuc=%d", sel, y);

        sel = 2'b10;
        #10;
        $display("sel=%b, sonuc=%d", sel, y);

        sel = 2'b11;
        #10;
        $display("sel=%b, sonuc=%d", sel, y);

        $finish;
    end

endmodule
