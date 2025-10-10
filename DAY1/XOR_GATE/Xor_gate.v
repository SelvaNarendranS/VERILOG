// Gate level implementation

module xor_gate(input a, b, output c);

  // assign c = a ^ b;
  xor(c, a, b); //ab - 11/00 = 0

endmodule
