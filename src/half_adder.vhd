-- Project		: COEN6501
-- File Name	: half_adder.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 30- October- 2018
-- Description	: 
--					The function of this component is to perform addition on two binary inputs
-- and provide the sum and carry output. This component employs a exor gate and a and gate to 
-- perform this operation.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity half_adder is
	port( A, B : in std_logic;
		  sum, carry : out std_logic);
end half_adder;

-- Architecture Implementation:
architecture ha of half_adder is

-- Component Declaration of XOR gate:
component exor_gate 
	port( A, B : in std_logic;
		  C : out std_logic);
end component;

-- Component Declaration of AND gate:
component and_gate
	port( A, B : in std_logic;
		  C : out std_logic);
end component;

begin

-- SUM = A XOR B and CARRY = A AND B: 
EXOR: exor_gate port map (A,B,sum);
ANDG: and_gate port map (A,B,carry);
	
end;

-- end of half_adder.vhd