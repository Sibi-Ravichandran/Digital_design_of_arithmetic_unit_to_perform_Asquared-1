-- Project		: COEN6501
-- File Name	: multiplier_2.vhd 
-- Author		: Sibi Ravichandran
-- Date			: 01- November- 2018
-- Description	: 
--					The function of this component is to perform multiplication on 
-- two 8-bit unsigned (positive) binary numbers. This component employs the 8-bit 
-- Ripple Carry Adders to perform the addition of Partial Products.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity multiplier_2 is
	port( A  	: in std_logic_vector (7 downto 0);
		  Z		: out std_logic_vector (15 downto 0));
end multiplier_2;

-- Architecture Implementation:
architecture mult of multiplier_2 is

-- Component Declaration of partial_product:
Component partial_product 
	port( A  	: in std_logic_vector (7 downto 0);
		  P		: out std_logic_vector (64 downto 1));
end Component;

-- Component Declaration of ripple_carry_8bit adder:
Component ripple_carry_8bit 
	port( A, B 	: in std_logic_vector (7 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (7 downto 0);
		  carry_out : out std_logic);
end Component;

-- Signal declarations:
-- Carry in and carry out of RCA-8 bit:
signal C: std_logic_vector (9 downto 0);

-- inputs to RCA:
signal input_1: std_logic_vector (7 downto 0);
signal input_2: std_logic_vector (7 downto 0);
signal input_3: std_logic_vector (7 downto 0);
signal input_4: std_logic_vector (7 downto 0);
signal input_5: std_logic_vector (7 downto 0);
signal input_6: std_logic_vector (7 downto 0);
signal input_7: std_logic_vector (7 downto 0);
signal input_8: std_logic_vector (7 downto 0);
signal input_9: std_logic_vector (7 downto 0);
signal input_10: std_logic_vector (7 downto 0);

-- Outputs of RCA: 
signal sum: std_logic_vector (39 downto 0);

-- Outputs of Partial Product component:
signal P: std_logic_vector (64 downto 1);

begin

-- Finding the partial products of the 8 bit number: 
PP: partial_product port map (A (7 downto 0), P (64 downto 1));

-- Performing addition on partial products using 8-bit Ripple carry adders:

-- Setting the value of inputs to the Ripple Carry Adder (8-bit) -1:
input_1(0) <= '0';
input_1(1) <= '0';
input_1(2) <= P(10);
input_1(3) <= '0';
input_1(4) <= P(25);
input_1(5) <= P(26);
input_1(6) <= P(6);
input_1(7) <= P(42);

input_2(0) <= P(1);
input_2(1) <= '0';
input_2(2) <= P(2);
input_2(3) <= P(17);
input_2(4) <= P(18);
input_2(5) <= P(33);
input_2(6) <= P(13);
input_2(7) <= P(7);

C(0) <='0';

RCA1: ripple_carry_8bit port map (input_1 (7 downto 0), input_2 (7 downto 0), C(0), sum (7 downto 0), C(1));

-- Setting the value of inputs to the Ripple Carry Adder (8-bit) -2:
input_3(0) <= P(19);
input_3(1) <= '0';
input_3(2) <= P(27);
input_3(3) <= P(35);
input_3(4) <= C(1);
input_3(5) <= P(58);
input_3(6) <= P(24);
input_3(7) <= P(32);

input_4(0) <= sum(4);
input_4(1) <= sum(5);
input_4(2) <= sum(6);
input_4(3) <= sum(7);
input_4(4) <= P(8);
input_4(5) <= P(51);
input_4(6) <= P(52);
input_4(7) <= P(53);

C(2) <='0';

RCA2: ripple_carry_8bit port map (input_3 (7 downto 0), input_4 (7 downto 0), C(2), sum (15 downto 8), C(3));

-- Setting the value of inputs to the Ripple Carry Adder (8-bit) -3:
input_5(0) <= sum(10);
input_5(1) <= sum(11);
input_5(2) <= sum(12);
input_5(3) <= sum(13);
input_5(4) <= sum(14);
input_5(5) <= sum(15);
input_5(6) <= C(3);
input_5(7) <= P(48);

input_6(0) <= P(28);
input_6(1) <= '0';
input_6(2) <= P(15);
input_6(3) <= P(30);
input_6(4) <= P(38);
input_6(5) <= '0';
input_6(6) <= P(40);
input_6(7) <= '0';

C(4) <='0';

RCA3: ripple_carry_8bit port map (input_5 (7 downto 0), input_6 (7 downto 0), C(4), sum (23 downto 16), C(5));

-- Setting the value of inputs to the Ripple Carry Adder (8-bit) -4:
input_7(0) <= P(36);
input_7(1) <= '0';
input_7(2) <= P(46);
input_7(3) <= '0';
input_7(4) <= P(47);
input_7(5) <= '0';
input_7(6) <= P(63);
input_7(7) <= '0';
              
input_8(0) <= sum(18);
input_8(1) <= sum(19);
input_8(2) <= sum(20);
input_8(3) <= sum(21);
input_8(4) <= sum(22);
input_8(5) <= sum(23);
input_8(6) <= C(5);
input_8(7) <= '0';

C(6) <=P(37);

RCA4: ripple_carry_8bit port map (input_7 (7 downto 0), input_8 (7 downto 0), C(6), sum (31 downto 24), C(7));

-- Setting the value of inputs to the Ripple Carry Adder (8-bit) -5:
input_9(0) <=  P(22);
input_9(1) <=  '0';
input_9(2) <=  '0';
input_9(3) <=  '0';
input_9(4) <=  P(55);
input_9(5) <=  '0';
input_9(6) <=  P(64);
input_9(7) <=  C(7);

input_10(0) <= sum(24);
input_10(1) <= sum(25);
input_10(2) <= sum(26);
input_10(3) <= sum(27);
input_10(4) <= sum(28);
input_10(5) <= sum(29);
input_10(6) <= sum(30);
input_10(7) <= sum(31);

C(8) <='0';

RCA5: ripple_carry_8bit port map (input_9 (7 downto 0), input_10 (7 downto 0), C(8), sum (39 downto 32), C(9));

-- Assign the outputs with the value of sum of RCA:

Z(0)<= sum(0);
Z(1)<= sum(1);
Z(2)<= sum(2);
Z(3)<= sum(3);
Z(4)<= sum(8);
Z(5)<= sum(9);
Z(6)<= sum(16);
Z(7)<= sum(17);
Z(8)<= sum(32);
Z(9)<= sum(33);
Z(10)<=sum(34);
Z(11)<=sum(35);
Z(12)<=sum(36);
Z(13)<=sum(37);
Z(14)<=sum(38);
Z(15)<=sum(39);

end;

-- end of multiplier_2.vhd