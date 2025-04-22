library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity temp_control is
    port (
        clk          : in std_logic;
        On_OFF       : in std_logic;
        run          : in std_logic;
        fast_cool    : in std_logic;
        open_oven    : in std_logic;
        temp_up      : in std_logic;    
        temp_down    : in std_logic;
        prog         : in std_logic_vector(2 downto 0);
        state        : in std_logic_vector(2 downto 0);
        TEMP         : in integer range 20 to 250;
        current_temp : out integer range 20 to 250;
        FooD_In      : out std_logic  
    );
end entity;

architecture behavioral of temp_control is
    signal s_temp : integer := 20;
    signal s_TargetTemp : integer := 20;
	 signal s_user			: integer := 20;
    signal s_FoodIn : std_logic := '0';
    signal s_counter : unsigned(31 downto 0) := (others => '0');
    constant DIVIDER_VALUE : unsigned(31 downto 0) := to_unsigned(25000000, 32); 
    signal clk_1hz : std_logic := '0';
begin

    -- Frequency divider to generate 1 Hz clock
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
	 
	 
	 
	 process(clk_1hz, temp_up, temp_down)
		begin
		if rising_edge(clk_1hz) then
			if state = "000" and prog = "010" then
				if temp_up = '1' then
				  if s_user < 250 then
						s_user <= s_user + 10;
				  end if; 
				elsif temp_down = '1' then
				  if s_user > 20 then
						s_user <= s_user - 10; -- Decrease temperature
				  end if;
				end if;
			end if;
		end if;
	end process;

	process(clk)
    begin
        if rising_edge(clk) then
            if On_OFF = '0' then
                s_TargetTemp <= 20; 
            else
                if state = "000" then
                    case prog is
                        when "000" => -- Default
                            s_TargetTemp <= 200;
                        when "001" => -- Default
                            s_TargetTemp <= 200;
                        when "010" => -- User
                            s_TargetTemp <= s_user;
                        when "011" => -- Rissol
                            s_TargetTemp <= 180;
                        when "100" => -- Batata
                            s_TargetTemp <= 200;
                        when "101" => -- Filete
                            s_TargetTemp <= 170;
                        when "111" => -- Hamburger
                            s_TargetTemp <= 170;
                        when others =>
                            s_TargetTemp <= s_TargetTemp;
                    end case;
                end if;
            end if;
        end if;
    end process;

    process(clk_1hz, On_OFF, run, TEMP, open_oven, fast_cool, state)
    begin
        if On_OFF = '0' then
				s_temp <= 20;
            s_FoodIn <= '0'; 
        elsif rising_edge(clk_1hz) then
				if state = "000" then
					current_temp <= s_targetTemp;
				elsif state = "001" then
                if run = '1' then
                    if s_FoodIn = '0' then
                        if s_temp < s_TargetTemp then
                            s_temp <= s_temp + 10;
                        else
                            s_FoodIn <= '1'; 
                        end if;
                    elsif s_FoodIn = '1' then
                        if open_oven = '1' then  
                            s_temp <= s_temp - 20;
                        end if;
                    end if;
                end if;
                current_temp <= s_temp; 
				elsif state = "010" then
                if run = '1' then
                    if s_temp < s_TargetTemp then
                        s_temp <= s_temp + 10; 
                    elsif open_oven = '1' then  
                        s_temp <= s_temp - 20;
                    end if;
                end if;
                current_temp <= s_temp;
            elsif state = "100" then
                if fast_cool = '1' then
                    if s_temp > 20 then
                        if s_temp < 40 then
                            s_temp <= 20;
                        else
                            s_temp <= s_temp - 20; -- Fast cooling
                        end if;
                    end if;
                elsif s_temp > 20 then
                    s_temp <= s_temp - 10;
					 else 
						s_temp <= 20;
                end if;
                current_temp <= s_temp;
            end if;    
        end if;
    end process;

    FooD_In <= s_FoodIn;
end architecture;
