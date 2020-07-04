-- Project		: COEN6501
-- File Name	: ripple_carry_8bit.vhd 
-- Author		: Amulya Prabhakar 
-- Date			: 30- October- 2018
-- Description	: 
--					The function of this component is to perform parallel addition on
-- two 8-bit binary inputs. This component employs two 4-bit Ripple Carry Adders to perform 
-- the operation.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity ripple_carry_8bit is
	port( A, B  	: in std_logic_vector (7 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (7 downto 0);
		  carry_out : out std_logic);
end ripple_carry_8bit;

-- Architecture Implementation:
architecture rca8 of ripple_carry_8bit is

-- Component Declaration of 4-bit RCA:
component ripple_carry_4bit
	port( A, B  	: in std_logic_vector (3 downto 0);
		  carry_in	: in std_logic;
		  sum 		: out std_logic_vector (3 downto 0);
		  carry_out : out std_logic);
end component;

-- Signal declaration of internal variables:
signal C: std_logic_vector (2 downto 0);

begin

-- Assign the value of Carry in to C(0):
C(0) <= carry_in;

RCA1: ripple_carry_4bit port map (A (3 downto 0), B(3 downto 0), C(0), sum (3 downto 0), C(1));
RCA2: ripple_carry_4bit port map (A (7 downto 4), B(7 downto 4), C(1), sum (7 downto 4), C(2));

-- Assign the value of C(2) to Carry out:
carry_out <= C(2);

end;

-- end of ripple_carry_8bit.vhd