LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY perceptron IS
PORT(
	input       : IN  array_neuron;
	weight 		: IN  array_neuron;
	clock			: IN STD_LOGIC;
	output 		: OUT STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0)
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
	PROCESS(input, weight,clock)
		VARIABLE results_mul: array_mult;
		VARIABLE sum: STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0);
		BEGIN	
		IF clock'EVENT and clock = '1' THEN	
			FOR i IN 0 TO 15 LOOP
				IF (i mod 2) = 0 THEN
					result(i)
				sum := STD_LOGIC_VECTOR(SIGNED(sum) + SIGNED(input(i)) * SIGNED(weight(i))); 
			END LOOP;
		
			IF(sum(33) = '1') or (sum = (sum'range => '0')) then
				output <= (others => '0');
			ELSE
				output <= sum;
			END IF;
		
		END IF;	
	END PROCESS;	
END behavior; 