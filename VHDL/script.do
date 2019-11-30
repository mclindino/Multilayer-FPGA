transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work parameters.vhd
vcom -93 -work work perceptron.vhd
vcom -93 -work work full_connect.vhd
vcom -93 -work work {C:\Users\Aluno\Desktop\MLP\simulation\modelsim\full_connect.vht}

vsim full_connect_vhd_tst

add wave -position insertpoint sim:/full_connect_vhd_tst/*
run 1000ns