onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/dtreq
add wave -noupdate -group miirx_mac -radix hexadecimal /testbench/nuhs3dsp_e/miirx_udp_e/dtxd
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/mii_rxc
add wave -noupdate -group miirx_mac -radix hexadecimal /testbench/nuhs3dsp_e/miirx_udp_e/mii_rxd
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/mii_rxdv
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/mii_txc
add wave -noupdate -group miirx_mac -radix hexadecimal /testbench/nuhs3dsp_e/miirx_udp_e/mii_txd
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/mii_txen
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/dtxen
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/dtrdy
add wave -noupdate -group miirx_mac /testbench/nuhs3dsp_e/miirx_udp_e/txen
add wave -noupdate -expand -group debug -expand -group miirx -color {Violet Red} /testbench/nuhs3dsp_e/miitx_rdy
add wave -noupdate -expand -group debug -expand -group miirx -color {Violet Red} /testbench/nuhs3dsp_e/miitx_req
add wave -noupdate -expand -group debug -expand -group miirx /testbench/nuhs3dsp_e/rpkt
add wave -noupdate -expand -group debug -expand -group miirx -color {Medium Blue} /testbench/nuhs3dsp_e/trdy
add wave -noupdate -expand -group debug -expand -group miirx -color {Medium Blue} /testbench/nuhs3dsp_e/treq
add wave -noupdate -expand -group debug -radix hexadecimal /testbench/mii_rxd
add wave -noupdate -expand -group debug /testbench/mii_strt
add wave -noupdate -expand -group debug /testbench/mii_rxdv
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/mii_txc
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/mii_txen
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/mii_rxdv
add wave -noupdate -expand -group debug /testbench/mii_treq
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_act
add wave -noupdate -expand -group debug -color Blue /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_eoc
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/ddrs_ba
add wave -noupdate -expand -group debug -radix hexadecimal /testbench/nuhs3dsp_e/ddr_a
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/ddr_ras
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/ddr_cas
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/ddr_we
add wave -noupdate -expand -group debug /testbench/nuhs3dsp_e/ddr_e/sys_cas
add wave -noupdate -expand -group sys_clock /testbench/nuhs3dsp_e/xtal
add wave -noupdate -expand -group sys_clock /testbench/nuhs3dsp_e/mii_txc
add wave -noupdate -expand -group sys_clock /testbench/nuhs3dsp_e/ddr_ckp
add wave -noupdate -expand -group sys_clock /testbench/nuhs3dsp_e/video_clk
add wave -noupdate -divider {DDR begin}
add wave -noupdate /testbench/nuhs3dsp_e/ddrs_ini
add wave -noupdate /testbench/nuhs3dsp_e/input_clk
add wave -noupdate -radix hexadecimal /testbench/nuhs3dsp_e/input_dat
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/ddrs_clk
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/ddrs_di_rdy
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/ddrs_di
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/buff_ini
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/page_off
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/page_addr
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/output_clk
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/output_addr
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/output_data
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/bram_sel_cnt
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/addri
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/wr_address
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/wr_ena
add wave -noupdate -group videomem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/videomem_e/wr_data
add wave -noupdate -group videomem_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(5) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data(5) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_data
add wave -noupdate -group videomem_e /testbench/nuhs3dsp_e/dataio_e/videomem_e/rd_addr
add wave -noupdate /testbench/nuhs3dsp_e/input_req
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/video_clk
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/mem_addr
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/mem_di
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/video_col
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/video_row
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/video_do
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/vchn_do
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/vchn_di
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/vaddr
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/mem_data
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/mem_address
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/pg_sel
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/pg_bnd
add wave -noupdate -group mem2vio_e /testbench/nuhs3dsp_e/dataio_e/mem2vio_e/vaddr0
add wave -noupdate /testbench/nuhs3dsp_e/input_rdy
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_cs
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_cke
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_ckp
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_ckn
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_ras
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_cas
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_we
add wave -noupdate -group to_ddr /testbench/ddr_lp_dqs
add wave -noupdate -group to_ddr -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/ddr_a(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_a(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/ddr_a(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_a(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/ddr_a
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_ba
add wave -noupdate -group to_ddr /testbench/nuhs3dsp_e/ddr_dm
add wave -noupdate -group to_ddr -expand /testbench/nuhs3dsp_e/ddr_dqs
add wave -noupdate -group to_ddr -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/ddr_dq(15) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(14) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(13) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_dq(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/ddr_dq(15) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(14) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(13) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_dq(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/ddr_dq
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/sync_ena_val(0)
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/sync_dat_pdge
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/sync_ena_ndge
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/wm_cntr
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/wm_level
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/wm_mark
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/ddrios_clk
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/ddrios_rd
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/vsync_erq
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/hsync_erq
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/page_addr
add wave -noupdate -group ddr2video_e -divider {New Divider}
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/fill_rdy
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/buff_ini
add wave -noupdate -group ddr2video_e -color {Sky Blue} /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/ddrios_brst_req
add wave -noupdate -group ddr2video_e -divider {New Divider}
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/sync_dat_val(0)
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/sync_dat_val
add wave -noupdate -group ddr2video_e /testbench/nuhs3dsp_e/dataio_e/ddr2video_e/sync_ena_val
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/sys_rst
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/input_req
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrios_eoc
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/buff_ini
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrios_ini
add wave -noupdate -group dataio_e -color {Orange Red} /testbench/nuhs3dsp_e/dataio_e/ddrios_brst_req
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/input_clk
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/input_rdy
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/input_dat
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/video_clk
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/video_ena
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/video_row
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/video_col
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/video_do
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_clk
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_ref_req
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_cmd_req
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_cmd_rdy
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_ba
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrs_a
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_act
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_cas
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_rw
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_di_rdy
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrs_di
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/ddrs_do_rdy
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrs_do
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/capture_rdy
add wave -noupdate -group dataio_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrios_addr
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/datai_brst_req
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/datao_brst_req
add wave -noupdate -group dataio_e /testbench/nuhs3dsp_e/dataio_e/datai_req
add wave -noupdate -expand -group ddrio -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(0)
add wave -noupdate -expand -group ddrio -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(0)
add wave -noupdate -expand -group ddrio -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(0)
add wave -noupdate -expand -group ddrio -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(2) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt(2) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_cnt
add wave -noupdate -expand -group ddrio -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(13) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt(13) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_cnt
add wave -noupdate -expand -group ddrio -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(6) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt(6) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_cnt
add wave -noupdate -expand -group ddrio -divider {New Divider}
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/addr_size
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/bank_size
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/cmd_req
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/col_size
add wave -noupdate -expand -group ddrio -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_a
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_act
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_ba
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_cas
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_cmd_rdy
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_cmd_req
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/ddrs_ref_req
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/fifo_size
add wave -noupdate -expand -group ddrio -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_addr
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_dat
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ba_ena
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_brst_req
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_clk
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_dat
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_col_ena
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ena
add wave -noupdate -expand -group ddrio -color Blue /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_eoc
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_ini
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_dat
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_ena
add wave -noupdate -expand -group ddrio /testbench/nuhs3dsp_e/dataio_e/ddrio_e/sys_row_se
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/ddrios_clk
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/ddrios_gnt
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/ddrios_a0
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/ddrios_brst_req
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/miitx_rdy
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/miitx_req
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/sync_rdy_edge
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/sync_rdy_pdge
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/sync_rdy_val
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/a0_edge
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/a0_dly
add wave -noupdate -group ddr2miitx_e /testbench/nuhs3dsp_e/dataio_e/ddr2miitx_e/req
add wave -noupdate -group miitxmem_e /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_clk
add wave -noupdate -group miitxmem_e /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di_rdy
add wave -noupdate -group miitxmem_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(31) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(30) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(29) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(28) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(27) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(26) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(25) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(24) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(23) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(22) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(21) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(20) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(19) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(18) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(17) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(16) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(15) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(14) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(13) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(31) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(30) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(29) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(28) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(27) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(26) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(25) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(24) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(23) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(22) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(21) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(20) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(19) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(18) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(17) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(16) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(15) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(14) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(13) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/ddrs_di
add wave -noupdate -group miitxmem_e /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_clk
add wave -noupdate -group miitxmem_e /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_a0
add wave -noupdate -group miitxmem_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(1) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr(1) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_addr
add wave -noupdate -group miitxmem_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(31) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(30) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(29) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(28) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(27) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(26) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(25) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(24) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(23) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(22) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(21) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(20) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(19) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(18) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(17) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(16) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(15) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(14) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(13) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(31) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(30) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(29) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(28) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(27) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(26) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(25) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(24) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(23) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(22) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(21) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(20) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(19) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(18) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(17) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(16) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(15) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(14) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(13) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/output_data
add wave -noupdate -group miitxmem_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(8) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri(8) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/addri
add wave -noupdate -group miitxmem_e -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_address
add wave -noupdate -group miitxmem_e /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_ena
add wave -noupdate -group miitxmem_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(31) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(30) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(29) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(28) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(27) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(26) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(25) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(24) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(23) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(22) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(21) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(20) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(19) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(18) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(17) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(16) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(15) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(14) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(13) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(31) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(30) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(29) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(28) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(27) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(26) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(25) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(24) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(23) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(22) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(21) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(20) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(19) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(18) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(17) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(16) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(15) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(14) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(13) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/miitxmem_e/wr_data
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/output_syrq(0)
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/input_syrq(0)
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/input_req
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/input_clk
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/input_dat
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/output_clk
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/output_rdy
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/output_req
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/output_dat
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/addri
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/addro
add wave -noupdate -group datai -divider {New Divider}
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/wr_sel
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/wr_address
add wave -noupdate -group datai /testbench/nuhs3dsp_e/dataio_e/datai_e/wr_ena
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/wr_data
add wave -noupdate -group datai -divider {New Divider}
add wave -noupdate -group datai -radix hexadecimal /testbench/nuhs3dsp_e/dataio_e/datai_e/rd_address
add wave -noupdate -group datai -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/dataio_e/datai_e/datao(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/dataio_e/datai_e/datao(1) -radix hexadecimal}} -expand -subitemconfig {/testbench/nuhs3dsp_e/dataio_e/datai_e/datao(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/dataio_e/datai_e/datao(1) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/dataio_e/datai_e/datao
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_rst
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_clk0
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_clk90
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_ini
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_cmd_req
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_cmd_rdy
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_do_rdy
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_rw
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_a
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_di_rdy
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_ba
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_act
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_cas
add wave -noupdate -expand -group ddr -group ddr_e -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/sys_di
add wave -noupdate -expand -group ddr -group ddr_e -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/sys_do
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/sys_ref
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_cke
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_cs
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_ras
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_cas
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_st_lp_dqs
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_lp_dqs
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_we
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_ba
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_a
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_dm
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_dqs
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_dq
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_rdy
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_req
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_ras
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_cas
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_we
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_a
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_b
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_init_cke
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_timer_sel
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_timer_dll
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_timer_200u
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_timer_rst
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_timer_ref
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_rst
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_req
add wave -noupdate -expand -group ddr -group ddr_e -color {Green Yellow} /testbench/nuhs3dsp_e/ddr_e/ddr_acc_ref
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_ras
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_cas
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_we
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_rwin
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_drr
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_drf
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_rea
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_dqz
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_dqsz
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_dqs
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_cmd
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_rdy
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_rst
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_req
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_ena_n
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_ena_p
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_do
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_io_dso
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_io_dqi
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_acc_wri
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/in_rst
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/clk180
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/clk270
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/clk90
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/clk0
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_dqh
add wave -noupdate -expand -group ddr -group ddr_e /testbench/nuhs3dsp_e/ddr_e/ddr_dql
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_bl
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_cl
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_clk
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_req
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_rdy
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_dll
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_ras
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_cas
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_we
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_a
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_b
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/lat_timer
add wave -noupdate -expand -group ddr -group ddr_init /testbench/nuhs3dsp_e/ddr_e/ddr_init_du/ddr_init_s
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/ddr_timer_clk
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/ddr_timer_rst
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/ddr_timer_sel
add wave -noupdate -expand -group ddr -group ddr_timer -color Gold /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/ddr_timer_200u
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/ddr_timer_dll
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/ddr_timer_ref
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/q0
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/timer_200u
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/timer_dll
add wave -noupdate -expand -group ddr -group ddr_timer /testbench/nuhs3dsp_e/ddr_e/ddr_timer_du/timer_ref
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_rst
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_clk
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_ref
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/sys_pgm_ref
add wave -noupdate -expand -group ddr -expand -group ddr_pgm -color Blue /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_start
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_start
add wave -noupdate -expand -group ddr -expand -group ddr_pgm -color Magenta /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_rdy
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_req
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_rw
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_cas
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_cmd
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_mpu_pc
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_pc
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_pgm_npc
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_ref_req
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_act
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_rea
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_wri
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_pre
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_nop
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_aut
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_act_d
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_rea_d
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_wri_d
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_pre_d
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_nop_d
add wave -noupdate -expand -group ddr -expand -group ddr_pgm /testbench/nuhs3dsp_e/ddr_e/ddr_pgm_e/ddr_npc_aut_d
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_rst
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_clk
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_clk90
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_cmd
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_rdy
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_act
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_cas
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_ras
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_we
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_rea
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_wri
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_wbl
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_rwin
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_drr
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_drf
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_dwf
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_dwr
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_dqs
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_dqsz
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_dqz
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_rph
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_mpu_wph
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ph_rea
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/lat_timer
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/sel_cl
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_rea
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_wri
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_state
add wave -noupdate -expand -group ddr -group ddr_mpu /testbench/nuhs3dsp_e/ddr_e/ddr_mpu_e/ddr_rdy_ena
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/sys_clk
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/sys_rdy
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/sys_rea
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/sys_do
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_win_dq
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_win_dqs
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_dqs
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_dqi
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_fifo_di
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_fifo_do
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/sys_do_win
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_win_dqsi
add wave -noupdate -expand -group ddr -group ddr_rd_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_rd_fifo_e/ddr_fifo_rdy
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/sys_clk
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/sys_req
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/sys_di
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/sys_rst
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_ena_p
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_ena_n
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_clk_p
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_clk_n
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_do
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_clk
add wave -noupdate -expand -group ddr -group ddr_wr_fifo /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_ena
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_addr_q(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_addr_q(1) -radix hexadecimal}} -expand -subitemconfig {/testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_addr_q(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_addr_q(1) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/ddr_addr_q
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -expand -group data_byte_0 -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/data_byte_g(0)/sys_addr_q
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -expand -group data_byte_0 -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/data_byte_g(0)/sys_addr_d
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -expand -group data_byte_1 -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/data_byte_g(1)/sys_addr_q
add wave -noupdate -expand -group ddr -group ddr_wr_fifo -expand -group data_byte_1 -radix hexadecimal /testbench/nuhs3dsp_e/ddr_e/ddr_wr_fifo_e/data_byte_g(1)/sys_addr_d
add wave -noupdate -divider {New Divider}
add wave -noupdate -group miitx_crc_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_g
add wave -noupdate -group miitx_crc_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_ini
add wave -noupdate -group miitx_crc_e /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_txc
add wave -noupdate -group miitx_crc_e /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_treq
add wave -noupdate -group miitx_crc_e /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_ted
add wave -noupdate -group miitx_crc_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_txi
add wave -noupdate -group miitx_crc_e /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_txen
add wave -noupdate -group miitx_crc_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/mii_txd
add wave -noupdate -group miitx_crc_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/xp
add wave -noupdate -group miitx_crc_e /testbench/nuhs3dsp_e/miitx_udp_e/miitx_crc_e/cnt
add wave -noupdate -group miitx_udp_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/sys_addr
add wave -noupdate -group miitx_udp_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/sys_data
add wave -noupdate -group miitx_udp_e /testbench/nuhs3dsp_e/miitx_udp_e/mii_txc
add wave -noupdate -group miitx_udp_e /testbench/nuhs3dsp_e/miitx_udp_e/mii_treq
add wave -noupdate -group miitx_udp_e /testbench/nuhs3dsp_e/miitx_udp_e/mii_trdy
add wave -noupdate -group miitx_udp_e /testbench/nuhs3dsp_e/miitx_udp_e/mii_txen
add wave -noupdate -group miitx_udp_e -radix hexadecimal /testbench/nuhs3dsp_e/miitx_udp_e/mii_txd
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/txdat(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2) -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(0) -radix hexadecimal}}} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(2) {-height 16 -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(0) -radix hexadecimal}}} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(2)(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txdat(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/txdat
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/txena(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txena(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txena(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txena(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/txena(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txena(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txena(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txena(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/txena
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/txreq(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txreq(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txreq(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txreq(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txreq(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/txreq(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txreq(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txreq(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txreq(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txreq(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/txreq
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/txd(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txd(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txd(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/txd(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/txd(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txd(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txd(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/txd(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/txd
add wave -noupdate -group miitx_udp_e /testbench/nuhs3dsp_e/miitx_udp_e/txen
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/rdy(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/rdy(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/rdy(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/rdy(0) -radix hexadecimal}} -expand -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/rdy(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/rdy(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/rdy(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/rdy(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/rdy
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/dat(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/dat(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/dat(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/dat(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/dat(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/dat(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/dat(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/dat(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/dat
add wave -noupdate -group miitx_udp_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/miitx_udp_e/ena(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/ena(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/ena(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/miitx_udp_e/ena(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/miitx_udp_e/ena(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/ena(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/ena(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/miitx_udp_e/ena(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/miitx_udp_e/ena
add wave -noupdate -group miitx_udp_e /testbench/nuhs3dsp_e/miitx_udp_e/crc_ted
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/win_clk
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/win_frm
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/win_don
add wave -noupdate -group win_sytm -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/win_stym_e/win_rowid(1) -radix binary} {/testbench/nuhs3dsp_e/win_stym_e/win_rowid(0) -radix binary}} -subitemconfig {/testbench/nuhs3dsp_e/win_stym_e/win_rowid(1) {-height 16 -radix binary} /testbench/nuhs3dsp_e/win_stym_e/win_rowid(0) {-height 16 -radix binary}} /testbench/nuhs3dsp_e/win_stym_e/win_rowid
add wave -noupdate -group win_sytm -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/win_stym_e/win_colid(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/win_stym_e/win_colid(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/win_stym_e/win_colid(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/win_stym_e/win_colid(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/win_stym_e/win_colid
add wave -noupdate -group win_sytm -radix unsigned /testbench/nuhs3dsp_e/win_stym_e/win_rowpag
add wave -noupdate -group win_sytm -radix hexadecimal /testbench/nuhs3dsp_e/win_stym_e/win_rowoff
add wave -noupdate -group win_sytm -radix hexadecimal /testbench/nuhs3dsp_e/win_stym_e/win_colpag
add wave -noupdate -group win_sytm -radix hexadecimal /testbench/nuhs3dsp_e/win_stym_e/win_coloff
add wave -noupdate -group win_sytm -radix hexadecimal /testbench/nuhs3dsp_e/win_stym_e/row_pag
add wave -noupdate -group win_sytm -radix hexadecimal /testbench/nuhs3dsp_e/win_stym_e/row_cnt
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/rowpag_ena
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/rowpag_load
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/rdata
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/wrowpag_ena
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/col_pag
add wave -noupdate -group win_sytm -radix hexadecimal /testbench/nuhs3dsp_e/win_stym_e/col_cnt
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/colpag_ena
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/colpag_load
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/cdata
add wave -noupdate -group win_sytm /testbench/nuhs3dsp_e/win_stym_e/wcolpag_ena
add wave -noupdate -group plot_e -radix hexadecimal /testbench/nuhs3dsp_e/scope_e/plot_e/video_clk
add wave -noupdate -group plot_e -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_seg(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/video_seg
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/video_row(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/video_row
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(7) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(8) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(9) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(10) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(11) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(12) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(13) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/video_off(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(7) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(8) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(9) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(10) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(11) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(12) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off(13) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/video_off
add wave -noupdate -group plot_e -radix hexadecimal /testbench/nuhs3dsp_e/scope_e/plot_e/chann_dat
add wave -noupdate -group plot_e -radix hexadecimal /testbench/nuhs3dsp_e/scope_e/plot_e/video_dot
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/values(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/values(1) -radix hexadecimal}} -expand -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/values(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/values(1) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/values
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0) -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(0) -radix hexadecimal}}} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1) -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(0) -radix hexadecimal}}}} -expand -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0) {-height 16 -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(0) -radix hexadecimal}}} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(0)(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1) {-height 16 -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(0) -radix hexadecimal}}} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets(1)(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/offsets
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(6) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(5) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(4) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(3) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(2) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(1) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(0) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vrow(6) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow(5) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow(4) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow(3) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow(2) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow(1) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow(0) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/vrow
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_dot(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_dot(1) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_dot(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_dot(1) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_dot
add wave -noupdate -group plot_e -radix hexadecimal -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/muxdot_do(0) -radix hexadecimal} {/testbench/nuhs3dsp_e/scope_e/plot_e/muxdot_do(1) -radix hexadecimal}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/muxdot_do(0) {-height 16 -radix hexadecimal} /testbench/nuhs3dsp_e/scope_e/plot_e/muxdot_do(1) {-height 16 -radix hexadecimal}} /testbench/nuhs3dsp_e/scope_e/plot_e/muxdot_do
add wave -noupdate -group plot_e -radix hexadecimal /testbench/nuhs3dsp_e/scope_e/plot_e/muxdot_sel
add wave -noupdate -group vline_0 -color {Medium Spring Green} -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(7) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(6) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(5) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(4) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(3) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(2) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(1) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(0) -radix unsigned}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(7) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(6) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(5) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(4) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(3) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(2) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(1) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1(0) {-color {Medium Spring Green} -height 16 -radix unsigned}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row1
add wave -noupdate -group vline_0 -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(7) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(6) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(5) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(4) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(3) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(2) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(1) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(0) -radix unsigned}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(7) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(6) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(5) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(4) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(3) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(2) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(1) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(0) {-height 16 -radix unsigned}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2
add wave -noupdate -group vline_0 -format Analog-Step -height 128 -max 127.0 -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(7) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(6) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(5) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(4) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(3) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(2) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(1) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(0) -radix unsigned}} -expand -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(7) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(6) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(5) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(4) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(3) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(2) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(1) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2(0) {-height 16 -radix unsigned}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/row2
add wave -noupdate -group vline_0 /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(0)/muxdot_di
add wave -noupdate -group vline_1 -color {Medium Spring Green} -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(7) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(6) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(5) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(4) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(3) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(2) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(1) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(0) -radix unsigned}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(7) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(6) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(5) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(4) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(3) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(2) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(1) {-color {Medium Spring Green} -height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1(0) {-color {Medium Spring Green} -height 16 -radix unsigned}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row1
add wave -noupdate -group vline_1 -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(7) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(6) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(5) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(4) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(3) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(2) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(1) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(0) -radix unsigned}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(7) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(6) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(5) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(4) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(3) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(2) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(1) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(0) {-height 16 -radix unsigned}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2
add wave -noupdate -group vline_1 -format Analog-Step -height 127 -max 127.00000000000001 -radix unsigned -childformat {{/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(7) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(6) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(5) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(4) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(3) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(2) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(1) -radix unsigned} {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(0) -radix unsigned}} -subitemconfig {/testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(7) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(6) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(5) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(4) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(3) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(2) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(1) {-height 16 -radix unsigned} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2(0) {-height 16 -radix unsigned}} /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/row2
add wave -noupdate -group vline_1 /testbench/nuhs3dsp_e/scope_e/plot_e/vline_g(1)/muxdot_di
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {204388668 ps} 0} {{Cursor 2} {204308887 ps} 0} {{Cursor 3} {204435000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 162
configure wave -valuecolwidth 38
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {204171353 ps} {204698609 ps}
