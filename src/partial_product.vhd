-- Project		: COEN6501
-- File Name	: partial_product.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 30- October- 2018
-- Description	: 
--					The function of this component is to determine the value of 
-- 64 Partial Products by performing AND Operation with the values of 8-bit input.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity partial_product is
	port( A  	: in std_logic_vector (7 downto 0);
		  P		: out std_logic_vector (64 downto 1));
end partial_product;

-- Architecture Implementation:
architecture pp of partial_product is

-- Component Declaration of and_gate:
Component and_gate
	port( A, B : in std_logic;
		  C : out std_logic);
end Component;

begin

P1 : and_gate port map (A(0), A(0), P(1));
P2 : and_gate port map (A(0), A(1), P(2));
P3 : and_gate port map (A(0), A(2), P(3));
P4 : and_gate port map (A(0), A(3), P(4));
P5 : and_gate port map (A(0), A(4), P(5));
P6 : and_gate port map (A(0), A(5), P(6));
P7 : and_gate port map (A(0), A(6), P(7));
P8 : and_gate port map (A(0), A(7), P(8));
P9 : and_gate port map (A(1), A(0), P(9));
P10: and_gate port map (A(1), A(1), P(10));
P11: and_gate port map (A(1), A(2), P(11));
P12: and_gate port map (A(1), A(3), P(12));
P13: and_gate port map (A(1), A(4), P(13));
P14: and_gate port map (A(1), A(5), P(14));
P15: and_gate port map (A(1), A(6), P(15));
P16: and_gate port map (A(1), A(7), P(16));
P17: and_gate port map (A(2), A(0), P(17));
P18: and_gate port map (A(2), A(1), P(18));
P19: and_gate port map (A(2), A(2), P(19));
P20: and_gate port map (A(2), A(3), P(20));
P21: and_gate port map (A(2), A(4), P(21));
P22: and_gate port map (A(2), A(5), P(22));
P23: and_gate port map (A(2), A(6), P(23));
P24: and_gate port map (A(2), A(7), P(24));
P25: and_gate port map (A(3), A(0), P(25));
P26: and_gate port map (A(3), A(1), P(26));
P27: and_gate port map (A(3), A(2), P(27));
P28: and_gate port map (A(3), A(3), P(28));
P29: and_gate port map (A(3), A(4), P(29));
P30: and_gate port map (A(3), A(5), P(30));
P31: and_gate port map (A(3), A(6), P(31));
P32: and_gate port map (A(3), A(7), P(32));
P33: and_gate port map (A(4), A(0), P(33));
P34: and_gate port map (A(4), A(1), P(34));
P35: and_gate port map (A(4), A(2), P(35));
P36: and_gate port map (A(4), A(3), P(36));
P37: and_gate port map (A(4), A(4), P(37));
P38: and_gate port map (A(4), A(5), P(38));
P39: and_gate port map (A(4), A(6), P(39));
P40: and_gate port map (A(4), A(7), P(40));
P41: and_gate port map (A(5), A(0), P(41));
P42: and_gate port map (A(5), A(1), P(42));
P43: and_gate port map (A(5), A(2), P(43));
P44: and_gate port map (A(5), A(3), P(44));
P45: and_gate port map (A(5), A(4), P(45));
P46: and_gate port map (A(5), A(5), P(46));
P47: and_gate port map (A(5), A(6), P(47));
P48: and_gate port map (A(5), A(7), P(48));
P49: and_gate port map (A(6), A(0), P(49));
P50: and_gate port map (A(6), A(1), P(50));
P51: and_gate port map (A(6), A(2), P(51));
P52: and_gate port map (A(6), A(3), P(52));
P53: and_gate port map (A(6), A(4), P(53));
P54: and_gate port map (A(6), A(5), P(54));
P55: and_gate port map (A(6), A(6), P(55));
P56: and_gate port map (A(6), A(7), P(56));
P57: and_gate port map (A(7), A(0), P(57));
P58: and_gate port map (A(7), A(1), P(58));
P59: and_gate port map (A(7), A(2), P(59));
P60: and_gate port map (A(7), A(3), P(60));
P61: and_gate port map (A(7), A(4), P(61));
P62: and_gate port map (A(7), A(5), P(62));
P63: and_gate port map (A(7), A(6), P(63));
P64: and_gate port map (A(7), A(7), P(64));

end;

-- end of partial_product.vhd