#MAKEFILE del multiplicador de 32 bits de 2 entradas

All:
	iverilog -o testbench testbench.v
	vvp testbench
	gtkwave prueba.sav 
	
Pruebas: 
	iverilog -o testbench testbench.v
	vvp testbench
	gtkwave signals.sav 
