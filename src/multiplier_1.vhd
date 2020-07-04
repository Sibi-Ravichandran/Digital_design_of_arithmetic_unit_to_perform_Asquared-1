-- Project		: COEN6501
-- File Name	: multiplier_1.vhd 
-- Author		: Sibi Ravichandran
-- Date			: 01- November- 2018
-- Description	: 
--					The function of this component is to perform multiplication on 
-- two 8-bit unsigned (positive) binary numbers. This component employs half adders 
-- and full adders to perform the addition of Partial Products.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity multiplier_1 is
	port( A  	: in std_logic_vector (7 downto 0);
		  Z		: out std_logic_vector (15 downto 0));
end multiplier_1;

-- Architecture Implementation:
architecture mult of multiplier_1 is

-- Component Declaration of partial product:
Component partial_product 
	port( A  	: in std_logic_vector (7 downto 0);
		  P		: out std_logic_vector (64 downto 1));
end Component;

-- Component Declaration of half adder:
Component half_adder
	port( A, B : in std_logic;
		  sum, carry : out std_logic);
end Component;

-- Component Declaration of full_adder:
Component full_adder
	port( A, B, carry_in : in std_logic;
		  sum, carry_out : out std_logic);
end Component; 

-- Signal declarations:
signal P: std_logic_vector (64 downto 1);
signal S: std_logic_vector (14 downto 0);
signal C: std_logic_vector (27 downto 0);

begin

-- Finding the partial products of the 8 bit number: 
PP: partial_product port map (A (7 downto 0), P (64 downto 1));

-- Performing addition on partial products using half adders and full adders:

-- Z0:
Z(0) <= P(1);

-- Z1: 
Z(1) <= '0';

-- Z2:
HA1: half_adder port map (P(2), P(10), Z(2), C(0));

-- Z3: 
HA2: half_adder port map (P(17), C(0), Z(3), C(1));

-- Z4: 
FA1: full_adder port map (P(18), P(25), C(1), S(0),C(2));
HA3: half_adder port map (S(0), P(19), Z(4), C(3));

-- Z5: 
FA2: full_adder port map (P(33), P(26), C(2), S(1),C(4));
HA4: half_adder port map (S(1), C(3), Z(5), C(5));

-- Z6:
FA3: full_adder port map (P(13), P(6), C(4), S(2),C(6));
FA4: full_adder port map (S(2), P(27), C(5), S(3),C(7));
HA5: half_adder port map (S(3), P(28), Z(6), C(8));

-- Z7:
FA5: full_adder port map (P(7), P(42), C(6), S(4),C(9));
FA6: full_adder port map (S(4), P(35), C(7), S(5),C(10));
HA6: half_adder port map (S(5), C(8), Z(7), C(11));

-- Z8:
FA7: full_adder port map (P(8), P(15), C(9), S(6),C(12));
FA8: full_adder port map (S(6), P(22), C(10), S(7),C(13));
FA9: full_adder port map (S(7), P(36), C(11), S(8),C(14));
HA7: half_adder port map (S(8), P(37), Z(8), C(15));

-- Z9:
FA10: full_adder port map (P(58), P(51), C(12), S(9),C(16));
FA11: full_adder port map (S(9), P(30), C(13), S(10),C(17));
FA12: full_adder port map (S(10), C(14), C(15), Z(9),C(18));

-- Z10:
FA13: full_adder port map (P(24), P(52), C(16), S(11),C(19));
FA14: full_adder port map (S(11), P(38), C(17), S(12),C(20));
FA15: full_adder port map (S(12), P(46), C(18), Z(10),C(21));
  
--Z11
FA16: full_adder port map (P(32), P(53), C(19), S(13),C(22));
FA17: full_adder port map (S(13), C(20), C(21), Z(11),C(23));

--Z12
FA18: full_adder port map (P(40), P(47), C(22), S(14),C(24));
FA19: full_adder port map (P(55), S(14), C(23), Z(12),C(25));

--Z13
FA20: full_adder port map (P(48), C(24), C(25), Z(13),C(26));

--Z14
FA21: full_adder port map (P(64), P(63), C(26), Z(14),C(27));

--Z15
Z(15) <= C(27);


end;

-- end of multiplier_1.vhd