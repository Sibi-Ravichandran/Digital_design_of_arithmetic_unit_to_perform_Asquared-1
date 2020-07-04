-- Project		: COEN6501
-- File Name	: reg_8_bit.vhd 
-- Author		: Sibi Ravichandran 
-- Date			: 31- October- 2018
-- Description	: 
--					The function of this component is to laod the 8-Bit input into 
-- register when the Clock is high and the load signal is high. It will reset the register 
-- when the value of clear signal is high.

-- Declare library files:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration:
entity reg_8_bit is
Port ( data_in : in STD_LOGIC_VECTOR (7 downto 0);
       clock,clear,load : in STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR (7 downto 0));
end reg_8_bit;

-- Architecture implementation: 
architecture Behavioral of reg_8_bit is
begin
  process (clock) 
  begin
    -- check for positive edge of clock
    if clock'event and clock = '1' then 
      -- if the clear signal is high then reset the register:
      if clear = '1' then
        data_out <="00000000";
      -- if the load signal is high then load the value of input to registers:
      elsif load ='1' then 
        data_out <=data_in;
      end if;
    end if;
  end process;
end;

-- end of reg_8_bit.vhd