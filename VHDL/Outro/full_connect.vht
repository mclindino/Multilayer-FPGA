LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE work.parameters.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

ENTITY full_connect_vhd_tst IS
END full_connect_vhd_tst;
ARCHITECTURE full_connect_arch OF full_connect_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL bitControl : STD_LOGIC;
SIGNAL input : input_image;
SIGNAL output : array_multiplier;
SIGNAL reset : STD_LOGIC;
SIGNAL weight : array_weight;
COMPONENT full_connect
	PORT (
	bitControl : IN STD_LOGIC;
	clock : IN STD_LOGIC;
	input : IN input_image;
	output : OUT array_multiplier;
	reset : IN STD_LOGIC;
	weight: IN array_weight
	);
END COMPONENT;

FUNCTION strToSigned(input : string) return signed is
	variable temp: signed(input'range);
	begin
		for i in input'range loop
			if (input(i) = '1') then
				temp(i) := '1';
			elsif (input(i) = '0') then
				temp(i) := '0';
			end if;
		end loop;
	return temp;
end function strToSigned;

BEGIN
	i1 : full_connect
	PORT MAP (
-- list connections between master ports and signals
	bitControl => bitControl,
	clock => clock,
	input => input,
	output => output,
	reset => reset,
	weight => weight
	);

PROCESS
BEGIN
	clock <= '1', '0' AFTER 5ns;
	WAIT FOR 10ns;
END PROCESS;

reset <= '1', '0' AFTER 10ns;

PROCESS(clock)

	FILE fileType 		: TEXT open read_mode is "bin_weight_teste.txt";
	FILE inputFile 	: TEXT open read_mode is "bin_input_teste.txt";
--	FILE biasFile 		: TEXT open read_mode is "bin_bias_perceptrons.txt";
	VARIABLE inType	: SIGNED(32 DOWNTO 0);
	VARIABLE strType	: STRING(33 DOWNTO 1);
	VARIABLE lineType : LINE;
	VARIABLE counter  : INTEGER := 0;
	
	BEGIN
		IF clock'EVENT and clock = '1' THEN
			IF counter < 10 THEN
				
				IF counter < 1 THEN
					for i IN 0 TO 9 LOOP
						READLINE(inputFile, lineType);
						READ(lineType, strType);
						input(i) <= strToSigned(strType);
					END LOOP;
--					input(1024) <= "000000000000000000000000000000001";
				END IF;
				
				for j IN 0 TO 9 LOOP
					READLINE(fileType, lineType);
					READ(lineType, strType);
					weight(counter)(j) <= strToSigned(strType);
				END LOOP;
				
--				READLINE(biasFile, lineType);
--				READ(lineType, strType);
--				weight(counter)(1024) <= strToSigned(strType);
				counter := counter + 1;
			ELSE
				bitControl <= '1';
			END IF;
		END IF;
END PROCESS;

--PROCESS(clock)
--
--	FILE fileType 		: TEXT open read_mode is "bin_input_perceptrons.txt";
--	VARIABLE inType	: SIGNED(32 DOWNTO 0);
--	VARIABLE strType	: STRING(33 DOWNTO 1);
--	VARIABLE lineType : LINE;
--	VARIABLE counter  : INTEGER := 0;
--	
--	BEGIN
--		IF clock'EVENT and clock = '1' THEN
--			IF counter < 1 THEN
--				for i IN 0 TO 1023 LOOP
--					READLINE(fileType, lineType);
--					READ(lineType, strType);
--					input(i) <= strToSigned(strType);
--				END LOOP;
--				input(1024) <= "000000000000000000000000000000001";
--				counter := counter + 1;
--			END IF;
--		END IF;
--END PROCESS;
--
--PROCESS(clock)
--
--	FILE fileType 		: TEXT open read_mode is "bin_bias_perceptrons.txt";
--	VARIABLE inType	: SIGNED(32 DOWNTO 0);
--	VARIABLE strType	: STRING(33 DOWNTO 1);
--	VARIABLE lineType : LINE;
--	VARIABLE counter  : INTEGER := 0;
--	
--	BEGIN
--		IF clock'EVENT and clock = '1' THEN
--			IF counter < 10 THEN
--				READLINE(fileType, lineType);
--				READ(lineType, strType);
--				weight(counter)(1024) <= strToSigned(strType);
--				counter := counter + 1;
--			END IF;
--		END IF;
--END PROCESS;


END full_connect_arch;
