LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE work.parameters.ALL;

ENTITY full_connect IS
PORT(
	input 				: IN  input_image;
	weight 				: IN  array_weight;
	clock					: IN  STD_LOGIC;
	reset					: IN  STD_LOGIC;
	output 				: OUT array_softmax
);
END full_connect;

ARCHITECTURE behavior OF full_connect IS

--SIGNAL weight_temp : input_image (ad asd);

COMPONENT perceptron IS
PORT(
	input       : IN  input_image;
	weight 		: IN  input_image;
	clock			: IN STD_LOGIC;
	reset		   : IN  STD_LOGIC;
	output 		: OUT STD_LOGIC_VECTOR((((2 + precision) * 2) + 1) DOWNTO 0)
);
END COMPONENT;
BEGIN

--weight_transfer:
--	FOR i IN 0 TO ((data_width * n_perceptrons) - 1) GENERATE
--		weight_temp(i) <= weight(i);
--	END GENERATE weight_transfer;

layer:
	FOR i IN 1 TO n_perceptrons GENERATE
		
		--weight_transfer:
		--	FOR j IN 0 TO data_width-1 GENERATE
		--		weight_temp(j) <= weight(((i*data_width) - data_width)+j);
		--	END GENERATE weight_transfer;
		
		Neurons: perceptron 
			PORT MAP(input, weight(i-1), clock, reset, output(i-1));
	
	END GENERATE layer;

	-- ((i*data_width) - 1) DOWNTO ((i*data_width) - data_width)

END behavior;