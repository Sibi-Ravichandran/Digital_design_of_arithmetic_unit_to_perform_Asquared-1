-- Project		: COEN6501
-- File Name	: nand_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform NAND operation
-- on two binary inputs.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity nand_gate is
	port( A, B : in std_logic;
		  C : out std_logic);
end nand_gate;

-- Architecture Implementation:
architecture nandg of nand_gate is
begin
	C <= A nand B;
end;

-- end of nand_gate.vhd