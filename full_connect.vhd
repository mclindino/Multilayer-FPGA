LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.array_integer.ALL;

ENTITY full_connect IS
PORT(
	input : IN integer_array;
	weight : IN integer_array;
	output : OUT INTEGER
);
END full_connect;

ARCHITECTURE behavior OF full_connect IS

COMPONENT perceptron IS
PORT(
	input : IN integer_array;
	weight : IN integer_array;
	output : OUT INTEGER
);
END COMPONENT;

BEGIN

END behavior;