LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE work.parameters.ALL;

ENTITY full_connect IS
PORT(
	input 				: IN  array_neuron;
	weight 				: IN  array_weight;
	output 				: OUT array_softmax;
	weight_temp1		: OUT array_neuron;
	sum1			: OUT array_softmax
);
END full_connect;

ARCHITECTURE behavior OF full_connect IS
SIGNAL weight_temp : array_neuron;

COMPONENT perceptron IS
PORT(
	input       : IN  array_neuron;
	weight 		: IN  array_neuron;
	output 		: OUT STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0);
	sum1			: OUT STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0)
);
END COMPONENT;

BEGIN

weight_transfer:
	FOR i IN 0 TO ((data_width * n_perceptrons) - 1) GENERATE
		weight_temp(i) <= weight(i);
	END GENERATE weight_transfer;

weight_temp1 <= weight_temp;

layer:
	FOR i IN 1 TO n_perceptrons GENERATE
		Neurons: perceptron 
			PORT MAP(input, weight_temp, output(i-1), sum1(i-1));
	END GENERATE layer;

	-- ((i*data_width) - 1) DOWNTO ((i*data_width) - data_width)

END behavior;