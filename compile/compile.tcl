set project_name "Lab_5_TLDE"

file delete -force ../project
file delete -force ../output_files
file mkdir ../project
cd ../project
load_package flow
project_new $project_name
set_global_assignment -name VHDL_INPUT_VERSION VHDL_2008
set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CSEMA5F31C6 
set_global_assignment -name TOP_LEVEL_ENTITY add_sub_tlde
set_global_assignment -name PROJECT_OUTPUT_DIRECTORY ../output_files

# 2] include your relative path files here
set_global_assignment -name VHDL_FILE ../src/generic_add_sub.vhd
set_global_assignment -name VHDL_FILE ../src/seven_seg_display.vhd
set_global_assignment -name VHDL_FILE ../src/add_sub_tlde.vhd

set_location_assignment PIN_AB12  -to reset
set_location_assignment PIN_AF14 -to clk

set_location_assignment PIN_AD11 -to switch[0]
set_location_assignment PIN_AD12 -to switch[1]
set_location_assignment PIN_AE11 -to switch[2]
set_location_assignment PIN_AC9  -to switch[3]
set_location_assignment PIN_AD10 -to switch[4]
set_location_assignment PIN_AE12 -to switch[5]

set_location_assignment PIN_AE26 -to bcd_0[0]
set_location_assignment PIN_AE27 -to bcd_0[1]
set_location_assignment PIN_AE28 -to bcd_0[2]
set_location_assignment PIN_AG27 -to bcd_0[3]
set_location_assignment PIN_AF28 -to bcd_0[4]
set_location_assignment PIN_AG28 -to bcd_0[5]
set_location_assignment PIN_AH28 -to bcd_0[6]

set_location_assignment PIN_AB23 -to bcd_2[0]
set_location_assignment PIN_AE29 -to bcd_2[1]
set_location_assignment PIN_AD29 -to bcd_2[2]
set_location_assignment PIN_AC28 -to bcd_2[3]
set_location_assignment PIN_AD30 -to bcd_2[4]
set_location_assignment PIN_AC29 -to bcd_2[5]
set_location_assignment PIN_AC30 -to bcd_2[6]

set_location_assignment PIN_AA24 -to bcd_4[0]
set_location_assignment PIN_Y23  -to bcd_4[1]
set_location_assignment PIN_Y24  -to bcd_4[2]
set_location_assignment PIN_W22  -to bcd_4[3]
set_location_assignment PIN_W24  -to bcd_4[4]
set_location_assignment PIN_V23  -to bcd_4[5]
set_location_assignment PIN_W25  -to bcd_4[6]

set_location_assignment PIN_AA14 -to p_btn
set_location_assignment PIN_AA15 -to m_btn

execute_flow -compile
project_close