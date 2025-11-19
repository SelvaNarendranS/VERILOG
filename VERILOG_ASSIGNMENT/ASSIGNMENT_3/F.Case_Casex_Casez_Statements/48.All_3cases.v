// Create a testbench to show difference between case, casex, and casez.

module all_3cases;
reg [3:0]a;
reg [2:0]select_line;

wire [3:0] out_case;
wire [3:0] out_casex;
wire [3:0] out_casez;

	assign out_case = case_only(a, select_line);
    	assign out_casex = casex_block(a, select_line);
    	assign out_casez = casez_block(select_line);


function [3:0]case_only(
input reg [3:0]a,
input reg [2:0]select_line);

	begin
	
		case(select_line)
	
		3'b000 : case_only = {3'b000, a[3]};
		3'b010 : case_only = {3'b000, a[2]};
		3'b100 : case_only = {3'b000, a[1]};
		3'b110 : case_only = {3'b000, a[0]};	
		default : case_only = 4'd0;
	
		endcase
	end
endfunction


function [3:0]casex_block;
input reg [3:0]a;
input reg [2:0]select_line;

	begin
	
		casex(select_line)
	
		3'b0x : casex_block = {3'b000, a[3]};
		3'b10 : casex_block = {3'b000, a[2]};
		3'b11 : casex_block = {3'b000, a[1]};
		default : casex_block = 4'b0;
	
		endcase
	end
endfunction


function [3:0]casez_block;
input reg [2:0]select_line;

	begin

		casez(select_line)
		3'b1z0: casez_block = 4'b0001;  // 110 or 100
        	3'b0?1: casez_block = 4'b0010;  // 011 or 001
        	3'b??0: casez_block = 4'b0100;  // x x 0
		default casez_block = 4'b1000;
		endcase
	end
endfunction

	task case3_1;
	// 16 - Conditions(only testing 4)
	begin
		a = 4'b1010; 
		select_line = 3'b011;  #5;
	end
	endtask;

	task case3_2;
	// 16 - Conditions(only testing 4)
	begin
		a = 4'b1010; 
		select_line = 3'b010;  #5;
	end
	endtask;

	initial begin
		
		$display("-----------Case only-----------");
		case3_1;
		$display("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, out_case);

		$display("-----------Casex block-----------");
		case3_1;
		$display("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, out_casex);

		$display("-----------Casez block-----------");
		case3_1;
		$display("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, out_casez);

		$display("-----------Case only-----------");
		case3_2;
		$display("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, out_case);

		$display("-----------Casex block-----------");
		case3_2;
		$display("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, out_casex);

		$display("-----------Casez block-----------");
		case3_2;
		$display("Time = %0t, a = %b select line = %b, b = %b", $time, a, select_line, out_casez);


	#11 $finish;
	end

endmodule

