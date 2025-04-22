library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity time_control is
  port
  (
    clk          : in std_logic;
    clk1hz       : in std_logic;
    state        : in std_logic_vector(2 downto 0);
    prog         : in std_logic_vector(2 downto 0);
    time_up      : in std_logic;
    time_down    : in std_logic;
    preheat_time : in integer range 0 to 60;
    cook_time    : in integer range 0 to 60;
    half_time    : out std_logic_vector(3 downto 0);
    current_time : out integer range 0 to 60;
    finished     : out std_logic
  );
end entity;

architecture behavioral of time_control is
  signal s_HalfTime      : integer range 0 to 60        := 0; -- Halftime timesaver
  signal s_TRUE_HalfTime : std_logic_vector(3 downto 0) := "0000"; -- Halftime
  signal TIMER           : integer range 0 to 60        := 0; -- Tempo desejado
  signal s_finished      : std_logic                    := '0';
  signal TIMER_next      : integer range 0 to 60        := 0; -- Próximo valor de TIMER
  signal s_finished_next : std_logic                    := '0'; -- Próximo valor de finished
begin
  -- Process to set the initial values based on the state
  process (clk)
  begin
    if rising_edge(clk) then
      if state = "001" then
        TIMER      <= preheat_time;
        s_HalfTime <= preheat_time / 2;
        s_finished <= '0';
      elsif state = "010" then
        TIMER      <= cook_time;
        s_HalfTime <= cook_time / 2;
        s_finished <= '0';
      end if;

      if state = "000" then
        if prog = "001" then
          if time_up = '1' and TIMER < 60 then
            TIMER_next <= TIMER + 1; -- Aumenta tempo
          elsif time_down = '1' and TIMER > 0 then
            TIMER_next <= TIMER - 1; -- Diminui tempo
          else
            TIMER_next <= TIMER; -- Mantém o valor atual
          end if;
        else
          TIMER_next <= TIMER; -- Mantém o valor atual
        end if;
        s_finished_next <= '0';
      elsif state = "001" then
        if TIMER > 0 then
          TIMER_next      <= TIMER - 1;
          s_finished_next <= '0';
        else
          TIMER_next      <= 0;
          s_finished_next <= '1';
        end if;
      elsif state = "010" then
        if TIMER > 0 then
          TIMER_next <= TIMER - 1;
          if TIMER = s_HalfTime then
            s_TRUE_HalfTime <= "1111";
          end if;
          s_finished_next <= '0';
        else
          TIMER_next      <= 0;
          s_finished_next <= '1';
          s_TRUE_HalfTime <= "0000";
        end if;
      else
        TIMER_next <= TIMER; -- Mantém o valor atual
      end if;

      TIMER      <= TIMER_next;
      s_finished <= s_finished_next;
    end if;
  end process;

  -- Assign outputs
  current_time <= TIMER;
  half_time    <= s_TRUE_HalfTime;
  finished     <= s_finished;
end architecture;