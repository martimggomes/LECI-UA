library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FreqDivider_1Hz is
  port
  (
    CLOCK_50 : in std_logic;
    RESET    : in std_logic;
    CLK_OUT  : out std_logic
  );
end FreqDivider_1Hz;

architecture Behavioral of FreqDivider_1Hz is
  signal s_counter       : unsigned(31 downto 0) := (others => '0');
  constant DIVIDER_VALUE : unsigned(31 downto 0) := to_unsigned(50000000, 32);
  signal clk_1hz         : std_logic             := '0';
begin
  process (CLOCK_50, RESET)
  begin
    if RESET = '1' then
      s_counter <= (others => '0');
      clk_1hz   <= '0';
    elsif rising_edge(CLOCK_50) then
      if s_counter = DIVIDER_VALUE / 2 - 1 then
        clk_1hz   <= not clk_1hz;
        s_counter <= (others => '0');
      else
        s_counter <= s_counter + 1;
      end if;
    end if;
  end process;
  CLK_OUT <= clk_1hz;
end Behavioral;