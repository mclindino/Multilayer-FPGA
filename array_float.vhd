LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

PACKAGE array_float IS
	--GENERIC(data_width: INTEGER := 4);
	TYPE float_array_neuron IS ARRAY( (4 - 1) DOWNTO 0) OF STD_LOGIC_VECTOR(16 DOWNTO 0);
	TYPE float_array_weigth IS ARRAY( (4 * 2) - 1 DOWNTO 0) OF STD_LOGIC_VECTOR(16 DOWNTO 0);
	TYPE float_array_softmax IS ARRAY( (4 - 1) DOWNTO 0) OF STD_LOGIC_VECTOR(33 DOWNTO 0);
END PACKAGE array_float;

PACKAGE BODY array_float IS
END array_float;