LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use work.parameters.all;

ENTITY perceptron_vhd_tst IS
END perceptron_vhd_tst;
ARCHITECTURE perceptron_arch OF perceptron_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL input : array_neuron;
SIGNAL output : STD_LOGIC_VECTOR(33 DOWNTO 0);
SIGNAL weight : array_neuron;
COMPONENT perceptron
	PORT (
	clock : IN STD_LOGIC;
	input : IN array_neuron;
	output : OUT STD_LOGIC_VECTOR(33 DOWNTO 0);
	weight : IN array_neuron
	);
END COMPONENT;
BEGIN
	i1 : perceptron
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	input => input,
	output => output,
	weight => weight
	);
PROCESS
BEGIN
	clock <= '1', '0' AFTER 5ns;
	WAIT FOR 10ns;
END PROCESS;

--Inputs
input(0) <= "01001000100000000";
input(1) <= "00110010000000000";
input(2) <= "11111110000000000";
input(3) <= "00010000000000000";
input(4) <= "00000111100000000";
input(5) <= "00011110100000000";
input(6) <= "00101011100000000";
input(7) <= "00110110100000000";
input(8) <= "01100100100000000";
input(9) <= "01111010100000000";
input(10) <= "00110001000000000";
input(11) <= "00001011100000000";
input(12) <= "00000010000000000";
input(13) <= "00011100000000000";
input(14) <= "11111111100000000";
input(15) <= "00001011100000000";

--Weights
weight(0) <= "00000000100111011";
weight(1) <= "00000000010100111";
weight(2) <= "00000000100111011";
weight(3) <= "11111111100010111";
weight(4) <= "00001010001010101";
weight(5) <= "00000000000110001";
weight(6) <= "00000000100111011";
weight(7) <= "11111111110011010";
weight(8) <= "11111111110001101";
weight(9) <= "11111111100000000";
weight(10) <= "00000000000111011";
weight(11) <= "00000000010011001";
weight(12) <= "11111111001011101";
weight(13) <= "00000000111011011";
weight(14) <= "11111111010001101";
weight(15) <= "00000000100011111";
































	
END perceptron_arch;
