LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

PACKAGE parameters IS
	CONSTANT image_height		: INTEGER := 4;													-- Altura da imagem
	CONSTANT image_width			: INTEGER := 4;													-- Largura da imagem
	CONSTANT data_width 			: INTEGER := image_height*image_width;						-- Entrada no perceptron
	CONSTANT n_perceptrons		: INTEGER := 2;													-- Numero de perceptrons
	CONSTANT n_layers				: INTEGER := 1;													-- Numero de camadas
	CONSTANT pooling_width		: INTEGER := 4;													-- Entrada pooling kernel (x^2)
	CONSTANT precision			: INTEGER := 8;													-- Precisao de casa decimais em bits
	
	TYPE array_neuron  IS ARRAY(data_width - 1 DOWNTO 0) OF STD_LOGIC_VECTOR((8 + precision) DOWNTO 0);						-- Tamanho de entradas do perceptron
--	TYPE array_mult	 IS ARRAY( ((data_width-1)/2) DOWNTO 0) OF STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0)  -- Tamanho da multiplicacao
	TYPE array_weight	 IS ARRAY((data_width*n_perceptrons)-1 DOWNTO 0) OF STD_LOGIC_VECTOR((8 + precision) DOWNTO 0);    -- Tamanho de pesos totais
--	TYPE array_weight  IS ARRAY((n_perceptrons-1) DOWNTO 0) OF array_neuron;															-- Tamanho de pesos totais
	TYPE array_softmax IS ARRAY((n_perceptrons-1) DOWNTO 0) OF STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0);		--	Saida de uma layer
	TYPE array_pooling IS ARRAY(pooling_width DOWNTO 0) OF STD_LOGIC_VECTOR((8 + precision) DOWNTO 0);							-- Tamanho do kernel (pooling)
	
END PACKAGE parameters;

PACKAGE BODY parameters IS
END parameters;