-- Project		: COEN6501
-- File Name	: sign_to_unsign.vhd 
-- Author		: Sibi Ravichandran
-- Date			: 31- October- 2018
-- Description	: 
--					The function of this component is to check the Most Significant Byte
-- of the input and decide whether it is a negative number or positive number. If it is 
-- a negative number, then the component will convert the negative number into positive 
-- number and pass it as output, else it will pass the input as output without any changes.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity sign_2_unsign is
	port( input  	: in std_logic_vector (7 downto 0);
		  A 		: out std_logic_vector (7 downto 0));
end sign_2_unsign;

-- Architecture Implementation:
architecture s2us of sign_2_unsign is

-- Component Declaration of not_gate:
component not_gate 
	port( A : in std_logic;
		  C : out std_logic);
end component;

-- Component Declaration of ripple_carry_8bit:
Component ripple_carry_8bit 
	port( A, B  	: in std_logic_vector (7 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (7 downto 0);
		  carry_out : out std_logic);
end Component;

-- Signal to hold temporary values:
signal complement: std_logic_vector (7 downto 0);
signal one: std_logic_vector (7 downto 0);
signal output: std_logic_vector (7 downto 0);
signal carry_in: std_logic;
signal carry_out: std_logic;

begin

-- Taking 1's complement: 
complement <= NOT (input);

-- Assign the signal one with the value "00000001":
one <= "00000001";

-- Assign the signal carry_in with the value '0':
carry_in <='0';

-- Convert 1's complement number to 2's complement: 
RCA8: ripple_carry_8bit port map (complement (7 downto 0),one (7 downto 0), carry_in, output (7 downto 0), carry_out);

-- Pass the output value depending on the input:
process (input,output)
begin 
	if input(7)='0' then
		A <=input;
	elsif input(7)='1' then 
	  A <=output;
	end if;
end process;
end;

-- end of sign_to_unsign.vhd