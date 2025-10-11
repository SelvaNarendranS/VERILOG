// // Gate level implementation

module half_adder(input a, b, output difference, borrow);

  /* assign difference = a ^ b;
     assign borrow = ~a & b; */
  xor(difference, a, b);
  not(not_a, a);
  and(borrow, not_a, b);

endmodule
