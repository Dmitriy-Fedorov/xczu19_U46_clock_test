`timescale 1ns / 1ps


module CLK_BUF_U46(
    input wire clk_U46_p,
    input wire clk_U46_n,
    output wire O
    );

parameter div = 3'b111;
wire clk_U46_i1;

IBUFDS_GTE4 #(.REFCLK_HROW_CK_SEL(2'b00)) // Refer to Transceiver User Guide
IBUFDS_GTE4_inst (
    .O(),                   // 1-bit output: Refer to Transceiver User Guide
    .ODIV2(clk_U46_i1),   // 1-bit output: Refer to Transceiver User Guide
    .CEB(1'b0),             // 1-bit input: This is the active-Low asynchronous clock enable signal for the clock buffer. Setting this signal High powers down the clock buffer
    .I(clk_U46_p),        // 1-bit input: Refer to Transceiver User Guide
    .IB(clk_U46_n)
);

BUFG_GT mBuf
( .I       ( clk_U46_i1 ),
  .O       ( O ),
  .CE      ( 1'b1 ),
  .DIV     ( div ),
  .CLR     ( 1'b0 ),
  .CLRMASK ( 1'b0 ),
  .CEMASK  ( 1'b0 )
);

endmodule
