// // Gate level implementation

module half_adder(input a, b, output sum, carry);

  /* assign sum = a ^ b;
     assign carry = a & b; */
  xor(sum, a, b);
  and(carry, a, b);

endmodule
