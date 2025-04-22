library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity temp_control is
  port
  (
    clk_1hz      : in std_logic;
    On_OFF       : in std_logic;
    run          : in std_logic;
    fast_cool    : in std_logic;
    open_oven    : in std_logic;
    temp_up      : in std_logic;
    temp_down    : in std_logic;
    TEMP         : in integer range 0 to 250;
    current_temp : out integer range 0 to 250;
    FooD_In      : out std_logic
  );
end entity;

architecture behavioral of temp_control is
  signal s_temp   : integer                      := 20;
  signal s_FoodIn : std_logic                    := '0';
  signal state    : std_logic_vector(2 downto 0) := "000";
begin
  process (clk_1hz)
  begin
    if rising_edge(clk_1hz) then
      if On_OFF = '1' then
        case state is
          when "000" =>
            s_temp   <= 20;
            s_FoodIn <= '0';
            state    <= "001";

          when "001" =>
            if s_temp = TEMP then
              state <= "010";
            else
              s_temp <= s_temp + 10; -- Aumenta temperatura
            end if;

          when "010" =>
            if run = '1' then
              if s_temp < TEMP then
                s_temp <= s_temp + 10;
              else
                s_FoodIn <= '1';
              end if;
              if s_FoodIn = '1' then
                if open_oven = '1' then
                  s_temp <= s_temp - 20;
                elsif s_temp < TEMP then
                  s_temp <= s_temp + 10;
                end if;
              end if;
            end if;

          when "011" =>
            if run = '1' then
              s_temp <= s_temp;
            end if;

          when "100" =>
            if fast_cool = '1' then
              if s_temp > 20 then
                if s_temp < 40 then
                  s_temp <= 20;
                else
                  s_temp <= s_temp - 20; -- Resfriamento rápido
                end if;
              end if;
            end if;

          when others =>
            state <= "000";
        end case;
      else
        -- Quando On_OFF = '0', reset para o estado inicial
        state    <= "000";
        s_temp   <= 20;
        s_FoodIn <= '0';
      end if;
    end if;
  end process;

  current_temp <= s_temp;
  FooD_In      <= s_FoodIn;
end architecture;