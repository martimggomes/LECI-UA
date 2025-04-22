library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity User_prog is
    port (
        clk          : in std_logic;
        state        : in std_logic_vector(2 downto 0);
        prog         : in std_logic_vector(2 downto 0);
        selector     : in std_logic;
        time_up      : in std_logic;
        time_down    : in std_logic;
        user_preheat : out integer range 0 to 60;
        user_cook    : out integer range 0 to 60
    );
end User_prog;

architecture behavioral of User_prog is
    signal preheat_out  : integer range 0 to 60 := 0;
    signal cook_out     : integer range 0 to 60 := 0; 
	 signal s_prog_pre   : integer range 0 to 60 := 0; 
	 signal s_prog_cook  : integer range 0 to 60 := 0; 
	 signal s_counter : unsigned(31 downto 0) := (others => '0');
    constant DIVIDER_VALUE : unsigned(31 downto 0) := to_unsigned(25000000, 32); 
    signal clk_1hz : std_logic := '0';
begin
	 process(clk)
    begin
        if rising_edge(clk) then
            if s_counter = DIVIDER_VALUE - 1 then
                clk_1hz <= not clk_1hz;
                s_counter <= (others => '0');
            else
                s_counter <= s_counter + 1;
            end if;
        end if;
    end process;
	 
	 process(clk_1hz, selector, time_up, time_down)
	 begin
		if rising_edge(clk_1hz) then
			if selector = '0' then
				 if time_up = '1' then
					  s_prog_pre <= s_prog_pre + 1; -- Increase time
				 elsif time_down = '1' then
					  s_prog_pre <= s_prog_pre - 1; -- Decrease time
				 else
					  s_prog_pre <= s_prog_pre;
				 end if;
			elsif selector = '1' then
				 if time_up = '1' then
					  s_prog_cook <= s_prog_cook + 1; -- Increase time
				 elsif time_down = '1' then
					  s_prog_cook <= s_prog_cook - 1; -- Decrease time
				 end if;
			end if;
		end if;
	 end process;
	 
	 
    process(clk, state, prog, selector, time_up, time_down)
    begin
        if rising_edge(clk) then
            if state = "100" then
                preheat_out <= 0;
                cook_out <= 0;
            elsif state = "000" then
                case prog is
                    when "000" => -- Default
                        preheat_out <= 0;
                        cook_out <= 18;
						  when "001" => --Default
								preheat_out <= 0;
								cook_out <= 18;
                    when "010" => -- User
                        preheat_out <= s_prog_pre;
								cook_out <= s_prog_cook;
						  when "011" => -- Rissol
                        preheat_out <= 3;
                        cook_out <= 15;
                    when "100" => -- Batata
                        preheat_out <= 5;
                        cook_out <= 20;
                    when "101" => -- Filete
                        preheat_out <= 3;
                        cook_out <= 20;
                    when "111" => -- Hamburger
                        preheat_out <= 5;
                        cook_out <= 20;
                    when others => -- Default fallback
                        preheat_out <= 0;
                        cook_out <= 0;
                end case;
				end if;
            user_preheat <= preheat_out;
            user_cook <= cook_out;
        end if;
    end process;
end behavioral;
