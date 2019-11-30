LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.parameters.ALL;

ENTITY perceptron IS
PORT(
	input       : IN  input_image;
	weight 		: IN  input_image;
	clock			: IN  STD_LOGIC;
	reset		   : IN  STD_LOGIC;
	output 		: OUT STD_LOGIC_VECTOR((((2 + precision) * 2) + 1) DOWNTO 0)
);
END perceptron;

ARCHITECTURE behavior OF perceptron IS
SIGNAL sum: STD_LOGIC_VECTOR((((2 + precision) * 2) + 1) DOWNTO 0);
SIGNAL valid_bit: STD_LOGIC;

	--signal aux1, aux2, aux3, aux4, aux5, aux6, aux7, aux8, aux9, aux10, aux11, aux12, aux13, aux14, aux15, aux16  : SIGNED((((8 + precision) * 2) + 1) DOWNTO 0);
	--signal aux_sum2 : signed((((8 + precision) * 2) + 1) DOWNTO 0);
--SIGNAL bit_controle: STD_LOGIC;
BEGIN
	PROCESS(input, weight,clock)
		VARIABLE aux : STD_LOGIC_VECTOR((((2 + precision) * 2) + 1) DOWNTO 0);
		VARIABLE aux_sum : STD_LOGIC_VECTOR((((2 + precision) * 2) + 1) DOWNTO 0);
		--VARIABLE validaInput, validaWeight : STD_LOGIC_VECTOR((((8 + precision) * 2) + 1) DOWNTO 0);
		--variable cont : integer range 0 to 32 := 0;
		BEGIN	
		IF reset = '1' THEN
			sum <= (others => '0');
			valid_bit <= '0';
			aux_sum := (others => '0');
			aux := (others => '0');
			--output <= (others => '0');
			
		ELSIF clock'EVENT and clock = '1' THEN
			IF valid_bit = '0' THEN
				aux_sum := sum;
				FOR i IN 0 TO (data_width-1) LOOP
					aux := STD_LOGIC_VECTOR( SIGNED(input(i)) * SIGNED(weight(i)) );
					aux_sum := STD_LOGIC_VECTOR( SIGNED(aux_sum) + SIGNED(aux) );
				END LOOP;
				sum <= aux_sum;
				valid_bit <= '1';
			END IF;
			
			
			--if (cont < 16) then
			--	aux := STD_LOGIC_VECTOR(SIGNED(input(cont)) * SIGNED(weight(cont)));
			--	sum <= STD_LOGIC_VECTOR(SIGNED(sum) + SIGNED(aux));
			--	cont := cont + 1;
			--else
			--	cont := 0;
			--end if;
			--aux1 <= SIGNED(input(0)) * SIGNED(weight(0));
			--aux2 <= SIGNED(input(1)) * SIGNED(weight(1));
			--aux3 <= SIGNED(input(2)) * SIGNED(weight(2));
			--aux4 <= SIGNED(input(3)) * SIGNED(weight(3));
			--aux5 <= SIGNED(input(4)) * SIGNED(weight(4));
			--aux6 <= SIGNED(input(5)) * SIGNED(weight(5));
			--aux7 <= SIGNED(input(6)) * SIGNED(weight(6));
			--aux8 <= SIGNED(input(7)) * SIGNED(weight(7));
			--aux9 <= SIGNED(input(8)) * SIGNED(weight(8));
			--aux10 <= SIGNED(input(9)) * SIGNED(weight(9));
			--aux11 <= SIGNED(input(10)) * SIGNED(weight(10));
			--aux12 <= SIGNED(input(11)) * SIGNED(weight(11));
			--aux13 <= SIGNED(input(12)) * SIGNED(weight(12));
			--aux14 <= SIGNED(input(13)) * SIGNED(weight(13));
			--aux15 <= SIGNED(input(14)) * SIGNED(weight(14));
			--aux16 <= SIGNED(input(15)) * SIGNED(weight(15));
			--validaInput := "0000000000000000000000000" & input(cont)(16 downto 8);
			--validaWeight := "0000000000000000000000000" & weight(cont)(16 downto 8);
		
		END IF;
		
	END PROCESS;
	
	PROCESS(sum)
	BEGIN
		IF (sum(68) = '1') OR (sum = (sum'range => '0')) THEN
			output <= (others => '0');
		ELSE
			output <= sum;
		END IF;
	END PROCESS;
		--output <= "0000000000000000" & sum(33 downto 16);
		--aux_sum2 <= aux1 + aux2 + aux3 + aux4 + aux5 + aux6 + aux7 + aux8 + aux9 + aux10 + aux11 + aux12 + aux13 + aux14 + aux15 + aux16;
		
END behavior; 