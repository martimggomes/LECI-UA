library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity MiniProjetoTreino is
    port (
        CLOCK_50 : in std_logic;
        SW       : in std_logic_vector(0 downto 0);
        LEDG     : out std_logic_vector(3 downto 0);
        HEX0, HEX1 : out std_logic_vector(6 downto 0)
    );
end MiniProjetoTreino;

architecture Shell of MiniProjetoTreino is

    signal s_count, s_bcdOut1, s_bcdOut2 : std_logic_vector(3 downto 0);
    signal s_pulse, s_blink : std_logic;

begin
    process(CLOCK_50)
    begin

    end process;

    pulse: entity work.pulse_gen(Behavioral)
        generic map (
            MAX => 50000000
        )
        port map (
            clk   => CLOCK_50,
            reset => '0',
				pulse => s_pulse);
		  
		  
		  
  
	 blink : entity work.blink_gen(Behavioral)
			port map (clk => CLOCK_50,
						 reset => '0',
						 blink => s_blink);
				
		
	
	 reg4Bits : entity work.Register4Bits(Behavioral)
			port map (clk => CLOCK_50,
						enable => '1',
						reset => s_blink,
						dataIn(3 downto 0) => s_count,
						dataOut(3 downto 0) => LEDG(3 downto 0)
						);
		
		
		
		
    counter: entity work.CounterMod12(Behavioral)
        port map (
            clk   => CLOCK_50,
            reset => SW(0),
				enable => s_pulse,
				count(3 downto 0) => s_count
			); 

			
			
    bin2BCD: entity work.BinToBCD(Behavioral)
        port map (
            bin_input => s_count,
				bcd_output1(3 downto 0) => s_bcdOut1,
				bcd_output2(3 downto 0) => s_bcdOut2
        );
		

    
	 
	 bin7Seg1: entity work.Bin7SegDecoder(Behavioral)
        port map (
            binInput(3 downto 0) => s_bcdOut1, 
            enable => (not SW(0)), 
            decOut_n(6 downto 0) => HEX0(6 downto 0) 
        );

    bin7Seg2: entity work.Bin7SegDecoder(Behavioral)
        port map (
            binInput => s_bcdOut2, 
            enable => (not SW(0)), 
            decOut_n(6 downto 0) => HEX1(6 downto 0) 
        );
	
	
end Shell;
