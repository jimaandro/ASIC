if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast_vdd1v0_basicCells.lib\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib]
create_op_cond -name OpCond1 -library_file ${::IMEX::libVar}/mmmc/fast_vdd1v0_basicCells.lib -P 1 -V 1.1 -T 0
create_rc_corner -name QRCtch\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -postRoute_clkcap 1\
   -postRoute_clkres 1\
   -T 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/QRCtch/gpdk045.tch
create_delay_corner -name DelayCorner1\
   -library_set fast_vdd1v0_basicCells.lib\
   -rc_corner QRCtch
create_constraint_mode -name Const1\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/Const1/Const1.sdc]
create_analysis_view -name AnV1 -constraint_mode Const1 -delay_corner DelayCorner1 -latency_file ${::IMEX::dataVar}/mmmc/views/AnV1/latency.sdc
set_analysis_view -setup [list AnV1] -hold [list AnV1]
