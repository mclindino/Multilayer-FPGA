LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.array_integer.ALL;


ENTITY perceptron IS
GENERIC(
	data_width: INTEGER := 10);
PORT(
	input : IN integer_array;
	weight : IN integer_array;
	output : OUT INTEGER
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
BEGIN

PROCESS(input, weight)
variable temp: INTEGER;
BEGIN
	
	--Produto Escalar
	FOR i IN 0 TO (data_width - 1) LOOP
		temp := temp + (input(i) * weight(i));
	END LOOP;
	
	--ReLu
	IF temp = 0 THEN
		output <= 0;
	ELSE
		output <= temp;
	END IF;
	
END PROCESS;	
END behavior; 