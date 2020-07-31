`timescale 1ns / 1ps

module main(
    input wire sys_clk_p,
    input wire sys_clk_n,
//    input wire clk_U46_2_p,
//    input wire clk_U46_2_n,
    input wire clk_U46_8_p,
    input wire clk_U46_8_n
    );
wire rst;
wire clk_ddr4;
wire clk_U46_1;
wire clk_U46_2;
reg[7:0] count_1 = 8'b0;
reg[7:0] count_2 = 8'b0;
reg[7:0] count_3 = 8'b0;
//wire clk_U46_0_n;

//CLK_BUF_U46 #(.div(3'd0)) N6(
//    .clk_U46_p(clk_U46_0_p),
//    .clk_U46_n(clk_U46_0_n),
//    .O(clk_U46_1)
//);


clk_wiz_0 instance_name
   (
    // Clock out ports
    .clk_out1(clk_U46_1),     // output clk_out1
   // Clock in ports
    .clk_in1_p(clk_U46_8_p),    // input clk_in1_p
    .clk_in1_n(clk_U46_8_n));    // input clk_in1_n

//CLK_BUF_U46 N3(
//    .clk_U46_p(clk_U46_3_p),
//    .clk_U46_n(clk_U46_3_n),
//    .O(clk_U46_2)
//);
assign clk_U46_2 = 0;

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

ila_0 debug (
	.clk(clk_ddr4), // input wire clk
    
    .probe0(rst), 
	.probe1(clk_ddr4), 
	.probe2(count_1), 
	.probe3(clk_U46_1), 
	.probe4(count_2), 
	.probe5(clk_U46_2), 
	.probe6(count_3) 
);

vio_0 vio (
  .clk(clk_ddr4),                // input wire clk
  .probe_out0(rst)  // output wire [0 : 0] probe_out0
);

/* --------------------------------------------------------- */
always @(posedge clk_ddr4, posedge rst)
begin
    if (rst)
    begin
        count_1 <= 0;
    end
    else
    begin
        count_1 <= count_1 + 1;
    end
end
always @(posedge clk_U46_1, posedge rst)
begin
    if (rst)
    begin
        count_2 <= 0;
    end
    else
    begin
        count_2 <= count_2 + 1;
    end
end
always @(posedge clk_U46_2, posedge rst)
begin
    if (rst)
    begin
        count_3 <= 0;
    end
    else
    begin
        count_3 <= count_3 + 1;
    end
end

endmodule
