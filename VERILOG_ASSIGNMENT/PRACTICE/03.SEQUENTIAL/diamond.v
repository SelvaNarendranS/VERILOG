module diamond;
  reg [7:0] value;
  reg [5:0] range;
  integer i, j, k;
  
  initial begin
    // upper half
    for(i = range; i >= 1; i--) begin
      for(j = 1; j < i; j++) begin
        $write(" ");
      end
      for(k = i; k <= range; k++) begin
        $write("%0s ", value);
      end
      $display();
    end
    
    // lower half
    for(i = 2; i <= range; i++) begin
      for(j = 1; j < i; j++) begin
        $write(" ");
      end
      for(k = i; k <= range; k++) begin
        $write("%0s ", value);
      end
      $display();
    end
  end
  
  
  initial begin
    value = "*";
    range = 5;
  end
  
endmodule
        
