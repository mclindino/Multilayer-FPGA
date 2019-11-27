LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY perceptron IS
PORT(
	input       : IN  array_neuron;
	weight 		: IN  array_neuron;
	output 		: OUT STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0)
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
BEGIN

	PROCESS(input, weight)
		variable sum: STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0);
		BEGIN
	
			--Produto Escalar
			FOR i IN 0 TO (data_width-1) LOOP
				sum := STD_LOGIC_VECTOR(SIGNED(sum) + (SIGNED(input(i)) * SIGNED(weight(i))));
			END LOOP;
	
			--ReLu
			IF (sum(33) = '1') OR (sum = (sum'range => '0')) THEN
				output <= (others => '0');
			ELSE
				output <= sum;
			END IF;
	END PROCESS;
	
END behavior; 