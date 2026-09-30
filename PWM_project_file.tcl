# according to UG895 & UG835 AMD Xilinx guide
# Get the directory containing TCL script
set script_dir [file dirname [file normalize [info script]]]


# Create the project and directory structure and board 
create_project -force PWM $script_dir/PWM -part xc7a35ticsg324-1L
set_property BOARD_PART digilentinc.com:arty-a7-35:part0:1.0 [current_project]
#
# Add various sources to the project
add_files $script_dir/rtl/PWM.v
add_files -fileset constrs_1 $script_dir/xdc/PWM.xdc

#
# Launch Synthesis
launch_runs synth_1
wait_on_run synth_1
open_run synth_1 
#

# Launch Implementation
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
#
start_gui