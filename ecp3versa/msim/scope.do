onerror {resume}
quietly virtual signal -install /testbench/ecp3versa_e/scope_e/ddr_e/xdr_pgm_e { (context /testbench/ecp3versa_e/scope_e/ddr_e/xdr_pgm_e )(xdr_pgm_ref & xdr_pgm_rrdy & xdr_pgm_req )} pgm_cmd2
quietly virtual signal -install /testbench/ecp3versa_e {/testbench/ecp3versa_e/phy1_tx_d  } iii
quietly virtual signal -install /testbench/ecp3versa_e {/testbench/ecp3versa_e/phy1_tx_d  } sss
quietly virtual signal -install /testbench/ecp3versa_e { (context /testbench/ecp3versa_e )( phy1_tx_d(7) & phy1_tx_d(6) & phy1_tx_d(5) & phy1_tx_d(4) & phy1_tx_d(3) & phy1_tx_d(2) & phy1_tx_d(1) & phy1_tx_d(0) )} sss001
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/xtal
add wave -noupdate /testbench/ddr_clk_p
add wave -noupdate /testbench/rst_n
add wave -noupdate /testbench/cke
add wave -noupdate /testbench/odt
add wave -noupdate /testbench/cs_n
add wave -noupdate /testbench/ras_n
add wave -noupdate /testbench/cas_n
add wave -noupdate /testbench/we_n
add wave -noupdate -radix hexadecimal /testbench/ba
add wave -noupdate -radix hexadecimal /testbench/addr
add wave -noupdate -radix hexadecimal /testbench/dq
add wave -noupdate -expand /testbench/dqs_p
add wave -noupdate -expand /testbench/ecp3versa_e/scope_e/ddr_e/sys_do_rdy
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(63) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(62) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(61) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(60) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(59) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(58) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(57) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(56) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(55) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(54) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(53) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(52) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(51) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(50) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(49) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(48) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(47) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(46) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(45) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(44) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(43) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(42) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(41) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(40) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(39) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(38) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(37) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(36) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(35) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(34) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(33) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(32) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(31) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(30) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(29) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(28) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(27) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(26) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(25) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(24) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(23) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(22) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(21) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(20) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(19) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(18) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(17) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(16) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(15) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(14) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(13) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(12) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(11) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(10) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(9) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(8) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(7) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(6) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(5) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(4) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(3) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(2) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(1) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(0) -radix hexadecimal}} -subitemconfig {/testbench/ecp3versa_e/scope_e/ddr_e/sys_do(63) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(62) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(61) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(60) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(59) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(58) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(57) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(56) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(55) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(54) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(53) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(52) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(51) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(50) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(49) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(48) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(47) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(46) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(45) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(44) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(43) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(42) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(41) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(40) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(39) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(38) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(37) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(36) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(35) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(34) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(33) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(32) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(31) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(30) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(29) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(28) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(27) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(26) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(25) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(24) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(23) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(22) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(21) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(20) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(19) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(18) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(17) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(16) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(15) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(14) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(13) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(12) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(11) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(10) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(9) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(8) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(7) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(6) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(5) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(4) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(3) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(2) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(1) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do(0) {-height 16 -radix hexadecimal}} /testbench/ecp3versa_e/scope_e/ddr_e/sys_do
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/rw
add wave -noupdate /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/ddrclkpol
add wave -noupdate /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/idqs_eclk
add wave -noupdate /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/prmbdet
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(31) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(30) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(29) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(28) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(27) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(26) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(25) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(24) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(23) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(22) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(21) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(20) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(19) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(18) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(17) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(16) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(15) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(14) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(13) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(12) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(11) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(10) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(9) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(8) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(7) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(6) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(5) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(4) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(3) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(2) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(1) -radix hexadecimal} {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(0) -radix hexadecimal}} -subitemconfig {/testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(31) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(30) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(29) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(28) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(27) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(26) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(25) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(24) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(23) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(22) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(21) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(20) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(19) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(18) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(17) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(16) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(15) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(14) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(13) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(12) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(11) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(10) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(9) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(8) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(7) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(6) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(5) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(4) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(3) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(2) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(1) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi(0) {-height 16 -radix hexadecimal}} /testbench/ecp3versa_e/ddrphy_e/byte_g(0)/ddr3phy_i/sys_dqi
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/ddrphy_e/sys_dqi
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/di(1) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/di(0) -radix hexadecimal}} -expand -subitemconfig {/testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/di(1) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/di(0) {-height 16 -radix hexadecimal}} /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/di
add wave -noupdate -radix hexadecimal -childformat {{/testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/do(1) -radix hexadecimal} {/testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/do(0) -radix hexadecimal}} -expand -subitemconfig {/testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/do(1) {-height 16 -radix hexadecimal} /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/do(0) {-height 16 -radix hexadecimal}} /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/do
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/bytes_g(1)/data_phases_g(0)/inbyte_i/apll_q
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/bytes_g(1)/data_phases_g(0)/inbyte_i/phases_g(0)/aser_q
add wave -noupdate /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/bytes_g(1)/data_phases_g(0)/inbyte_i/phases_g(0)/fifo_we
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/bytes_g(1)/data_phases_g(0)/inbyte_i/fifo_di
add wave -noupdate /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/bytes_g(1)/data_phases_g(0)/inbyte_i/ser_clk(0)
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/scope_e/ddr_e/rdfifo_i/bytes_g(1)/data_phases_g(0)/inbyte_i/fifo_do
add wave -noupdate -divider {New Divider}
add wave -noupdate /testbench/ecp3versa_e/scope_e/dataio_e/miitxmem_e/miitx_clk
add wave -noupdate /testbench/ecp3versa_e/scope_e/dataio_e/miitxmem_e/miitx_ena
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/scope_e/dataio_e/miitxmem_e/txd
add wave -noupdate -radix hexadecimal /testbench/ecp3versa_e/scope_e/dataio_e/miitxmem_e/miitx_dat
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11276015000 fs} 0} {{Cursor 2} {20286711000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 129
configure wave -valuecolwidth 92
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
WaveRestoreZoom {11204235 ps} {11347795 ps}
