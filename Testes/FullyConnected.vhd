LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.Parameters.ALL;

ENTITY FullyConnected IS
PORT(
	bitControl 			: IN STD_LOGIC;
	input 				: IN  input_image;
	weight 				: IN  array_weight;
	clock					: IN  STD_LOGIC;
	reset					: IN  STD_LOGIC;
	output 				: OUT array_multiplier
);
END FullyConnected;

ARCHITECTURE behavior OF FullyConnected IS
SIGNAL out_layer_1 : input_image;
SIGNAL out_layer_2 : input_image;

SIGNAL input_temp : input_image;
--SIGNAL weight_temp : input_image (ad asd);

COMPONENT Perceptron IS
PORT(
	bitControl 				: IN STD_LOGIC;
	input       			: IN  input_image;
	weight 					: IN  input_image;
	layer_indentifier		: IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	clock						: IN  STD_LOGIC;
	reset		   			: IN  STD_LOGIC;
	output 					: OUT SIGNED( (7 + precision) DOWNTO 0)
);		
END COMPONENT;
BEGIN

--weight_transfer:
--	FOR i IN 0 TO ((data_width * n_perceptrons) - 1) GENERATE
--		weight_temp(i) <= weight(i);
--	END GENERATE weight_transfer;


--layer_1:
--	FOR i IN 1 TO n_perceptrons_1 GENERATE		
--		Neurons_layer_1: perceptron 
--			PORT MAP(input, weight(i-1), "00", clock, reset, out_layer_1(i-1));
	
--	END GENERATE layer_1;

out_layer_1 <= input;

layer_2:
	FOR i IN 1 TO n_perceptrons_2 GENERATE
		Neurons_layer_2: perceptron 
			PORT MAP(bitControl, out_layer_1, weight(i - 1), "01", clock, reset, out_layer_2(i-1));
	
	END GENERATE layer_2;

out_layer_2(20) <= "0000000100000000000000000000000000000000";

layer_output:
	FOR i IN 1 TO n_perceptrons_output GENERATE
		Neurons_layer_output: Perceptron 
			PORT MAP(bitControl, out_layer_2, weight(n_perceptrons_2 + i - 1), "10", clock, reset, output(i-1));
	
	END GENERATE layer_output;
	
END behavior;