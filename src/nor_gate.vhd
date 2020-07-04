-- Project		: COEN6501
-- File Name	: nor_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform NOR operation
-- on two binary inputs.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity nor_gate is
	port( A, B : in std_logic;
		  C : out std_logic);
end nor_gate;

-- Architecture Implementation:
architecture norg of nor_gate is
begin
	C <= A nor B;
end;

-- end of nor_gate.vhd