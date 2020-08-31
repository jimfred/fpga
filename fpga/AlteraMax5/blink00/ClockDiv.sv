// ClockDiv
// Clock divider.
// Example usage that divides a clock from 50 MHz to 1 kHz.
//     ClockDiv #(.DIV(50000000/1000)) uut(clk, led);

   
module ClockDiv #(
  parameter DIV = 50000000/1
) (
  input  clkI,
  output reg clkO
);
  reg [$clog2(DIV):0] cnt;

  initial begin 
    cnt = '1;
    clkO = 1; 
  end 

  always@(negedge clkI) begin
    if (cnt < (DIV/2 - 1)) begin 
      cnt <= cnt + 1'b1; 
    end else begin
      cnt <= 0;
      clkO = !clkO;
    end
  end
  
endmodule // ClockDiv

