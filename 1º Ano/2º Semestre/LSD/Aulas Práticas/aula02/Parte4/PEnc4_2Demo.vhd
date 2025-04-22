library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PEnc4_2Demo is
	port(SW : in std_logic_vector(3 downto 0);
			Key : out std_logic_vector(0 downto 0);
			Ledr : out std_logic_vector(1 downto 0));
end PEnc4_2Demo;
architecture shell of PEnc4_2Demo is
begin 

PEnc4_2_0: entity work.PEnc4_2(BehavAssign)
port map( I => SW(3 downto 0),
			 validOut => not Key(0),
			 O => Ledr);
			 end shell;
			 