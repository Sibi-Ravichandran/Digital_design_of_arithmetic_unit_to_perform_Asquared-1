-- Project		: COEN6501
-- File Name	: not_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform NOT operation
-- on a binary input.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity not_gate is
	port( A : in std_logic;
		  C : out std_logic);
end not_gate;

-- Architecture Implementation:
architecture notg of not_gate is
begin
	C <= not(A);
end;

-- end of not_gate.vhd