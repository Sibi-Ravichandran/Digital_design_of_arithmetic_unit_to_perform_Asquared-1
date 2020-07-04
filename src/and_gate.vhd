-- Project		: COEN6501
-- File Name	: and_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform AND operation
-- on two binary inputs.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity and_gate is
	port( A, B : in std_logic;
		  C : out std_logic);
end and_gate;

-- Architecture Implementation:
architecture andg of and_gate is
begin
	C <= A and B;
end;

-- end of and_gate.vhd