-- Project		: COEN6501
-- File Name	: main.vhd 
-- Author		: Sibi Ravichandran
-- Date			: 01- November- 2018
-- Description	: 
--					The function of this component is to perform the operation 
-- (A*A)-1 where A is an 8-bit input and to store the value of output in Z. After 
-- performing the operation the value of end_flag will be set to high.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

-- Entity Declaration: 
entity main is
	port( A  	: in std_logic_vector (7 downto 0);
	     clock: in std_logic;
       load: in std_logic;
       clear: in std_logic;
       Z		: out std_logic_vector (15 downto 0);
		   end_flag : out std_logic);
end main;

-- Architecture Implementation:
architecture rtl of main is

-- Component Declaration of signed to unsigned converter:
Component sign_2_unsign 
	port( input  	: in std_logic_vector (7 downto 0);
		  A 		: out std_logic_vector (7 downto 0));
end Component;

-- Component Declaration of 8-bit register:
Component reg_8_bit 
	port( data_in : in std_logic_vector (7 downto 0);
		  clock, load, clear: in std_logic; 
		  data_out : out std_logic_vector (7 downto 0));
end Component;

-- Component Declaration of multiplier:
Component multiplier_1
	port( A  	: in std_logic_vector (7 downto 0);
		  Z		: out std_logic_vector (15 downto 0));
end Component;

-- Component Declaration of minus_one:
Component minus_one
	port( A  	: in std_logic_vector (15 downto 0);
		  Z		: out std_logic_vector (15 downto 0));
end Component;

-- Component Declaration of 16-bit register:
Component reg_16_bit
	port( data_in : in std_logic_vector (15 downto 0);
		  clock, load, clear: in std_logic; 
		  data_out : out std_logic_vector (15 downto 0));
end Component;

-- Signal Declarations:
-- Unsigned 8-bit number: 
signal A1 : std_logic_vector (7 downto 0);

-- Signals for 8-bit Register:
signal A2 : std_logic_vector (7 downto 0);

-- Signals for multiplier: 
signal Z1 : std_logic_vector(15 downto 0);

-- Signals for minus operation: 
signal Z2 : std_logic_vector(15 downto 0);

begin

-- Convert the signed input number to unsigned 8-bit number:
S2U: sign_2_unsign port map (A (7 downto 0), A1 (7 downto 0));

-- Store the unsigned 8-bit number into a 8-bit register:
Reg8: reg_8_bit port map ( A1(7 downto 0), clock, load, clear, A2(7 downto 0));

-- Perform the square operation Z1 = A*A: 
Mul1: multiplier_1 port map (A2(7 downto 0), Z1(15 downto 0));

-- Perform the minus one operation Z2= Z1-1: 
Minus: minus_one port map (Z1(15 downto 0), Z2(15 downto 0));

-- Store the result in 16-bit register: 
REG16: reg_16_bit port map (Z2(15 downto 0), clock, load, clear, Z(15 downto 0));

end_flag <= '0' when (load = '0' or  clear='1') else '1';

end;

-- end of main.vhd