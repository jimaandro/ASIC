set_clock_latency -source -early -max -rise  -0.105056 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -fall  -0.103152 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -rise  -0.105056 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -fall  -0.103152 [get_ports {clk}] -clock clk 
