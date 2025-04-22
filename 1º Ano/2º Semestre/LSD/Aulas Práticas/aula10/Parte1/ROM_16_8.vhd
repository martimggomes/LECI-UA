library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ROM_16_8 is
    port(address : in  std_logic_vector(3 downto 0);
	      dataOut : out std_logic_vector(7 downto 0));
end ROM_16_8;

architecture Behavioral of ROM_16_8 is

    subtype TDataWord is std_logic_vector(7 downto 0);
	 type TROM is array (0 to 15) of TDataWord;
	 constant c_memory: TROM := (x"00", x"11", x"22", x"33",
	                             x"44", x"55", x"66", x"77", 
										  x"88", x"99", x"AA", x"BB", 
										  x"CC", x"DD", x"EE", x"FF");
										  
begin
    dataOut <= c_memory(to_integer(unsigned(address)));
end Behavioral;