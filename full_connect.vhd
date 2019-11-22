LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE work.parameters.ALL;

ENTITY full_connect IS
PORT(
	input 						: IN  array_neuron;
	weight 						: IN  array_weigth;
	output 						: OUT array_softmax
);
END full_connect;

ARCHITECTURE behavior OF full_connect IS
--SIGNAL softmax : float_array_softmax;

COMPONENT perceptron IS
PORT(
	input       : IN  array_neuron;
	weight 		: IN  array_neuron;
	output 		: OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
);
END COMPONENT;

BEGIN

Neuron_zero: perceptron
		PORT MAP(input, weight(0), output(0));
		
Neuron_one: perceptron
		PORT MAP(input, weight(1), output(1));
		
Neuron_two: perceptron
		PORT MAP(input, weight(2), output(2));
		
Neuron_three: perceptron
		PORT MAP(input, weight(3), output(3));
--layer:
--	FOR i IN 1 TO n_perceptrons GENERATE
--		Neurons: perceptron 
--			PORT MAP(input, weight( ((i*(data_width-1))+(i-1)) TO (i*(data_width-1)-(data_width-2)) ), output(i-1));
--	END GENERATE layer;

END behavior;