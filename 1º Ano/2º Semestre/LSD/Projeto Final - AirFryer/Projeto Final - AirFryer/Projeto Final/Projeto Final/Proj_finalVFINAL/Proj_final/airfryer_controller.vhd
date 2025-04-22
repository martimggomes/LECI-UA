library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity airfryer_controller is
    port (
        CLOCK_50    : in  std_logic;
        SW          : in  std_logic_vector(7 downto 0);
        KEY         : in  std_logic_vector(3 downto 0);
        LEDG        : out std_logic_vector(7 downto 0);
        LEDR        : out std_logic_vector(3 downto 0);
        HEX0        : out std_logic_vector(6 downto 0);
        HEX1        : out std_logic_vector(6 downto 0);
        HEX2        : out std_logic_vector(6 downto 0);
        HEX4        : out std_logic_vector(6 downto 0);
        HEX5        : out std_logic_vector(6 downto 0)
    );
end airfryer_controller;

architecture Behavioral of airfryer_controller is

	 signal Food_in           : std_logic;
	 signal s_halftime		  : std_logic_vector(3 downto 0);
    signal current_temp_cook : integer := 20;
    signal current_time  	  : integer;
    signal temp_out          : integer;
    signal preheat_out       : integer;
    signal cook_out          : integer;
    signal state             : std_logic_vector(2 downto 0);
	 signal prog              : std_logic_vector(2 downto 0);
    signal finished			  : std_logic;
    signal h0, h1, h2, h4, h5: std_logic_vector(6 downto 0);
    signal debounced_key0, debounced_key1, debounced_key2, debounced_key3: std_logic;

begin
		
	AirFryerPrograms: entity work.AirFryerPrograms(Behavioral)
        port map (
         clk			=> CLOCK_50,
			SW         	=> SW,
			state			=> state,
			temp_in		=> current_temp_cook,
			prog			=> prog,
			temp_out   	=> temp_out
        );
		  
		
    temperature_control: entity work.temp_control(Behavioral)
        port map (
            clk 				=> CLOCK_50,
            On_OFF 			=> SW(0),
            run 				=> SW(1),
            fast_cool 		=> SW(7),
            open_oven 		=> SW(2),
				temp_up   		=> debounced_key1,    
				temp_down 		=> debounced_key0,
				prog				=> prog,
				state    		=> state,
            TEMP 				=> temp_out,
            current_temp 	=> current_temp_cook,
            FooD_In 			=> Food_in
        );

    time_control: entity work.time_control(Behavioral)
        port map (
				clk			=> CLOCK_50,
				ON_OFF 		=> SW(0),
				OPEN_OVEN	=> SW(2),
				selector		=> SW(3),
				state 		=> state,
				prog			=> prog,
            preheat_time=> preheat_out,
				cook_time 	=> cook_out,
            half_time 	=> s_halftime,
            current_time=> current_time,
            finished 	=> finished
        );
		  
		  
	 USER_Prog: entity work.User_prog(Behavioral)
        port map (
            clk 			=> CLOCK_50,
				state 		=> state,
				prog 			=> prog,
            selector 	=> SW(3),	
			   time_up		=> debounced_key3,
			   time_down	=> debounced_key2,
            user_preheat=> preheat_out,
            user_cook 	=> cook_out
        );  
		   

    state_machine: entity work.state_machine(Behavioral)
        port map (
            CLK 					=> CLOCK_50,
            ON_OFF 				=> SW(0),
				OPEN_OVEN			=> SW(2),
            SW 					=> SW,
            PREHEAT_IN 			=> preheat_out,
            COOK_IN 				=> cook_out,
				TEMP_IN 				=> temp_out,
            CURRENT_TEMP_COOK => current_temp_cook,
            FINISHED 			=> finished,
            STATE 				=> state
        );

		  
    IntTo7SegDecoder : entity work.IntTo7SegDecoder(Behavioral)
        port map (
				state			=> state,
            Time_value	=> current_time,
            temp_value 	=> temp_out,
            hex0_output => h0,
            hex1_output => h1,
            hex2_output => h2,
            hex4_output => h4,
            hex5_output => h5
        );
		  

    Debouncer0: entity work.Debouncer
     port map (
        refClk      => CLOCK_50,
        dirtyIn     => KEY(0),
        pulsedOut   => debounced_key0
     );

     Debouncer1: entity work.Debouncer
     port map (
        refClk      => CLOCK_50,
        dirtyIn     => KEY(1),
        pulsedOut   => debounced_key1
     );


    Debouncer2: entity work.Debouncer
     port map (
        refClk      => CLOCK_50,
        dirtyIn     => KEY(2),
        pulsedOut   => debounced_key2
     );

    Debouncer3: entity work.Debouncer
     port map (
        refClk      => CLOCK_50,
        dirtyIn     => KEY(3),
        pulsedOut   => debounced_key3
     );
		  

    HEX0 <= h0;
    HEX1 <= h1;
    HEX2 <= h2;
    HEX4 <= h4;
    HEX5 <= h5;
	 LEDG(7 downto 4) <= s_halftime;
	 LEDG(0)<= finished;	
	 LEDR(2 downto 0) <= state;
end Behavioral;