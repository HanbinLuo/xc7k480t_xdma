//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Sep 17 11:24:29 2026
//Host        : LHB-12100F running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (C0_DDR3_0_addr,
    C0_DDR3_0_ba,
    C0_DDR3_0_cas_n,
    C0_DDR3_0_ck_n,
    C0_DDR3_0_ck_p,
    C0_DDR3_0_cke,
    C0_DDR3_0_cs_n,
    C0_DDR3_0_dq,
    C0_DDR3_0_dqs_n,
    C0_DDR3_0_dqs_p,
    C0_DDR3_0_odt,
    C0_DDR3_0_ras_n,
    C0_DDR3_0_reset_n,
    C0_DDR3_0_we_n,
    C0_SYS_CLK_0_clk_n,
    C0_SYS_CLK_0_clk_p,
    C1_DDR3_0_addr,
    C1_DDR3_0_ba,
    C1_DDR3_0_cas_n,
    C1_DDR3_0_ck_n,
    C1_DDR3_0_ck_p,
    C1_DDR3_0_cke,
    C1_DDR3_0_cs_n,
    C1_DDR3_0_dq,
    C1_DDR3_0_dqs_n,
    C1_DDR3_0_dqs_p,
    C1_DDR3_0_odt,
    C1_DDR3_0_ras_n,
    C1_DDR3_0_reset_n,
    C1_DDR3_0_we_n,
    C1_SYS_CLK_0_clk_n,
    C1_SYS_CLK_0_clk_p,
    c0_init_calib_complete_0,
    c1_init_calib_complete_0,
    diff_clock_rtl_0_clk_n,
    diff_clock_rtl_0_clk_p,
    pcie_7x_mgt_rtl_0_rxn,
    pcie_7x_mgt_rtl_0_rxp,
    pcie_7x_mgt_rtl_0_txn,
    pcie_7x_mgt_rtl_0_txp,
    reset_rtl_0,
    user_lnk_up_0);
  output [14:0]C0_DDR3_0_addr;
  output [2:0]C0_DDR3_0_ba;
  output C0_DDR3_0_cas_n;
  output [0:0]C0_DDR3_0_ck_n;
  output [0:0]C0_DDR3_0_ck_p;
  output [0:0]C0_DDR3_0_cke;
  output [0:0]C0_DDR3_0_cs_n;
  inout [71:0]C0_DDR3_0_dq;
  inout [8:0]C0_DDR3_0_dqs_n;
  inout [8:0]C0_DDR3_0_dqs_p;
  output [0:0]C0_DDR3_0_odt;
  output C0_DDR3_0_ras_n;
  output C0_DDR3_0_reset_n;
  output C0_DDR3_0_we_n;
  input C0_SYS_CLK_0_clk_n;
  input C0_SYS_CLK_0_clk_p;
  output [14:0]C1_DDR3_0_addr;
  output [2:0]C1_DDR3_0_ba;
  output C1_DDR3_0_cas_n;
  output [0:0]C1_DDR3_0_ck_n;
  output [0:0]C1_DDR3_0_ck_p;
  output [0:0]C1_DDR3_0_cke;
  output [0:0]C1_DDR3_0_cs_n;
  inout [71:0]C1_DDR3_0_dq;
  inout [8:0]C1_DDR3_0_dqs_n;
  inout [8:0]C1_DDR3_0_dqs_p;
  output [0:0]C1_DDR3_0_odt;
  output C1_DDR3_0_ras_n;
  output C1_DDR3_0_reset_n;
  output C1_DDR3_0_we_n;
  input C1_SYS_CLK_0_clk_n;
  input C1_SYS_CLK_0_clk_p;
  output c0_init_calib_complete_0;
  output c1_init_calib_complete_0;
  input [0:0]diff_clock_rtl_0_clk_n;
  input [0:0]diff_clock_rtl_0_clk_p;
  input [3:0]pcie_7x_mgt_rtl_0_rxn;
  input [3:0]pcie_7x_mgt_rtl_0_rxp;
  output [3:0]pcie_7x_mgt_rtl_0_txn;
  output [3:0]pcie_7x_mgt_rtl_0_txp;
  input reset_rtl_0;
  output user_lnk_up_0;

  wire [14:0]C0_DDR3_0_addr;
  wire [2:0]C0_DDR3_0_ba;
  wire C0_DDR3_0_cas_n;
  wire [0:0]C0_DDR3_0_ck_n;
  wire [0:0]C0_DDR3_0_ck_p;
  wire [0:0]C0_DDR3_0_cke;
  wire [0:0]C0_DDR3_0_cs_n;
  wire [71:0]C0_DDR3_0_dq;
  wire [8:0]C0_DDR3_0_dqs_n;
  wire [8:0]C0_DDR3_0_dqs_p;
  wire [0:0]C0_DDR3_0_odt;
  wire C0_DDR3_0_ras_n;
  wire C0_DDR3_0_reset_n;
  wire C0_DDR3_0_we_n;
  wire C0_SYS_CLK_0_clk_n;
  wire C0_SYS_CLK_0_clk_p;
  wire [14:0]C1_DDR3_0_addr;
  wire [2:0]C1_DDR3_0_ba;
  wire C1_DDR3_0_cas_n;
  wire [0:0]C1_DDR3_0_ck_n;
  wire [0:0]C1_DDR3_0_ck_p;
  wire [0:0]C1_DDR3_0_cke;
  wire [0:0]C1_DDR3_0_cs_n;
  wire [71:0]C1_DDR3_0_dq;
  wire [8:0]C1_DDR3_0_dqs_n;
  wire [8:0]C1_DDR3_0_dqs_p;
  wire [0:0]C1_DDR3_0_odt;
  wire C1_DDR3_0_ras_n;
  wire C1_DDR3_0_reset_n;
  wire C1_DDR3_0_we_n;
  wire C1_SYS_CLK_0_clk_n;
  wire C1_SYS_CLK_0_clk_p;
  wire c0_init_calib_complete_0;
  wire c1_init_calib_complete_0;
  wire [0:0]diff_clock_rtl_0_clk_n;
  wire [0:0]diff_clock_rtl_0_clk_p;
  wire [3:0]pcie_7x_mgt_rtl_0_rxn;
  wire [3:0]pcie_7x_mgt_rtl_0_rxp;
  wire [3:0]pcie_7x_mgt_rtl_0_txn;
  wire [3:0]pcie_7x_mgt_rtl_0_txp;
  wire reset_rtl_0;
  wire user_lnk_up_0;

  design_1 design_1_i
       (.C0_DDR3_0_addr(C0_DDR3_0_addr),
        .C0_DDR3_0_ba(C0_DDR3_0_ba),
        .C0_DDR3_0_cas_n(C0_DDR3_0_cas_n),
        .C0_DDR3_0_ck_n(C0_DDR3_0_ck_n),
        .C0_DDR3_0_ck_p(C0_DDR3_0_ck_p),
        .C0_DDR3_0_cke(C0_DDR3_0_cke),
        .C0_DDR3_0_cs_n(C0_DDR3_0_cs_n),
        .C0_DDR3_0_dq(C0_DDR3_0_dq),
        .C0_DDR3_0_dqs_n(C0_DDR3_0_dqs_n),
        .C0_DDR3_0_dqs_p(C0_DDR3_0_dqs_p),
        .C0_DDR3_0_odt(C0_DDR3_0_odt),
        .C0_DDR3_0_ras_n(C0_DDR3_0_ras_n),
        .C0_DDR3_0_reset_n(C0_DDR3_0_reset_n),
        .C0_DDR3_0_we_n(C0_DDR3_0_we_n),
        .C0_SYS_CLK_0_clk_n(C0_SYS_CLK_0_clk_n),
        .C0_SYS_CLK_0_clk_p(C0_SYS_CLK_0_clk_p),
        .C1_DDR3_0_addr(C1_DDR3_0_addr),
        .C1_DDR3_0_ba(C1_DDR3_0_ba),
        .C1_DDR3_0_cas_n(C1_DDR3_0_cas_n),
        .C1_DDR3_0_ck_n(C1_DDR3_0_ck_n),
        .C1_DDR3_0_ck_p(C1_DDR3_0_ck_p),
        .C1_DDR3_0_cke(C1_DDR3_0_cke),
        .C1_DDR3_0_cs_n(C1_DDR3_0_cs_n),
        .C1_DDR3_0_dq(C1_DDR3_0_dq),
        .C1_DDR3_0_dqs_n(C1_DDR3_0_dqs_n),
        .C1_DDR3_0_dqs_p(C1_DDR3_0_dqs_p),
        .C1_DDR3_0_odt(C1_DDR3_0_odt),
        .C1_DDR3_0_ras_n(C1_DDR3_0_ras_n),
        .C1_DDR3_0_reset_n(C1_DDR3_0_reset_n),
        .C1_DDR3_0_we_n(C1_DDR3_0_we_n),
        .C1_SYS_CLK_0_clk_n(C1_SYS_CLK_0_clk_n),
        .C1_SYS_CLK_0_clk_p(C1_SYS_CLK_0_clk_p),
        .c0_init_calib_complete_0(c0_init_calib_complete_0),
        .c1_init_calib_complete_0(c1_init_calib_complete_0),
        .diff_clock_rtl_0_clk_n(diff_clock_rtl_0_clk_n),
        .diff_clock_rtl_0_clk_p(diff_clock_rtl_0_clk_p),
        .pcie_7x_mgt_rtl_0_rxn(pcie_7x_mgt_rtl_0_rxn),
        .pcie_7x_mgt_rtl_0_rxp(pcie_7x_mgt_rtl_0_rxp),
        .pcie_7x_mgt_rtl_0_txn(pcie_7x_mgt_rtl_0_txn),
        .pcie_7x_mgt_rtl_0_txp(pcie_7x_mgt_rtl_0_txp),
        .reset_rtl_0(reset_rtl_0),
        .user_lnk_up_0(user_lnk_up_0));
endmodule
