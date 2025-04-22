library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity LED_Blink is
  port
  (
    clk     : in std_logic; -- System clock (50 MHz)
    rst     : in std_logic; -- Reset signal
    led_out : out std_logic -- LED output
  );
end LED_Blink;

architecture Behavioral of LED_Blink is
  signal counter   : integer   := 0;
  signal led_state : std_logic := '0';

  constant DIVISOR : integer := 5000000; -- Division factor
begin

  process (clk, rst)
  begin
    if rst = '1' then
      counter   <= 0;
      led_state <= '0';
    elsif rising_edge(clk) then
      if counter = DIVISOR - 1 then
        counter   <= 0;
        led_state <= not led_state; -- Toggle LED state
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;

  led_out <= led_state;

end Behavioral;