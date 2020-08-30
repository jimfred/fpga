`timescale 10ns / 1ns
`include "ctr.sv"

module ctr_tb();
  reg clk;
  reg [10:0] cnt;
  
  ctr dut(
    .clk(clk),
    .cnt(cnt)
  );
  
  initial begin
    $messagelog("ctr_tb %:0L", `__LINE__);
    #1000000
    $messagelog("Done. %:0L", `__LINE__);
    $stop;
  end

  initial begin // Generate continuous clock.
    clk=0;
    forever #1 clk=~clk; // creating clock of 50 MHz and 20 ns clock period (1 tick on and 1 tick off) based on timescale 10ns.
  end
  
endmodule
