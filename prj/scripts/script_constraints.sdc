create_clock -period 10 -waveform {0 5} -name clk [get_ports clk]
set_clock_latency -source 0.400 [get_clocks {clk}]
set_clock_uncertainty 0.050 [get_clocks {clk}]
set_clock_transition 0.1 [get_clocks {clk}]
set_output_delay -clock [get_clocks {clk}] -network_latency_included -max 1 [all_outputs]
set_output_delay -clock [get_clocks {clk}] -network_latency_included -min 0.4 [all_outputs]
set_load 0.5 [all_outputs] -max
set_load 0.01 [all_outputs] -min
set_input_delay -clock [get_clocks {clk}] -network_latency_included -max 1 [all_inputs]
set_input_delay -clock [get_clocks {clk}] -network_latency_included -min 0.4 [all_inputs]
set_driving_cell -lib_cell BUFX2 -max [all_inputs]
set_driving_cell -lib_cell BUFX16 -min [all_inputs]
