-- Project		: COEN6501
-- File Name	: full_adder.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 30- October- 2018
-- Description	: 
--					The function of this component is to perform addition on three binary inputs
-- and provide the sum and carry output. This component employs two half adders and one OR gate to 
-- perform this operation.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity full_adder is
	port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end full_adder;

-- Architecture Implementation:
architecture fa of full_adder is

-- Component Declaration of half_adder gate:
Component half_adder
	port( A, B : in std_logic;
		  sum, carry : out std_logic);
end Component;

-- Component Declaration of OR gate:
component or_gate
	port( A, B : in std_logic;
		  C : out std_logic);
end component;

-- Signal declaration of internal variables:
signal carry_propagate: std_logic;
signal carry_generate_1: std_logic;
signal carry_generate_2: std_logic;

begin

-- SUM = A XOR B and CARRY = A AND B: 
PG: half_adder port map (A,B,carry_propagate,carry_generate_1);
SC: half_adder port map (carry_propagate, carry_in, sum, carry_generate_2);
ORG: or_gate port map (carry_generate_1,carry_generate_2, carry_out);

end;

-- end of full_adder.vhd