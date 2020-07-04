-- Project		: COEN6501
-- File Name	: exor_gate.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 29- October- 2018
-- Description	: 
--					The function of this component is to perform EX-OR operation
-- on two binary inputs.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity exor_gate is
	port( A, B : in std_logic;
		  C : out std_logic);
end exor_gate;

-- Architecture Implementation:
architecture exorg of exor_gate is
begin
	C <= A xor B;
end;

-- end of exor_gate.vhd