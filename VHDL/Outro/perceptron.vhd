LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY perceptron IS
PORT(
	bitControl 				: IN STD_LOGIC;
	input       			: IN  input_image;
	weight 					: IN  input_image;
	layer_indentifier		: IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
	clock						: IN  STD_LOGIC;
	reset		   			: IN  STD_LOGIC;
	output 					: OUT SIGNED(precision DOWNTO 0)
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
SIGNAL sum: SIGNED(((precision * 2) + 1) DOWNTO 0);
SIGNAL valid_bit: STD_LOGIC := '0';
SIGNAL ReLu: SIGNED(((precision * 2) + 1) DOWNTO 0);

BEGIN
	PROCESS(input, weight, clock, reset)
		VARIABLE aux : SIGNED(((precision * 2) + 1) DOWNTO 0);
		VARIABLE aux_sum : SIGNED(((precision * 2) + 1) DOWNTO 0);
		VARIABLE meAjuda1, meAjuda2, meAjuda3,meAjuda10,meAjuda4,meAjuda5,meAjuda6,meAjuda7,meAjuda8,meAjuda9 : SIGNED(((precision * 2) + 1 ) DOWNTO 0);
		VARIABLE sumAjuda: SIGNED(35 DOWNTO 0);
		BEGIN	
		IF reset = '1' THEN
			sum <= (others => '0');
			valid_bit <= '0';
			aux_sum := (others => '0');
			aux := (others => '0');
			
		ELSIF clock'EVENT and clock = '1' THEN
			IF bitControl = '1' THEN
				IF valid_bit = '0' THEN
	--				aux_sum := sum;
	--				IF layer_indentifier = "00" THEN
	--					FOR i IN 0 TO (data_width-1) LOOP
	--						aux := input(i) * weight(i);
	--						aux_sum := aux_sum + aux;
	--					END LOOP;
	--				ELSIF layer_indentifier = "01" THEN
	--					FOR i IN 0 TO (n_perceptrons_1) LOOP
	--						aux := input(i) * weight(i);
	--						aux_sum := aux_sum + aux;
	--					END LOOP;
					IF layer_indentifier = "10" THEN
						FOR i IN 0 TO data_width LOOP
							aux := input(i) * weight(i);
							aux_sum := aux_sum + aux;
						END LOOP;
						
					meAjuda1 := input(0) * weight(0);
					meAjuda2 := input(1) * weight(1);
					meAjuda3 := input(2) * weight(2);
					meAjuda4 := input(3) * weight(3);
					meAjuda5 := input(4) * weight(4);
					meAjuda6 := input(5) * weight(5);
					meAjuda7 := input(6) * weight(6);
					meAjuda8 := input(7) * weight(7);
					meAjuda9 := input(8) * weight(8);
					meAjuda10 := input(9) * weight(9);
					
					sumAjuda := meAjuda1(64 DOWNTO 29) + meAjuda2(64 DOWNTO 30) + meAjuda3(64 DOWNTO 30) + meAjuda4(64 DOWNTO 30) + meAjuda5(64 DOWNTO 30) + meAjuda6(64 DOWNTO 30) + meAjuda7(64 DOWNTO 30) + meAjuda8(64 DOWNTO 30) + meAjuda9(64 DOWNTO 30) + meAjuda10(64 DOWNTO 30);
					END IF;
					sum <= aux_sum;
					valid_bit <= '1';
				END IF;
			END IF;
		END IF;
		
--		IF (sum(65) = '1') OR (sum = (sum'range => '0')) THEN
--			ReLu <= (others => '0');
--		ELSE
--			ReLu <= sum;
--		END IF;
--		
--		output <= ReLu((precision * 2) DOWNTO precision);
		output <= sum((precision * 2) DOWNTO precision);
	END PROCESS;		
END behavior; 