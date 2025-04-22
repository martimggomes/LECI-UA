library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AirFryerPrograms is
  port
  (
    clk         : in std_logic;
    SW          : in std_logic_vector(7 downto 0);
    state       : in std_logic_vector(2 downto 0);
    prog        : out std_logic_vector(2 downto 0);
    temp_out    : out integer;
    preheat_out : out integer;
    cook_out    : out integer
  );
end AirFryerPrograms;

architecture Behavioral of AirFryerPrograms is
begin
  process (clk, SW, state)
  begin
    if rising_edge(clk) then
      if state = "100" then
        temp_out    <= 20;
        preheat_out <= 0;
        cook_out    <= 0;
      elsif state = "000" then
        case SW(6 downto 4) is
          when "000" => -- Default
            prog        <= "000";
            temp_out    <= 200;
            preheat_out <= 0;
            cook_out    <= 18;
          when "001" => -- User
            prog        <= "001";
            temp_out    <= 0; --0 para representar o user_temp
            preheat_out <= 10; --10 para representar o user_preheat
            cook_out    <= 0; --0 para representar o user_cook
          when "010" => -- Rissol
            prog        <= "010";
            temp_out    <= 180;
            preheat_out <= 3;
            cook_out    <= 15;
          when "011" => -- Batata
            prog        <= "011";
            temp_out    <= 200;
            preheat_out <= 5;
            cook_out    <= 20;
          when "100" => -- Filete
            prog        <= "100";
            temp_out    <= 170;
            preheat_out <= 3;
            cook_out    <= 20;
          when "101" => -- Hamburger
            prog        <= "101";
            temp_out    <= 170;
            preheat_out <= 5;
            cook_out    <= 20;
          when others => -- Default fallback
            prog        <= "000";
            temp_out    <= 200;
            preheat_out <= 0;
            cook_out    <= 18;
        end case;
      end if;
    end if;
  end process;
end Behavioral;