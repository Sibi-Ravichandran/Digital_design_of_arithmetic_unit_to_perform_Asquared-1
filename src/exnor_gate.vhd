-- Project		: COEN6501
-- File Name	: exnor_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform EX-NOR operation
-- on two binary inputs.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity xnor_gate is
	port( A, B : in std_logic;
		  C : out std_logic);
end xnor_gate;

-- Architecture Implementation:
architecture xnorg of xnor_gate is
begin
	C <= A xnor B;
end;

-- end of exnor_gate.vhd