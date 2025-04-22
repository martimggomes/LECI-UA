library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity state_machine is
  port
  (
    CLK_1HZ           : in std_logic;
    ON_OFF            : in std_logic;
    SW                : in std_logic_vector(7 downto 0);
    PREHEAT_IN        : in integer;
    COOK_IN           : in integer;
    TEMP_IN           : in integer;
    CURRENT_TEMP_COOK : in integer;
    FINISHED          : in std_logic;
    STATE             : out std_logic_vector(2 downto 0)
  );
end state_machine;

architecture Behavioral of state_machine is
  type state_type is (IDLE, PREHEAT, COOK, FINISH, COOL);
  signal s_state, next_state : state_type;
begin
  process (CLK_1HZ)
  begin
    if rising_edge(CLK_1HZ) then
      if ON_OFF = '0' then
        s_state <= COOL;
      elsif ON_OFF = '1' then
        s_state <= IDLE;
      else
        s_state <= next_state;
      end if;
    end if;
  end process;

  process (CLK_1HZ, s_state, ON_OFF, SW, PREHEAT_IN, FINISHED)
  begin

    if rising_edge(CLK_1HZ) then

      next_state <= s_state; -- Default to hold state
      case s_state is
        when IDLE =>
          if SW(1) = '1' then
            if PREHEAT_IN = 0 then
              next_state <= COOK;
            else
              next_state <= PREHEAT;
            end if;
          end if;

        when PREHEAT =>
          if FINISHED = '1' then
            next_state <= COOK;
          end if;

        when COOK =>
          if FINISHED = '1' then
            next_state <= FINISH;
          end if;

        when FINISH =>
          next_state <= COOL;

        when COOL =>
          if ON_OFF = '1' then
            next_state <= IDLE;
          end if;
      end case;
    end if;
  end process;

  -- Mapeamento dos estados para os sinais de saída
  STATE <= "000" when next_state = IDLE else
    "001" when next_state = PREHEAT else
    "010" when next_state = COOK else
    "011" when next_state = FINISH else
    "100" when next_state = COOL else
    "000"; -- Default to IDLE
end Behavioral;