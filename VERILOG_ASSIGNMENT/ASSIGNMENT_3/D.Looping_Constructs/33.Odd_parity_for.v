// Use for loop to compute parity of an 8-bit signal.

module parity_for;
	reg [7:0]data;
	reg parity;
	integer i;

	initial begin 
		data = 8'b1011_0110;
		parity = 0;

		for(i = 0; i < 8; i++) begin
			parity = data[i] ^ parity;
		end	

		$display("data = %b, result odd parity = %b", data, parity);

	end
endmodule
