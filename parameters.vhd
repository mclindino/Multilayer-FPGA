LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

PACKAGE parameters IS
	CONSTANT data_width 			: INTEGER := 4;
	CONSTANT n_perceptrons		: INTEGER := 4;
	CONSTANT n_layers				: INTEGER := 1;
	
	TYPE array_neuron  IS ARRAY(data_width - 1 TO 0) OF STD_LOGIC_VECTOR(16 DOWNTO 0);
--	TYPE array_weigth  IS ARRAY(((n_perceptrons * data_width) - 1) TO 0) OF STD_LOGIC_VECTOR(16 DOWNTO 0);
	TYPE array_weigth  IS ARRAY((n_perceptrons - 1) TO 0) OF array_neuron;
	TYPE array_softmax IS ARRAY((data_width - 1) TO 0) OF STD_LOGIC_VECTOR(33 DOWNTO 0);
END PACKAGE parameters;

PACKAGE BODY parameters IS
END parameters;