library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Counter is
    Port ( CLK : in STD_LOGIC;
           KEY : in STD_LOGIC_VECTOR(1 downto 0);
           HEX4, HEX5 : out STD_LOGIC_VECTOR(6 downto 0));
end Counter;

architecture Behavioral of Counter is
    -- Clock counter
    signal clock_count : integer range 0 to 2499999 := 0; -- 50MHz clock
    
    -- Value counter
    signal counter_value : integer range 0 to 59 := 18;
    signal timer_up_count : integer range 0 to 2499999 := 0;
    signal timer_down_count : integer range 0 to 2499999 := 0;

begin
    -- Clock process
    process(CLK)
    begin
        if rising_edge(CLK) then
            if clock_count = 2499999 then -- 50MHz clock -> 1 second
                clock_count <= 0;
                
                -- Incrementa ou decrementa o contador baseado nas chaves
                if KEY(0) = '1' then
                    counter_value <= counter_value + 1;
                    if counter_value > 59 then
                        counter_value <= 0;
                    end if;
                elsif KEY(1) = '1' then
                    counter_value <= counter_value - 1;
                    if counter_value < 0 then
                        counter_value <= 59;
                    end if;
                end if;
            else
                clock_count <= clock_count + 1;
            end if;
            
            -- Atualiza os displays nos contadores
            HEX4 <= std_logic_vector(to_unsigned(counter_value mod 16, HEX4'length));
            HEX5 <= std_logic_vector(to_unsigned(counter_value/16, HEX5'length));
        end if;
    end process;

end Behavioral;
