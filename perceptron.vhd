LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY perceptron IS
PORT(
	input       : IN array_neuron;
	weight 		: IN array_neuron;
	output 		: OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
BEGIN

PROCESS(input, weight)
variable temp: STD_LOGIC_VECTOR(33 DOWNTO 0);
BEGIN
	
	--Produto Escalar
	FOR i IN 0 TO data_width LOOP
		temp := STD_LOGIC_VECTOR(SIGNED(temp) + (SIGNED(input(i)) * SIGNED(weight(i))));
	END LOOP;
	
	--ReLu
	IF (temp(33) = '1') OR (temp = (temp'range => '0')) THEN
		output <= (others => '0');
	ELSE
		output <= temp;
	END IF;
	
END PROCESS;	
END behavior; 