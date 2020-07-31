# part number xczu19eg-ffvc1760-2-e

# ----------------------- Proccessor clock (U42) -----------------------
#create_clock -name main_clk -period 30.000 [get_ports { clk_U42 }]
#set_property -dict { PACKAGE_PIN AC27 IOSTANDARD LVCMOS18 } [get_ports { clk_U42 }];
#set_property -dict { PACKAGE_PIN AC27 } [get_ports { clk_U42 }];
#set_property -dict { IOSTANDARD LVCMOS18 } [get_ports { clk_U42 }];


# ----------------------- DDR4 clock (U10) -----------------------  # 5ns 200MHz
create_clock -name main_clk -period 5.000 [ get_ports { "sys_clk_p" } ]  
set_property PACKAGE_PIN AR27 [ get_ports "sys_clk_p" ]
set_property IOSTANDARD DIFF_HSTL_I_12 [ get_ports "sys_clk_p" ]

set_property PACKAGE_PIN AT27 [ get_ports "sys_clk_n" ]
set_property IOSTANDARD DIFF_HSTL_I_12 [ get_ports "sys_clk_n" ]
# ----------------------- FMC clocks (U46) -----------------------
## GTR_505_REFCL  OUT0
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins IBUFDS_inst/O]]
#set_property PACKAGE_PIN AC37 [ get_ports "clk_U46_0_p" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_0_p" ]
#set_property PACKAGE_PIN AC38 [ get_ports "clk_U46_0_n" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_0_n" ]

## GTY_128_REFCLK   OUT2 *
#set_property PACKAGE_PIN AA32 [ get_ports "clk_U46_2_p" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_2_p" ]
#set_property PACKAGE_PIN AA33 [ get_ports "clk_U46_2_n" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_2_n" ]

## GTY_131_REFCLK    OUT3 *
#set_property PACKAGE_PIN J32 [ get_ports "clk_U46_3_p" ]
#set_property IOSTANDARD LVDS_33 [ get_ports "clk_U46_3_p" ]
#set_property PACKAGE_PIN J33 [ get_ports "clk_U46_3_n" ]
#set_property IOSTANDARD LVDS_33 [ get_ports "clk_U46_3_n" ]

## GTY_130_REFCLK    OUT4
set_property PACKAGE_PIN N32 [ get_ports "clk_U46_4_p" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_4_p" ]
set_property PACKAGE_PIN N33 [ get_ports "clk_U46_4_n" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_4_n" ]

## GTY_129_REFCLK    OUT7
#set_property PACKAGE_PIN U32 [ get_ports "clk_U46_7_p" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_7_p" ]
#set_property PACKAGE_PIN U33 [ get_ports "clk_U46_7_n" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_7_n" ]

## CLK_USER_P    OUT8
#set_property PACKAGE_PIN D4 [ get_ports "clk_U46_8_p" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_8_p" ]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of [get_pins IBUFDS_inst/O]]

#set_property PACKAGE_PIN D3 [ get_ports "clk_U46_8_n" ]
#set_property IOSTANDARD LVDS [ get_ports "clk_U46_8_n" ]

# ----------------------- I2C (U53)-----------------------
##I2C_RST_N_PL FPGA Pin: C4 
##I2C_SCL_PL FPGA Pin: C3 
##I2C_SDA_PL FPGA Pin: B3 
##MIO14_I2C0_SCL FPGA Pin: AJ32 
##MIO15_I2C0_SDA FPGA Pin: AD35
#set_property PACKAGE_PIN C3 [ get_ports "I2C_SCL_PL" ]
#set_property IOSTANDARD LVCMOS33 [ get_ports "I2C_SCL_PL" ]

#set_property PACKAGE_PIN B3 [ get_ports "I2C_SDA_PL" ]
#set_property IOSTANDARD LVCMOS33 [ get_ports "I2C_SDA_PL" ]
#set_property PIO_DIRECTION "BIDIR" [get_ports "I2C_SDA_PL"]

#set_property PACKAGE_PIN C4 [ get_ports "I2C_RST_N_PL" ]
#set_property IOSTANDARD LVCMOS33 [ get_ports "I2C_RST_N_PL" ]

# ----------------------- I/O -----------------------
## PB1
#set_property -dict { PACKAGE_PIN D8   IOSTANDARD LVCMOS33 } [get_ports { PB1 }];

### LEDs
#set_property -dict { PACKAGE_PIN A3   IOSTANDARD LVCMOS33 } [get_ports { led10 }];
#set_property -dict { PACKAGE_PIN A4   IOSTANDARD LVCMOS33 } [get_ports { led11 }];
#set_property -dict { PACKAGE_PIN B5   IOSTANDARD LVCMOS33 } [get_ports { led12 }];
#set_property -dict { PACKAGE_PIN A5   IOSTANDARD LVCMOS33 } [get_ports { led13 }];