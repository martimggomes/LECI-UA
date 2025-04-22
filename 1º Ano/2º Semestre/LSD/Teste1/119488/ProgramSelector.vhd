library IEEE;
use IEEE.std_logic_1164.all;

entity ProgramSelector is
    port (SW       : in  std_logic_vector(1 downto 0);
          CLOCK_50 : in std_logic;
          KEY      : in std_logic_vector(1 downto 0);
          HEX0     : out std_logic_vector(6 downto 0);
          LEDR     : out std_logic_vector(3 downto 0);
          LEDG     : out std_logic_vector(3 downto 0)
    );
end ProgramSelector;

architecture Shell of ProgramSelector is
   signal pulseFreq, pulseStart, blinkSignal_2hz : std_logic;
   signal ProgramActive : std_logic_vector(1 downto 0);
	signal bcd_outUnits, bcd_outDozens : std_logic_vector(3 downto 0);
	signal s_pulse : std_logic;


begin 
  ProgramActive(0) <= '1' when SW = "00" else '0';
  ProgramActive(1) <= '1' when SW = "01" else '0';
  ProgramActive(2) <= '1' when SW = "10" else '0';
  ProgramActive(3) <= '1' when SW = "11" else '0';
  
  
    pulse: entity work.pulse_gen(Behavioral)
    generic map (MAX => 50000000)
    port map ( clk   => CLOCK_50,
            reset => '0',
				pulse => s_pulse);


    Blink2hzGenerator   : entity work.blink_gen
    generic map (NUMBER_STEPS => 25_000_000) 
    port map (clk   => CLOCK_50,
            reset   => not(KEY(1)), 
            blink   => blinkSignal_2hz);
    
	 Bin7SegDecoderUnits : entity work.Bin7SegDecoder(Behavioral)
    port map( enable   => ProgramActive,
              binInput => bcd_outUnits & bcd_outDozens,
              decOut_n => HEX0);

    prog1 : entity work.Programa1(Behavioral)
    port map (Enable => ProgramActive(0),
        sinal_vermelho => LEDR,
        sinal_verde => LEDG);

	 prog2 : entity work.Programa2(Behavioral)
    port map (CLK => CLOCK_50,
        Enable  => ProgramActive(1),
        Reset   => not KEY(0),
        LEDR    => LEDR,
        LEDG    => LEDG);
		  
	prog3 : entity work.Programa3(Behavioral)
	port map (CLK => CLOCK_50,
        Enable  => ProgramActive(2),
        Reset   => not KEY(0),
        LEDR    => LEDR,
        LEDG    => LEDG);
		  
end Shell;