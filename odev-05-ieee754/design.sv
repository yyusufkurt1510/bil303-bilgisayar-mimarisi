module ieee754_decoder(
    input  logic [31:0] data,
    output logic sign,
    output logic [7:0] exponent,
    output logic [22:0] fraction,
    output logic is_zero,
    output logic is_subnormal,
    output logic is_normal,
    output logic is_inf,
    output logic is_nan
);

assign sign = data[31];
assign exponent = data[30:23];
assign fraction = data[22:0];

assign is_zero = (exponent == 8'h00) && (fraction == 23'd0);
assign is_subnormal = (exponent == 8'h00) && (fraction != 23'd0);
assign is_normal = (exponent != 8'h00) && (exponent != 8'hFF);
assign is_inf = (exponent == 8'hFF) && (fraction == 23'd0);
assign is_nan = (exponent == 8'hFF) && (fraction != 23'd0);

endmodule
