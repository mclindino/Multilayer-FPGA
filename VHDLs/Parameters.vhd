LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE Parameters IS
	CONSTANT image_height			: INTEGER := 32;													-- Altura da imagem
	CONSTANT image_width				: INTEGER := 32;													-- Largura da imagem
	CONSTANT data_width 				: INTEGER := image_height*image_width;						-- Entrada no perceptron
	CONSTANT n_perceptrons_1		: INTEGER := 0;													-- Numero de perceptrons 1 camada
	CONSTANT n_perceptrons_2		: INTEGER := 20;													-- Numero de perceptrons 2 camada
	CONSTANT n_perceptrons_output : INTEGER := 10;													-- Numero de perceptrons output
	CONSTANT n_layers					: INTEGER := 1;													-- Numero de camadas
	CONSTANT precision				: INTEGER := 32;													-- Precisao de casa decimais em bits
	
	TYPE input_image   IS ARRAY(data_width DOWNTO 0) OF SIGNED( (7 + precision) DOWNTO 0);																							-- Tamanho de entradas do perceptron
	TYPE array_weight  IS ARRAY((n_perceptrons_1 + n_perceptrons_2 + n_perceptrons_output)-1 DOWNTO 0) OF input_image;													-- Tamanho de pesos totais
	TYPE array_multiplier IS ARRAY((n_perceptrons_output- 1) DOWNTO 0) OF SIGNED( ( 7 + precision) DOWNTO 0);
	
END PACKAGE Parameters;

PACKAGE BODY Parameters IS
END Parameters;

