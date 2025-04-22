library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity IntTo7SegDecoder is
    Port (
        state          : in std_logic_vector(2 downto 0);
        Time_value     : in integer range 0 to 60;
        temp_value     : in integer range 0 to 999;
        hex0_output    : out std_logic_vector(6 downto 0);
        hex1_output    : out std_logic_vector(6 downto 0);
        hex2_output    : out std_logic_vector(6 downto 0);
        hex4_output    : out std_logic_vector(6 downto 0);
        hex5_output    : out std_logic_vector(6 downto 0)
    );
end IntTo7SegDecoder;

architecture Behavioral of IntTo7SegDecoder is
    signal time_units    : integer range 0 to 9;
    signal time_tens     : integer range 0 to 5;
    signal temp_units    : integer range 0 to 9;
    signal temp_tens     : integer range 0 to 9;
    signal temp_hundreds : integer range 0 to 9;
    signal outputs       : integer range 0 to 60;

    signal hex0_internal : std_logic_vector(6 downto 0);
    signal hex1_internal : std_logic_vector(6 downto 0);
    signal hex2_internal : std_logic_vector(6 downto 0);
    signal hex4_internal : std_logic_vector(6 downto 0);
    signal hex5_internal : std_logic_vector(6 downto 0);
	
	begin
    process(Time_value, temp_value)
    begin
			time_units <= Time_value mod 10;
			time_tens <= Time_value / 10;
			temp_units <= temp_value mod 10;
			temp_tens <= (temp_value / 10) mod 10;
			temp_hundreds <= temp_value / 100;
    end process;

    -- Conversão de dígitos de tempo e temperatura para exibição em 7 segmentos
		with temp_units select
			hex0_internal <= 	"1000000" when 0,
									"1111001" when 1,
									"0100100" when 2,
									"0110000" when 3,
									"0011001" when 4,
									"0010010" when 5,
									"0000010" when 6,
									"1111000" when 7,
									"0000000" when 8,
									"0010000" when 9,
									"1000000" when others;
	  with temp_tens select
			hex1_internal <= 	"1000000" when 0,
									"1111001" when 1,
									"0100100" when 2,
									"0110000" when 3,
									"0011001" when 4,
									"0010010" when 5,
									"0000010" when 6,
									"1111000" when 7,
									"0000000" when 8,
									"0010000" when 9,
									"1000000" when others;
	  with temp_hundreds select
			hex2_internal <= 	"1000000" when 0,
									"1111001" when 1,
									"0100100" when 2,
									"0110000" when 3,
									"0011001" when 4,
									"0010010" when 5,
									"0000010" when 6,
									"1111000" when 7,
									"0000000" when 8,
									"0010000" when 9,
									"1000000" when others;
	  with time_units select
			hex4_internal <= 	"1000000" when 0,
									"1111001" when 1,
									"0100100" when 2,
									"0110000" when 3,
									"0011001" when 4,
									"0010010" when 5,
									"0000010" when 6,
									"1111000" when 7,
									"0000000" when 8,
									"0010000" when 9,
									"1000000" when others;
		with time_tens select
			hex5_internal <= 	"1000000" when 0,
									"1111001" when 1,
									"0100100" when 2,
									"0110000" when 3,
									"0011001" when 4,
									"0010010" when 5,
									"1000000" when others;

    hex0_output <= hex0_internal;
    hex1_output <= hex1_internal;
    hex2_output <= hex2_internal;
    hex4_output <= hex4_internal;
    hex5_output <= hex5_internal;

end Behavioral;
