#MAKEFILE del multiplicador de 32 bits de 2 entradas

All:
	iverilog -o testbench testbench.v
	vvp testbench
	gtkwave prueba.sav 
	
<<<<<<< HEAD
Pruebas: 
=======
signals: 
>>>>>>> 88ec4b88001d732b8363c362ae0e8f66e74062d0
	iverilog -o testbench testbench.v
	vvp testbench
	gtkwave signals.sav 
