LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY sum IS
PORT(
		op1		: IN  STD_LOGIC_VECTOR(((8+precision)*2)-1 DOWNTO 0);
		op2		: IN  STD_LOGIC_VECTOR(((8+precision)*2)-1 DOWNTO 0);
		result	: OUT	STD_LOGIC_VECTOR(((8+precision)*2)-1 DOWNTO 0)
);
END sum;

ARCHITECTURE behavior OF sum IS
BEGIN
	result <= STD_LOGIC_VECTOR(SIGNED(op1) + SIGNED(op2));
END behavior;
