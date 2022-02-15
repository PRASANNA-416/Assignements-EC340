transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/91831/Desktop/Tech\ and\ inno/nitk/sem-4\ kill\ it/ec340\ COA/assignments/Assignment\ 1/Assignement-1-EC340/adder8 {C:/Users/91831/Desktop/Tech and inno/nitk/sem-4 kill it/ec340 COA/assignments/Assignment 1/Assignement-1-EC340/adder8/adder8.v}

vlog -vlog01compat -work work +incdir+C:/Users/91831/Desktop/Tech\ and\ inno/nitk/sem-4\ kill\ it/ec340\ COA/assignments/Assignment\ 1/Assignement-1-EC340/adder8/Quartus/.. {C:/Users/91831/Desktop/Tech and inno/nitk/sem-4 kill it/ec340 COA/assignments/Assignment 1/Assignement-1-EC340/adder8/Quartus/../adder8_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  adder8_tb

add wave *
view structure
view signals
run -all
