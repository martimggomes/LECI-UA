library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Register4Bits is

		port(reset : in std_logic;
		clk : in std_logic;
		enable : in std_logic;
		dataIn : in std_logic_vector(3 downto 0);
		dataOut : out std_logic_vector(3 downto 0));
		
end Register4Bits;

architecture Behavioral of Register4Bits is
begin
	process(clk)
	begin
	if (rising_edge(clk)) and enable = '1' then
		if (reset = '1') then
			dataOut <= (others => '0');
		elsif (enable = '1') then
			dataOut <= dataIn;
		end if;
	end if;
	end process;
end Behavioral;