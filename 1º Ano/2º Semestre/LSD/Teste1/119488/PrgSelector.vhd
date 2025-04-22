library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PrgSelector is
    port (SW  : in  std_logic_vector(1 downto 0);
          LEDR: out std_logic_vector(3 downto 0);
          LEDG : out std_logic_vector(3 downto 0)
    );
end PrgSelector;

architecture Shell of PrgSelector is
   signal ProgramActive : std_logic_vector(3 downto 0); 
begin 
  ProgramActive(0) <= '1' when SW = "00" else '0';


   prog1: entity work.Programa1(Shell)
         port map (
            Enable => ProgramActive(0),
            sinal_vermelho => LEDR,
            sinal_verde => LEDG);