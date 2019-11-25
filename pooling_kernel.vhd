LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE work.parameters.ALL;

ENTITY pooling_kernel IS
PORT(
		input		: 	IN  array_pooling;
		output	:	OUT STD_LOGIC_VECTOR(16 DOWNTO 0)
);
END pooling_kernel;

ARCHITECTURE behavior OF pooling_kernel IS
BEGIN
	PROCESS(input)
	VARIABLE max : STD_LOGIC_VECTOR(16 DOWNTO 0) := (others => '0');
	BEGIN
		FOR i IN 0 TO pooling_width LOOP
			IF max < input(pooling_width) THEN
				max := input(pooling_width);
			END IF;
		END LOOP;
	output <= max;
	END PROCESS;
END behavior;
