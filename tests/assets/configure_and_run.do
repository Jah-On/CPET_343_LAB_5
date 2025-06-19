onerror {resume}
quietly WaveActivateNextPane {} 0

radix define States {
    "7'b1000000" "0" -color "magenta",
    "7'b1111001" "1" -color "magenta",
    "7'b0100100" "2" -color "magenta",
    "7'b0110000" "3" -color "magenta",
    "7'b0011001" "4" -color "magenta",
    "7'b0010010" "5" -color "magenta",
    "7'b0000010" "6" -color "magenta",
    "7'b1111000" "7" -color "magenta",
    "7'b0000000" "8" -color "magenta",
    "7'b0011000" "9" -color "magenta",
    "7'b0001000" "A" -color "magenta",
    "7'b0000011" "B" -color "magenta",
    "7'b1000110" "C" -color "magenta",
    "7'b0100001" "D" -color "magenta",
    "7'b0000110" "E" -color "magenta",
    "7'b0001110" "F" -color "magenta",
    -default default
}

# Add wave lines here...  i.e. add wave -noupdate -color #eb34eb /tb/led_output
add wave -noupdate /add_sub_tlde_bench/uut/clk
add wave -noupdate /add_sub_tlde_bench/uut/reset
add wave -radix unsigned -noupdate /add_sub_tlde_bench/uut/alu/int_a
add wave -radix unsigned -noupdate /add_sub_tlde_bench/uut/alu/int_b
add wave -noupdate /add_sub_tlde_bench/uut/p_btn
add wave -noupdate /add_sub_tlde_bench/uut/m_btn
add wave -radix States -noupdate /add_sub_tlde_bench/uut/bcd_4
add wave -radix States -noupdate /add_sub_tlde_bench/uut/bcd_2
add wave -radix States -noupdate /add_sub_tlde_bench/uut/bcd_0

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 40
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
WaveRestoreZoom {101 ns} {206 ns}
run 4000 ns