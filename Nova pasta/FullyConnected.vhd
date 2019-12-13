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
SIGNAL layer_before : STD_LOGIC_VECTOR( (n_perceptrons_2 - 1) DOWNTO 0);
SIGNAL layer_before_2 : STD_LOGIC_VECTOR( (n_perceptrons_2 - 1) DOWNTO 0);
SIGNAL bitControl_another : STD_LOGIC := '0';
SIGNAL input_temp : input_image;
SIGNAL bitControl_another2 : STD_LOGIC := '0';
SIGNAL nLayer : INTEGER;

--SIGNAL weight_temp : input_image (ad asd);

COMPONENT Perceptron IS
PORT(
	bitControl 				: IN STD_LOGIC;
	input       			: IN  input_image;
	weight 					: IN  input_image;
	layer_indentifier		: IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	clock						: IN  STD_LOGIC;
	reset		   			: IN  STD_LOGIC;
	output 					: OUT SIGNED((7 + precision) DOWNTO 0)
);
END COMPONENT;
BEGIN

--weight_transfer:
--	FOR i IN 0 TO ((data_width * n_perceptrons) - 1) GENERATE
--		weight_temp(i) <= weight(i);
--	END GENERATE weight_transfer;
--nLayer <= n_layers;
--PROCESS(nLayer, out_layer_2, out_layer_1)
--BEGIN
--	IF nLayer = 0 THEN
--		out_layer_2 <= input;
--		bitControl_another <= bitControl;
--	ELSIF nLayer = 1 THEN
--		bitControl_another2 <= bitControl;
--		out_layer_1 <= input;
--		out_layer_2(n_perceptrons_2) <= "0000000100000000000000000000000000000000";
--		
--		IF (out_layer_2(n_perceptrons_2 - 1) = (out_layer_2(n_perceptrons_2 - 1)'range => '0')) THEN
--			bitControl_another <= '0';
--		ELSE
--			bitControl_another <= '1';
--		END IF;
--	ELSE
--		IF (out_layer_1(n_perceptrons_1) = (out_layer_2(n_perceptrons_1)'range => '0')) THEN
--			bitControl_another2 <= '0';
--		ELSE
--			bitControl_another2 <= '1';
--		END IF;
--		
--		IF (out_layer_1(n_perceptrons_2) = (out_layer_2(n_perceptrons_2)'range => '0')) THEN
--			bitControl_another <= '0';
--		ELSE
--			bitControl_another <= '1';
--		END IF;
--		
--	END IF;
--END PROCESS;

--layer_1:
--	FOR i IN 1 TO n_perceptrons_1 GENERATE		
--		Neurons_layer_1: perceptron 
--			PORT MAP(bitControl, input, weight(i-1), "00", clock, reset, out_layer_1(i-1));
--	
--	END GENERATE layer_1;

--out_layer_1 <= input;
--bitControl_another2 <= bitControl;

layer_2:
	FOR i IN 1 TO n_perceptrons_2 GENERATE
		Neurons_layer_2: perceptron 
			PORT MAP(bitControl_another2, out_layer_1, weight(i - 1), "01", clock, reset, out_layer_2(i -1));
	
	END GENERATE layer_2;
	
--out_layer_2(n_perceptrons_2) <= "0000000100000000000000000000000000000000";
--
--PROCESS(out_layer_2, clock)
--BEGIN
--	IF (out_layer_2(19) = (out_layer_2(19)'range => '0')) THEN
--		bitControl_another <= '0';
--	ELSE
--		bitControl_another <= '1';
--	END IF;
--END PROCESS;

out_layer_2 <= input;
bitControl_another <= bitControl;

layer_output:
	FOR i IN 1 TO n_perceptrons_output GENERATE
		Neurons_layer_output: Perceptron 
			PORT MAP(bitControl_another, out_layer_2, weight(n_perceptrons_2 + i - 1), "10", clock, reset, output(i-1));
	
	END GENERATE layer_output;
	
END behavior;