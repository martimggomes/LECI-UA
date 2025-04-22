library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity BinToBCD is

  port (bin_input                : in  std_logic_vector(3 downto 0);
        bcd_output1, bcd_output2 : out std_logic_vector(3 downto 0));
		  
end entity BinToBCD;

architecture Behavioral of BinToBCD is

	signal s_int, s_rem, s_dez : unsigned (3 downto 0);
  
begin
  
  s_dez   <= to_unsigned(10,4);
  s_int   <= unsigned(bin_input)/s_dez;
  s_rem   <= unsigned(bin_input) rem s_dez;
  
  bcd_output1 <= std_logic_vector (s_rem);
  bcd_output2 <= std_logic_vector (s_int);
  
  
end architecture Behavioral;