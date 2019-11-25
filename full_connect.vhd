LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE work.parameters.ALL;

ENTITY full_connect IS
PORT(
	input 				: IN  array_neuron;
	weight 				: IN  array_weight;
	output 				: OUT array_softmax
);
END full_connect;

ARCHITECTURE behavior OF full_connect IS
SIGNAL weight_temp : array_neuron;

COMPONENT perceptron IS
PORT(
	input       : IN  array_neuron;
	weight 		: IN  array_neuron;
	output 		: OUT STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0)
);
END COMPONENT;

BEGIN
layer:
	FOR i IN 1 TO n_perceptrons GENERATE
		Neurons: perceptron 
			PORT MAP(input, weight(i-1), output(i-1));
	END GENERATE layer;

END behavior;