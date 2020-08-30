`timescale 10ns / 1ns

module ctr
(
  input wire clk,
  output reg [22:0] cnt
);

  initial begin 
    cnt = 0; 
  end
  
  always @ (posedge clk)
  begin
    cnt = cnt + 1;
  end
endmodule
