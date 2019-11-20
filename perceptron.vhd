LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_signed.ALL;
USE work.array_float.ALL;

ENTITY perceptron IS
GENERIC(
	data_width  : INTEGER);
PORT(
	input       : IN float_array_neuron;
	weight 		: IN float_array_neuron;
	output 		: OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
BEGIN

PROCESS(input, weight)
variable temp: STD_LOGIC_VECTOR(33 DOWNTO 0);
BEGIN
	
	--Produto Escalar
	FOR i IN 0 TO (data_width - 1) LOOP
		temp := temp + (input(i) * weight(i));
	END LOOP;
	
	--ReLu
	IF temp = 0 THEN
		output <= (others => '0');
	ELSE
		output <= temp;
	END IF;
	
END PROCESS;	
END behavior; 