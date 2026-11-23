`timescale 1ns/1ps

module testbench;
    logic [31:0] data;
    wire sign;
    wire [7:0] exponent;
    wire [22:0] fraction;
    wire is_zero, is_subnormal, is_normal, is_inf, is_nan;
    integer tests = 0;
    integer s, e, f;
    logic [31:0] value;
    logic [4:0] expected;

    ieee754_decoder dut(
        .data(data), .sign(sign), .exponent(exponent),
        .fraction(fraction), .is_zero(is_zero),
        .is_subnormal(is_subnormal), .is_normal(is_normal),
        .is_inf(is_inf), .is_nan(is_nan)
    );

    task automatic check(input logic [31:0] bits,
                         input logic [4:0] flags,
                         input bit show_row);
        data = bits;
        #1;
        if ({sign, exponent, fraction} !== bits ||
            {is_zero, is_subnormal, is_normal, is_inf, is_nan} !== flags)
            $fatal(1, "HATA: giris=%h beklenen=%b bulunan=%b", bits, flags,
                   {is_zero, is_subnormal, is_normal, is_inf, is_nan});
        tests = tests + 1;
        if (show_row)
            $display("0x%08h | %0d | %3d | %0d | %0d | %0d | %0d | %0d",
                     data, sign, exponent, is_zero, is_subnormal,
                     is_normal, is_inf, is_nan);
    endtask

    initial begin
        $display("Hex Giris  | S | Exp | Zero | SubN | Norm | Inf | NaN");
        check(32'h00000000, 5'b10000, 1);
        check(32'h80000000, 5'b10000, 1);
        check(32'h427d0000, 5'b00100, 1);
        check(32'hbfc00000, 5'b00100, 1);
        check(32'h00000001, 5'b01000, 1);
        check(32'h7f800000, 5'b00010, 1);
        check(32'hff800000, 5'b00010, 1);
        check(32'h7fc00001, 5'b00001, 1);

        for (s = 0; s < 2; s = s + 1) begin
            for (e = 0; e < 256; e = e + 1) begin
                for (f = 0; f < 5; f = f + 1) begin
                    value = 32'd0;
                    value[31] = s[0];
                    value[30:23] = e[7:0];
                    case (f)
                        0: value[22:0] = 23'h000000;
                        1: value[22:0] = 23'h000001;
                        2: value[22:0] = 23'h3fffff;
                        3: value[22:0] = 23'h400000;
                        4: value[22:0] = 23'h7fffff;
                    endcase
                    case (e)
                        0: expected = (f == 0) ? 5'b10000 : 5'b01000;
                        255: expected = (f == 0) ? 5'b00010 : 5'b00001;
                        default: expected = 5'b00100;
                    endcase
                    check(value, expected, 0);
                end
            end
        end
        $display("BASARILI: %0d test gecti.", tests);
        $finish;
    end
endmodule
