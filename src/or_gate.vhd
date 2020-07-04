-- Project		: COEN6501
-- File Name	: nor_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform OR operation
-- on two binary inputs.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity or_gate is
	port( A, B : in std_logic;
		  C : out std_logic);
end or_gate;

-- Architecture Implementation:
architecture org of or_gate is
begin
	C <= A or B;
end;

-- end of or_gate.vhd