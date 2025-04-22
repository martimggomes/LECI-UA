library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity AND2gate is
	port ( inPort0: in std_logic;
			 inPort1: in std_logic;
			 outPort : out std_logic);
end AND2gate;

architecture Behavioral of AND2gate is

begin

	outport <= inPort0 and inPort1;
end Behavioral;
