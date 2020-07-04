-- Project		: COEN6501
-- File Name	: reg_16_bit.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 31- October- 2018
-- Description	: 
--					The function of this component is to laod the 16-Bit input into 
-- register when the Clock is high and the load signal is high. It will reset the register 
-- when the value of clear signal is high.

-- Declare library files:
library IEEE;
use ieee.std_logic_1164.all;

-- Entity Declaration: 
entity reg_16_bit is
	port( data_in : in std_logic_vector (15 downto 0);
		  clock, load, clear: in std_logic; 
		  data_out : out std_logic_vector (15 downto 0));
end reg_16_bit;

-- Architecture implementation: 
architecture reg of reg_16_bit is

begin
  process (clock) 
  begin
    -- check for positive edge of clock
    if clock'event and clock = '1' then 
      -- if the clear signal is high then reset the register:
      if clear = '1' then
        data_out <="0000000000000000";
      -- if the load signal is high then load the value of input to registers:
      elsif load ='1' then 
        data_out <=data_in;
      end if;
    end if;
  end process;
end;
 
-- end of reg_16_bit.vhd