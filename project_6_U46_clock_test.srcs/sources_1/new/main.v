`timescale 1ns / 1ps

module main(
    input wire sys_clk_p,
    input wire sys_clk_n,
    input wire clk_U46_2_p,
    input wire clk_U46_2_n,
    input wire clk_U46_3_p,
    input wire clk_U46_3_n
    );
    
wire clk_ddr4;
wire clk_U46_1, clk_U46_2;
reg[7:0] count_1 = 8'b0;
reg[7:0] count_2 = 8'b0;
reg[7:0] count_3 = 8'b0;
//wire clk_U46_p, clk_U46_n;

//assign clk_U46_p = clk_U46_2_p;
//assign clk_U46_n = clk_U46_2_n;

CLK_BUF_U46 N2(
    .clk_U46_p(clk_U46_2_p),
    .clk_U46_n(clk_U46_2_n),
    .O(clk_U46_1)
);

CLK_BUF_U46 N3(
    .clk_U46_p(clk_U46_3_p),
    .clk_U46_n(clk_U46_3_n),
    .O(clk_U46_2)
);

/* --------------------------------------------------------- */
// diff buffere, works for DDR4 clock
IBUFDS #(.IBUF_LOW_PWR ("FALSE") ) ddr4 (
   .I  (sys_clk_p),
   .IB (sys_clk_n),
   .O  (clk_ddr4)
);

/* --------------------------------------------------------- */

//assign clk_U46 = clk_U46_2_p;

//IBUF BUFG_U46_8(
//    .I(clk_U46_p), 
//    .O(clk_U46)
//);
/* --------------------------------------------------------- */
//IBUFDS #(.IBUF_LOW_PWR ("FALSE") ) IBUFDS_inst (
//   .I  (clk_U46_p),
//   .IB (clk_U46_n),
   
//   .O  (clk_U46_i1)
//);

//BUFG BUFG_U46_8(
//    .I(clk_U46_i1), 
//    .O(clk_U46)
//);
/* --------------------------------------------------------- */

/*
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
  .O       ( clk_U46 ),
  .CE      ( 1'b1 ),
  .DIV     ( 3'b000 ),
  .CLR     ( 1'b0 ),
  .CLRMASK ( 1'b0 ),
  .CEMASK  ( 1'b0 )
);
*/

/* --------------------------------------------------------- */

ila_0 debug (
	.clk(clk_ddr4), // input wire clk

	.probe0(clk_ddr4), 
	.probe1(count_1), 
	.probe2(clk_U46_1), 
	.probe3(count_2), 
	.probe4(clk_U46_2), 
	.probe5(count_3) 
);

always @(posedge clk_ddr4)
begin
    count_1 <= count_1 + 1;
end
always @(posedge clk_U46_1)
begin
    count_2 <= count_2 + 1;
end
always @(posedge clk_U46_2)
begin
    count_3 <= count_3 + 1;
end

endmodule
