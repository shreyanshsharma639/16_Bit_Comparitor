vlib work 
vdel -all
vlib work

vlog mux.v
vlog mux3.v 
vlog comp1.v 
vlog comp2.v 
vlog comp4.v 
vlog comp8.v 
vlog comp16.v 
vlog comp16_tb.v 

vsim work.tb
run -all 