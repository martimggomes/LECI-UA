library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity time_control is
    port (
        clk          : in std_logic;
		  ON_OFF			: in std_logic;
        OPEN_OVEN    : in std_logic;
		  selector		: in std_logic;
        state        : in std_logic_vector(2 downto 0);
		  prog			: in std_logic_vector(2 downto 0);
        preheat_time : in integer range 0 to 60;
        cook_time    : in integer range 0 to 60;
        half_time    : out std_logic_vector(3 downto 0);
        current_time : out integer range 0 to 60;
        finished     : out std_logic
    );
end time_control;

architecture behavioral of time_control is
    signal s_HalfTime        : integer range 0 to 60 := 0; 
    signal s_finished        : std_logic := '0';
    signal TIMER             : integer range 0 to 60 := 0;
	 signal FULLTIME			  : integer range 0 to 60 := 0;
	 signal S_CURRENT_TIME	  : integer range 0 to 60 := 0;
    signal s_counter         : unsigned(31 downto 0) := (others => '0');
    constant DIVIDER_VALUE   : unsigned(31 downto 0) := to_unsigned(50000000, 32); 
    signal clk_1hz           : std_logic := '0';
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

    process(clk)
    begin
        if rising_edge(clk) then
            case state is
                when "001" => -- PREHEAT
                    FULLTIME <= preheat_time;
						  current_time <= TIMER;
                when "010" => -- COOK
                    FULLTIME <= cook_time;
                    s_HalfTime <= cook_time / 2;
						  current_time <= TIMER;
                when "000" => -- IDLE
						if ON_OFF = '1' then
							if prog = "010" then
								if selector = '0' then 
									current_time <= preheat_time; 
								else
									current_time <= cook_time;
								end if;
							elsif prog /= "010" and preheat_time > 0 then
							  current_time <= preheat_time;
							else
								current_time <= cook_time;
							end if;
						else
							current_time <= 0;
						end if;
                when others =>
                    current_time <= 0;
            end case;
        end if;
    end process;

    
    process(clk_1hz, state)
    begin
        if rising_edge(clk_1hz) then
				TIMER <= FULLTIME;
				if state = "000" then
					s_finished <= '0';
            elsif state = "001" or state = "010" then
                if OPEN_OVEN = '0' then
                    if TIMER > 0 then
                        TIMER <= TIMER - 1;
                        s_finished <= '0';
                        if state = "010" and TIMER = s_HalfTime then
                            half_time <= "1111";
                        else
                            half_time <= "0000";
                        end if;
                    else
                        TIMER <= 0;
                        s_finished <= '1';
                    end if;
						end if;
             elsif state = "100" then
					  s_finished <= '0';
					  TIMER <= TIMER;
            end if;
            finished <= s_finished;
        end if;
    end process;

end architecture;
