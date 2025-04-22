library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity airfryer_controller is
    port (
        CLOCK_50    : in  std_logic;
        SW          : in  std_logic_vector(7 downto 0);
        KEY         : in  std_logic_vector(3 downto 0);
        LEDG        : out std_logic_vector(7 downto 0);
        LEDR        : out std_logic_vector(2 downto 0);
        HEX0        : out std_logic_vector(6 downto 0);
        HEX1        : out std_logic_vector(6 downto 0);
        HEX2        : out std_logic_vector(6 downto 0);
        HEX4        : out std_logic_vector(6 downto 0);
        HEX5        : out std_logic_vector(6 downto 0)
    );
end airfryer_controller;

architecture Behavioral of airfryer_controller is

    signal clk_1hz           : std_logic;
    signal current_temp_pre  : integer := 20;
    signal current_temp_cook : integer := 20;
    signal current_time  	  : integer := 0;
    signal temp_out          : integer;
    signal preheat_out       : integer;
    signal cook_out          : integer;
    signal state             : std_logic_vector(2 downto 0);
	 signal prog              : std_logic_vector(2 downto 0);
    signal finished			  : std_logic;
    signal half_time_pre     : std_logic_vector(3 downto 0);
    signal h0, h1, h2, h4, h5: std_logic_vector(6 downto 0);

    -- Debounced signals
    signal debounced_key0, debounced_key1, debounced_key2, debounced_key3: std_logic;

begin

    -- Instantiate FreqDivider_1Hz
    FreqDivider_1Hz: entity work.FreqDivider_1Hz(Behavioral)
        port map (
            CLOCK_50 => CLOCK_50,
            RESET => SW(0),
            CLK_OUT => clk_1hz
        );
		
	AirFryerPrograms: entity work.AirFryerPrograms(Behavioral)
        port map (
         clk			=> CLOCK_50,
			SW         	=> SW,
			state			=> state,
			prog			=> prog,
			temp_out   	=> temp_out,
			preheat_out	=> preheat_out,
			cook_out  	=> cook_out
        );
		
  -- Instantiate temp_control
temperature_control: entity work.temp_control(behavioral)
    port map (
        clk_1hz => clk_1hz,
        On_OFF => SW(0),
        run => SW(1),
        fast_cool => SW(7),
        open_oven => SW(2),
        temp_up => debounced_key2,
        temp_down => debounced_key3,
        TEMP => temp_out,
        current_temp => current_temp_cook,
        FooD_In => LEDG(3)
    );



    -- Instantiate time_control for preheat
    time_control: entity work.time_control(Behavioral)
        port map (
            clk => CLOCK_50,
				clk1hz=> clk_1hz,
				state => state,
				prog 	=> prog,
            time_up => debounced_key0,
            time_down => debounced_key1,
            preheat_time=> preheat_out,
				cook_time => cook_out,
            half_time => LEDG(7 downto 4),
            current_time => current_time,
            finished => finished
        );
		  	  

    -- Instantiate StateMachine
    state_machine: entity work.state_machine(Behavioral)
        port map (
            CLK_1HZ => CLOCK_50,
            ON_OFF => SW(0),
            SW => SW,
            PREHEAT_IN => preheat_out,
            COOK_IN => cook_out,
				TEMP_IN => temp_out,
            CURRENT_TEMP_COOK => current_temp_cook,
            FINISHED => finished,
            STATE => state
        );

    -- Instantiate IntTo7SegDecoder component
    IntTo7SegDecoder : entity work.IntTo7SegDecoder(Behavioral)
        port map (
            clk			=> CLOCK_50,
				state			=> state,
            Time_value	=> current_time,
            temp_value 	=> temp_out,
            hex0_output => h0,
            hex1_output => h1,
            hex2_output => h2,
            hex4_output => h4,
            hex5_output => h5
        );
		  
	 BlinkLed : entity work.LED_Blink(Behavioral)
        port map (
            clk => clk_1hz,
            rst => finished,
            led_out => LEDG(0)

        );


    -- Debouncer instances for each KEY
    Debouncer0: entity work.Debouncer
        port map (
            refClk => CLOCK_50,
            dirtyIn => KEY(0),
            pulsedOut => debounced_key0
        );

    Debouncer1: entity work.Debouncer
        port map (
            refClk => CLOCK_50,
            dirtyIn => KEY(1),
            pulsedOut => debounced_key1
        );

    Debouncer2: entity work.Debouncer
        port map (
            refClk => CLOCK_50,
            dirtyIn => KEY(2),
            pulsedOut => debounced_key2
        );

    Debouncer3: entity work.Debouncer
        port map (
            refClk => CLOCK_50,
            dirtyIn => KEY(3),
            pulsedOut => debounced_key3
        );
		  

    HEX0 <= h0;
    HEX1 <= h1;
    HEX2 <= h2;
    HEX4 <= h4;
    HEX5 <= h5;

	 LEDR <= state;

end Behavioral;