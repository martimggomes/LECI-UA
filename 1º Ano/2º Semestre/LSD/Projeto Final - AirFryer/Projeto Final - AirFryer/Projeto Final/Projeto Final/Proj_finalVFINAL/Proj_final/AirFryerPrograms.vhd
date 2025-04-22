library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AirFryerPrograms is
    port (
        clk      : in std_logic;
        SW       : in std_logic_vector(7 downto 0);
        state    : in std_logic_vector(2 downto 0);
		  temp_in  : in integer;
        prog     : out std_logic_vector(2 downto 0);
        temp_out : out integer
    );
end AirFryerPrograms;

architecture Behavioral of AirFryerPrograms is
begin
    process (clk, temp_in)
    begin
        if rising_edge(clk) then
            case state is
                when "100" => -- COOL state
                    temp_out <= temp_in;
						  
                when "000" => -- IDLE state
                    case SW(6 downto 4) is
                        when "000" => -- Default
                            prog <= "001";
                            temp_out <= 20;
								when "001" =>
									 prog <= "001";
									 temp_out <= 200;
                        when "010" => -- User
                            prog <= "010";
									 temp_out <= temp_in;
                        when "011" => -- Rissol
                            prog <= "011";
                            temp_out <= 180;
                        when "100" => -- Batata
                            prog <= "100";
                            temp_out <= 200;
                        when "101" => -- Filete
                            prog <= "101";
                            temp_out <= 170;
                        when "111" => -- Hamburger
                            prog <= "111";
                            temp_out <= 170;
                        when others => 
                            prog <= "001";
                            temp_out <= 020;
                    end case;
                when others =>
                    -- Default case to handle other states
                    prog <= "000";
                    temp_out <= temp_in;
            end case;
        end if;
    end process;
end Behavioral;
