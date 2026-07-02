module way2_signal(
  input clk, rst,
  input start,
  output [2:0] east_signal,
  output [2:0] west_signal,
  output walk_n2s
);

  reg [4:0]timer32;
  reg [2:0]timer8;
  reg rd, ylw, grn;

  localparam [1:0]  IDLE = 0,
  					RED = 1,
  					YELLOW = 2,
  					GREEN = 3;
  reg [1:0] state, nxt_state;

  // sequential block
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      state <= IDLE;
      timer32 <= 0;
      timer8 <= 0;
    end

    else begin
      state <= nxt_state;

      case(state)
        IDLE : begin
          timer32 <= 0;
          timer8 <= 0;
        end

        RED : begin
          if(nxt_state != RED)
            timer32 <= 0;
          else
            timer32 <= timer32 + 1'b1;
        end

        YELLOW : begin
          if(nxt_state != YELLOW)
            timer8 <= 0;
          else
            timer8 <= timer8 + 1'b1;
        end

        GREEN : begin
          if(nxt_state != GREEN)
            timer32 <= 0;
          else
            timer32 <= timer32 + 1'b1;
        end

        default : begin
          timer32 <= 0;
          timer8 <= 0;
        end

      endcase
    end
  end

  // combinational block
  always @(*) begin
    
    // setting default 
    nxt_state = IDLE;
    rd = 0;
    ylw = 0;
    grn = 0;

    case(state)
      IDLE : begin
        rd = 1;
        nxt_state = (start) ? RED : IDLE;
      end

      RED : begin
        rd = 1;
        nxt_state = (timer32 > 23) ? YELLOW : RED;
      end

      YELLOW : begin
        ylw = 1;
        nxt_state = (timer8 > 4) ? GREEN : YELLOW;
      end

      GREEN : begin
        grn = 1;
        nxt_state = (timer32 > 30) ? RED : GREEN;
      end
      
      default: nxt_state = IDLE;
      
    endcase
  end


  assign east_signal[0] = rd;
  assign east_signal[1] = ylw;
  assign east_signal[2] = grn;

  assign west_signal[0] = rd;
  assign west_signal[1] = ylw;
  assign west_signal[2] = grn;

  assign walk_n2s = rd;		// Pedestrian walk for nort south direction when red is on on east and west

endmodule


module way2_signal_tb;
  reg clk, rst, start;
  wire [2:0] east_signal;
  wire [2:0] west_signal;
  wire walk_n2s;
  
  // instantation
  way2_signal inst(.clk(clk),
                   .rst(rst),
                   .start(start),
                   .east_signal(east_signal),
                   .west_signal(west_signal),
                   .walk_n2s(walk_n2s)
                  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    rst = 1;
    start = 0;		#6;
    
    rst = 0;		@(posedge clk);
    
    start = 1;		@(posedge clk);
    
    repeat(120) @(posedge clk);
    
    #50;
    $finish;
  end
  
endmodule

