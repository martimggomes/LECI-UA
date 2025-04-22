library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Adder4 is
	port(a, b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		s : out std_logic_vector(3 downto 0);
		cout : out std_logic);
end Adder4;
architecture Structural of Adder4 is
	signal s_carry_out : std_logic_vector(3 downto 0);
begin
	
FA_0 : entity work.FullAdder(behavioral)
	port map (a => a(0),
				b => b(0),
				cin => cin,
				s => s(0),
				cout => s_carry_out(0));
				
FA_1 : entity work.FullAdder(behavioral)
	port map (a => a(1),
				b => b(1),
				cin => cin,
				s => s_carry_out(0),
				cout => s_carry_out(1));
				
FA_2 : entity work.FullAdder(behavioral)
	port map (a => a(2),
				b => b(2),
				cin => cin,
				s => s_carry_out(1),
				cout => s_carry_out(2));
	
FA_3 : entity work.FullAdder(behavioral)
	port map (a => a(3),
				b => b(3),
				cin => cin,
				s => s_carry_out(2),
				cout => s_carry_out(3));
end Structural;
		