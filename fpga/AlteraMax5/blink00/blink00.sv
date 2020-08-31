`timescale 10ns / 1ns 

// Tests RamMux in hardware for read-write operation with FW.
module top
(
  // 5M570ZF256C5 BGA
  (* chip_pin="M9" *) input  nPB0   ,
  (* chip_pin="R3" *) input  nPB1   ,
  (* chip_pin="P4" *) output nLED0  ,
  (* chip_pin="R1" *) output nLED1  ,
  (* chip_pin="K2" *) output dbg    ,
  (* chip_pin="H5" *) input  clk 
);

  wire led_slow;  
  wire led_fast;  
  
  ClockDiv #(.DIV(10000000/2)) ledBlink(clk, led_slow);
  ClockDiv #(.DIV(1000000/2)) ledBlink2(clk, led_fast);

  assign nLED0 = !(( led_slow && nPB0) || (!nPB0 && led_fast));
  assign nLED1 = !((!led_slow && nPB1) || (!nPB1 && led_fast));
  
  assign dbg = 0;

endmodule // All_top
