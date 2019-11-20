LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.array_float.ALL;

ENTITY full_connect IS
GENERIC(
	data_width					: INTEGER := 4;
	number_of_perceptrons	: INTEGER := 4);
PORT(
	input 						: IN  float_array_neuron;
	weight 						: IN  float_array_weigth;
	output 						: OUT float_array_softmax
);
END full_connect;

ARCHITECTURE behavior OF full_connect IS
--SIGNAL softmax : float_array_softmax;

COMPONENT perceptron IS
GENERIC(
	data_width: INTEGER);
PORT(
	input       : IN  float_array_neuron;
	weight 		: IN  float_array_neuron;
	output 		: OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
);
END COMPONENT;

BEGIN

layer:
	FOR i IN 1 TO number_of_perceptrons GENERATE
		Neurons: perceptron 
			GENERIC MAP(data_width)
			PORT MAP(input, weight( ((i*(data_width-1))+(i-1)) TO (i*(data_width-1)-(data_width-1)) ), output(i-1));
	END GENERATE layer;

END behavior;