LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
USE work.Parameters.all;
use STD.textio.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;

ENTITY FullyConnected_vhd_tst IS
END FullyConnected_vhd_tst;
ARCHITECTURE FullyConnected_arch OF FullyConnected_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL bitControl : STD_LOGIC;
SIGNAL input : input_image;
SIGNAL output : array_multiplier;
SIGNAL reset : STD_LOGIC;
SIGNAL weight : array_weight;
COMPONENT FullyConnected
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

FUNCTION signedToStr(input : SIGNED) RETURN STRING IS
	VARIABLE temp: STRING(input'left+1 DOWNTO 1);
	BEGIN
		FOR i IN input'reverse_range LOOP
			IF (input(i) = '1') THEN
				temp(i + 1) := '1';
			ELSIF (input(i) = '0') THEN
				temp(i + 1) := '0';
			END IF;
		END LOOP;
		
		RETURN temp;
END FUNCTION signedToStr;

BEGIN
	i1 : FullyConnected
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


READFILE: PROCESS(clock)

	FILE weightFile 	: TEXT open read_mode is "binWeight2010MLP.txt";
	FILE inputFile 	: TEXT open read_mode is "binInput2010MLP.txt";
	FILE biasFile 		: TEXT open read_mode is "binBias2010MLP.txt";
	VARIABLE inType	: SIGNED( (7 + precision) DOWNTO 0);
	VARIABLE strType	: STRING( (8 + precision) DOWNTO 1);
	VARIABLE lineType : LINE;
	VARIABLE counter  : INTEGER := 0;
	
	BEGIN
		IF clock'EVENT and clock = '1' THEN
			
			IF counter < n_perceptrons_2 THEN
				
				IF counter < 1 THEN
					for i IN 0 TO (data_width - 1) LOOP
						READLINE(inputFile, lineType);
						READ(lineType, strType);
						input(i) <= strToSigned(strType);
					END LOOP;
					input(data_width) <= "0000000100000000000000000000000000000000";
				END IF;
				
				for j IN 0 TO (data_width - 1) LOOP
					READLINE(weightFile, lineType);
					READ(lineType, strType);
					weight(counter)(j) <= strToSigned(strType);
				END LOOP;
				
				READLINE(biasFile, lineType);
				READ(lineType, strType);
				weight(counter)(data_width) <= strToSigned(strType);
				counter := counter + 1;
			
			ELSIF (counter < (n_perceptrons_2 + n_perceptrons_output)) THEN
				
				FOR j IN 0 TO 19 LOOP
					READLINE(weightFile, lineType);
					READ(lineType, strType);
					weight(counter)(j) <= strToSigned(strType);
				END LOOP;
				
				READLINE(biasFile, lineType);
				READ(lineType, strType);
				weight(counter)(20) <= strToSigned(strType);
				
				counter := counter + 1;
			ELSE
				bitControl <= '1';
			END IF;
		END IF;
END PROCESS;

--WRITEFILE: PROCESS
----	VARIABLE outFile : OPEN WRITE_MODE IS "OUT.txt";
--	VARIABLE strOut  : STRING( (8 + precision) DOWNTO 1);
--	VARIABLE outLine : LINE;
--	
--	BEGIN
--		FILE_OPEN(outfile, "OUT.txt", WRITE_MODE);
--		WAIT UNTIL (FALLING_EDGE(clock));
--		FOR I IN 0 TO 10 LOOP
--			strOut <= signedToStr(output(i));
--		END LOOP;
--		
--		WRITE(outLine, strOut);
--		WRITELINE(outfile, outLine);
--END PROCESS;
			
-- Perceptron
--PROCESS(clock)
--
--	FILE weightFile 	: TEXT open read_mode is "binWeight10P.txt";
--	FILE inputFile 	: TEXT open read_mode is "binInput10P.txt";
--	FILE biasFile 		: TEXT open read_mode is "binBias10P.txt";
--	VARIABLE inType	: SIGNED( (7 + precision) DOWNTO 0);
--	VARIABLE strType	: STRING( (8 + precision) DOWNTO 1);
--	VARIABLE lineType : LINE;
--	VARIABLE counter  : INTEGER := 0;
--	
--	BEGIN
--		IF clock'EVENT and clock = '1' THEN
--			IF counter < n_perceptrons_output THEN
--				
--				IF counter < 1 THEN
--					for i IN 0 TO (data_width - 1) LOOP
--						READLINE(inputFile, lineType);
--						READ(lineType, strType);
--						input(i) <= strToSigned(strType);
--					END LOOP;
--					input(data_width) <= "0000000100000000000000000000000000000000";
--				END IF;
--				
--				for j IN 0 TO (data_width - 1) LOOP
--					READLINE(weightFile, lineType);
--					READ(lineType, strType);
--					weight(counter)(j) <= strToSigned(strType);
--				END LOOP;
--				
--				READLINE(biasFile, lineType);
--				READ(lineType, strType);
--				weight(counter)(data_width) <= strToSigned(strType);
--				counter := counter + 1;
--			ELSE
--				bitControl <= '1';
--			END IF;
--		END IF;
--END PROCESS;

END FullyConnected_arch;
