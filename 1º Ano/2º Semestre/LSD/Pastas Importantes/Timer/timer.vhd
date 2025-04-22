library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity timer is
    Port ( clk : in STD_LOGIC;
           key : in STD_LOGIC_VECTOR(1 downto 0);
           HEX5, HEX4 : out STD_LOGIC_VECTOR(6 downto 0));
end timer;

architecture Behavioral of timer is
    signal count : integer range 0 to 59 := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Increment count on key(0) press
            if key(0) = '1' then
                count <= count + 1;
            end if;
            -- Decrement count on key(1) press
            if key(1) = '1' then
                count <= count - 1;
            end if;
        end if;
    end process;

    -- Display count value on HEX5 and HEX4 displays
    HEX5 <= std_logic_vector(to_unsigned(count / 10, HEX5'length));
    HEX4 <= std_logic_vector(to_unsigned(count mod 10, HEX4'length));

end Behavioral;
