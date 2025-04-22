-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "04/04/2024 15:33:43"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SeqShiftUnit_Demo IS
    PORT (
	LEDR : OUT std_logic_vector(7 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	SW16 : IN std_logic;
	SW15 : IN std_logic;
	SW14 : IN std_logic;
	SW13 : IN std_logic;
	SW12 : IN std_logic;
	SW11 : IN std_logic;
	SW7 : IN std_logic;
	SW6 : IN std_logic;
	SW5 : IN std_logic;
	SW4 : IN std_logic;
	SW3 : IN std_logic;
	SW2 : IN std_logic;
	SW1 : IN std_logic;
	SW0 : IN std_logic
	);
END SeqShiftUnit_Demo;

-- Design Ports Information
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW12	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW13	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW15	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW11	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW7	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW14	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW6	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW5	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW4	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW3	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW2	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW1	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW16	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW0	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SeqShiftUnit_Demo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW16 : std_logic;
SIGNAL ww_SW15 : std_logic;
SIGNAL ww_SW14 : std_logic;
SIGNAL ww_SW13 : std_logic;
SIGNAL ww_SW12 : std_logic;
SIGNAL ww_SW11 : std_logic;
SIGNAL ww_SW7 : std_logic;
SIGNAL ww_SW6 : std_logic;
SIGNAL ww_SW5 : std_logic;
SIGNAL ww_SW4 : std_logic;
SIGNAL ww_SW3 : std_logic;
SIGNAL ww_SW2 : std_logic;
SIGNAL ww_SW1 : std_logic;
SIGNAL ww_SW0 : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|clkOut~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst1|s_divCounter~1_combout\ : std_logic;
SIGNAL \inst1|s_divCounter~0_combout\ : std_logic;
SIGNAL \inst1|s_divCounter~2_combout\ : std_logic;
SIGNAL \inst1|s_divCounter~3_combout\ : std_logic;
SIGNAL \inst1|LessThan0~0_combout\ : std_logic;
SIGNAL \inst1|clkOut~0_combout\ : std_logic;
SIGNAL \inst1|clkOut~feeder_combout\ : std_logic;
SIGNAL \inst1|clkOut~q\ : std_logic;
SIGNAL \inst1|clkOut~clkctrl_outclk\ : std_logic;
SIGNAL \SW12~input_o\ : std_logic;
SIGNAL \SW13~input_o\ : std_logic;
SIGNAL \SW11~input_o\ : std_logic;
SIGNAL \SW16~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg~10_combout\ : std_logic;
SIGNAL \inst|s_shiftReg[0]~7_combout\ : std_logic;
SIGNAL \SW0~input_o\ : std_logic;
SIGNAL \SW14~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[1]~6_combout\ : std_logic;
SIGNAL \SW1~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[2]~5_combout\ : std_logic;
SIGNAL \SW2~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[3]~4_combout\ : std_logic;
SIGNAL \SW3~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[4]~3_combout\ : std_logic;
SIGNAL \SW4~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[5]~2_combout\ : std_logic;
SIGNAL \SW5~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[6]~1_combout\ : std_logic;
SIGNAL \SW6~input_o\ : std_logic;
SIGNAL \SW15~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg[7]~8_combout\ : std_logic;
SIGNAL \inst|s_shiftReg[7]~9_combout\ : std_logic;
SIGNAL \inst|s_shiftReg[7]~0_combout\ : std_logic;
SIGNAL \inst|s_shiftReg[7]~feeder_combout\ : std_logic;
SIGNAL \SW7~input_o\ : std_logic;
SIGNAL \inst|s_shiftReg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|s_divCounter\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst1|ALT_INV_clkOut~clkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

LEDR <= ww_LEDR;
ww_CLOCK_50 <= CLOCK_50;
ww_SW16 <= SW16;
ww_SW15 <= SW15;
ww_SW14 <= SW14;
ww_SW13 <= SW13;
ww_SW12 <= SW12;
ww_SW11 <= SW11;
ww_SW7 <= SW7;
ww_SW6 <= SW6;
ww_SW5 <= SW5;
ww_SW4 <= SW4;
ww_SW3 <= SW3;
ww_SW2 <= SW2;
ww_SW1 <= SW1;
ww_SW0 <= SW0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\inst1|clkOut~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst1|clkOut~q\);
\inst1|ALT_INV_clkOut~clkctrl_outclk\ <= NOT \inst1|clkOut~clkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(7),
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(6),
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(5),
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(4),
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(3),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(2),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(1),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|s_shiftReg\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X56_Y72_N28
\inst1|s_divCounter~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|s_divCounter~1_combout\ = (!\inst1|s_divCounter\(3) & (\inst1|s_divCounter\(1) $ (\inst1|s_divCounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|s_divCounter\(3),
	datac => \inst1|s_divCounter\(1),
	datad => \inst1|s_divCounter\(0),
	combout => \inst1|s_divCounter~1_combout\);

-- Location: FF_X56_Y72_N29
\inst1|s_divCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst1|s_divCounter~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|s_divCounter\(1));

-- Location: LCCOMB_X56_Y72_N26
\inst1|s_divCounter~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|s_divCounter~0_combout\ = (!\inst1|s_divCounter\(0) & (((!\inst1|s_divCounter\(2) & !\inst1|s_divCounter\(1))) # (!\inst1|s_divCounter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|s_divCounter\(2),
	datab => \inst1|s_divCounter\(1),
	datac => \inst1|s_divCounter\(0),
	datad => \inst1|s_divCounter\(3),
	combout => \inst1|s_divCounter~0_combout\);

-- Location: FF_X56_Y72_N27
\inst1|s_divCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst1|s_divCounter~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|s_divCounter\(0));

-- Location: LCCOMB_X56_Y72_N30
\inst1|s_divCounter~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|s_divCounter~2_combout\ = (!\inst1|s_divCounter\(3) & (\inst1|s_divCounter\(2) $ (((\inst1|s_divCounter\(0) & \inst1|s_divCounter\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|s_divCounter\(3),
	datab => \inst1|s_divCounter\(0),
	datac => \inst1|s_divCounter\(2),
	datad => \inst1|s_divCounter\(1),
	combout => \inst1|s_divCounter~2_combout\);

-- Location: FF_X56_Y72_N31
\inst1|s_divCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst1|s_divCounter~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|s_divCounter\(2));

-- Location: LCCOMB_X56_Y72_N22
\inst1|s_divCounter~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|s_divCounter~3_combout\ = (\inst1|s_divCounter\(2) & (\inst1|s_divCounter\(1) & (!\inst1|s_divCounter\(3) & \inst1|s_divCounter\(0)))) # (!\inst1|s_divCounter\(2) & (!\inst1|s_divCounter\(1) & (\inst1|s_divCounter\(3) & !\inst1|s_divCounter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|s_divCounter\(2),
	datab => \inst1|s_divCounter\(1),
	datac => \inst1|s_divCounter\(3),
	datad => \inst1|s_divCounter\(0),
	combout => \inst1|s_divCounter~3_combout\);

-- Location: FF_X56_Y72_N23
\inst1|s_divCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst1|s_divCounter~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|s_divCounter\(3));

-- Location: LCCOMB_X56_Y72_N2
\inst1|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|LessThan0~0_combout\ = (!\inst1|s_divCounter\(0) & !\inst1|s_divCounter\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|s_divCounter\(0),
	datad => \inst1|s_divCounter\(1),
	combout => \inst1|LessThan0~0_combout\);

-- Location: LCCOMB_X56_Y72_N0
\inst1|clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|clkOut~0_combout\ = (\inst1|LessThan0~0_combout\ & ((\inst1|s_divCounter\(2) & ((!\inst1|s_divCounter\(3)))) # (!\inst1|s_divCounter\(2) & (\inst1|clkOut~q\)))) # (!\inst1|LessThan0~0_combout\ & (\inst1|clkOut~q\ & (!\inst1|s_divCounter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst1|clkOut~q\,
	datab => \inst1|s_divCounter\(3),
	datac => \inst1|s_divCounter\(2),
	datad => \inst1|LessThan0~0_combout\,
	combout => \inst1|clkOut~0_combout\);

-- Location: LCCOMB_X56_Y72_N24
\inst1|clkOut~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|clkOut~feeder_combout\ = \inst1|clkOut~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst1|clkOut~0_combout\,
	combout => \inst1|clkOut~feeder_combout\);

-- Location: FF_X56_Y72_N25
\inst1|clkOut\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst1|clkOut~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|clkOut~q\);

-- Location: CLKCTRL_G11
\inst1|clkOut~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst1|clkOut~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst1|clkOut~clkctrl_outclk\);

-- Location: IOIBUF_X81_Y73_N8
\SW12~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW12,
	o => \SW12~input_o\);

-- Location: IOIBUF_X87_Y73_N1
\SW13~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW13,
	o => \SW13~input_o\);

-- Location: IOIBUF_X85_Y73_N22
\SW11~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW11,
	o => \SW11~input_o\);

-- Location: IOIBUF_X81_Y73_N1
\SW16~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW16,
	o => \SW16~input_o\);

-- Location: LCCOMB_X84_Y72_N10
\inst|s_shiftReg~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg~10_combout\ = (\SW13~input_o\ & (((\inst|s_shiftReg\(7))))) # (!\SW13~input_o\ & (!\SW11~input_o\ & (\SW16~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW13~input_o\,
	datab => \SW11~input_o\,
	datac => \SW16~input_o\,
	datad => \inst|s_shiftReg\(7),
	combout => \inst|s_shiftReg~10_combout\);

-- Location: LCCOMB_X84_Y72_N6
\inst|s_shiftReg[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[0]~7_combout\ = (\SW12~input_o\ & ((\inst|s_shiftReg~10_combout\))) # (!\SW12~input_o\ & (\inst|s_shiftReg\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW12~input_o\,
	datab => \inst|s_shiftReg\(1),
	datad => \inst|s_shiftReg~10_combout\,
	combout => \inst|s_shiftReg[0]~7_combout\);

-- Location: IOIBUF_X85_Y73_N8
\SW0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW0,
	o => \SW0~input_o\);

-- Location: IOIBUF_X81_Y73_N15
\SW14~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW14,
	o => \SW14~input_o\);

-- Location: FF_X84_Y72_N7
\inst|s_shiftReg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[0]~7_combout\,
	asdata => \SW0~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(0));

-- Location: LCCOMB_X84_Y72_N8
\inst|s_shiftReg[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[1]~6_combout\ = (\SW12~input_o\ & ((\inst|s_shiftReg\(0)))) # (!\SW12~input_o\ & (\inst|s_shiftReg\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_shiftReg\(2),
	datab => \SW12~input_o\,
	datad => \inst|s_shiftReg\(0),
	combout => \inst|s_shiftReg[1]~6_combout\);

-- Location: IOIBUF_X83_Y73_N8
\SW1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW1,
	o => \SW1~input_o\);

-- Location: FF_X84_Y72_N9
\inst|s_shiftReg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[1]~6_combout\,
	asdata => \SW1~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(1));

-- Location: LCCOMB_X84_Y72_N26
\inst|s_shiftReg[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[2]~5_combout\ = (\SW12~input_o\ & (\inst|s_shiftReg\(1))) # (!\SW12~input_o\ & ((\inst|s_shiftReg\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW12~input_o\,
	datab => \inst|s_shiftReg\(1),
	datad => \inst|s_shiftReg\(3),
	combout => \inst|s_shiftReg[2]~5_combout\);

-- Location: IOIBUF_X87_Y73_N22
\SW2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW2,
	o => \SW2~input_o\);

-- Location: FF_X84_Y72_N27
\inst|s_shiftReg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[2]~5_combout\,
	asdata => \SW2~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(2));

-- Location: LCCOMB_X84_Y72_N24
\inst|s_shiftReg[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[3]~4_combout\ = (\SW12~input_o\ & (\inst|s_shiftReg\(2))) # (!\SW12~input_o\ & ((\inst|s_shiftReg\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_shiftReg\(2),
	datab => \inst|s_shiftReg\(4),
	datad => \SW12~input_o\,
	combout => \inst|s_shiftReg[3]~4_combout\);

-- Location: IOIBUF_X85_Y73_N15
\SW3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW3,
	o => \SW3~input_o\);

-- Location: FF_X84_Y72_N25
\inst|s_shiftReg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[3]~4_combout\,
	asdata => \SW3~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(3));

-- Location: LCCOMB_X84_Y72_N14
\inst|s_shiftReg[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[4]~3_combout\ = (\SW12~input_o\ & ((\inst|s_shiftReg\(3)))) # (!\SW12~input_o\ & (\inst|s_shiftReg\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW12~input_o\,
	datab => \inst|s_shiftReg\(5),
	datad => \inst|s_shiftReg\(3),
	combout => \inst|s_shiftReg[4]~3_combout\);

-- Location: IOIBUF_X83_Y73_N15
\SW4~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW4,
	o => \SW4~input_o\);

-- Location: FF_X84_Y72_N15
\inst|s_shiftReg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[4]~3_combout\,
	asdata => \SW4~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(4));

-- Location: LCCOMB_X84_Y72_N16
\inst|s_shiftReg[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[5]~2_combout\ = (\SW12~input_o\ & ((\inst|s_shiftReg\(4)))) # (!\SW12~input_o\ & (\inst|s_shiftReg\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_shiftReg\(6),
	datab => \inst|s_shiftReg\(4),
	datad => \SW12~input_o\,
	combout => \inst|s_shiftReg[5]~2_combout\);

-- Location: IOIBUF_X81_Y73_N22
\SW5~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW5,
	o => \SW5~input_o\);

-- Location: FF_X84_Y72_N17
\inst|s_shiftReg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[5]~2_combout\,
	asdata => \SW5~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(5));

-- Location: LCCOMB_X84_Y72_N30
\inst|s_shiftReg[6]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[6]~1_combout\ = (\SW12~input_o\ & ((\inst|s_shiftReg\(5)))) # (!\SW12~input_o\ & (\inst|s_shiftReg\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW12~input_o\,
	datab => \inst|s_shiftReg\(7),
	datad => \inst|s_shiftReg\(5),
	combout => \inst|s_shiftReg[6]~1_combout\);

-- Location: IOIBUF_X83_Y73_N1
\SW6~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW6,
	o => \SW6~input_o\);

-- Location: FF_X84_Y72_N31
\inst|s_shiftReg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[6]~1_combout\,
	asdata => \SW6~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(6));

-- Location: IOIBUF_X83_Y73_N22
\SW15~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW15,
	o => \SW15~input_o\);

-- Location: LCCOMB_X84_Y72_N22
\inst|s_shiftReg[7]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[7]~8_combout\ = (\SW13~input_o\) # ((\SW11~input_o\ & ((\inst|s_shiftReg\(7)))) # (!\SW11~input_o\ & (\SW15~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW13~input_o\,
	datab => \SW11~input_o\,
	datac => \SW15~input_o\,
	datad => \inst|s_shiftReg\(7),
	combout => \inst|s_shiftReg[7]~8_combout\);

-- Location: LCCOMB_X84_Y72_N12
\inst|s_shiftReg[7]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[7]~9_combout\ = (\inst|s_shiftReg\(0)) # (!\SW13~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW13~input_o\,
	datad => \inst|s_shiftReg\(0),
	combout => \inst|s_shiftReg[7]~9_combout\);

-- Location: LCCOMB_X84_Y72_N20
\inst|s_shiftReg[7]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[7]~0_combout\ = (\SW12~input_o\ & (\inst|s_shiftReg\(6))) # (!\SW12~input_o\ & (((\inst|s_shiftReg[7]~8_combout\ & \inst|s_shiftReg[7]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_shiftReg\(6),
	datab => \SW12~input_o\,
	datac => \inst|s_shiftReg[7]~8_combout\,
	datad => \inst|s_shiftReg[7]~9_combout\,
	combout => \inst|s_shiftReg[7]~0_combout\);

-- Location: LCCOMB_X84_Y72_N28
\inst|s_shiftReg[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|s_shiftReg[7]~feeder_combout\ = \inst|s_shiftReg[7]~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|s_shiftReg[7]~0_combout\,
	combout => \inst|s_shiftReg[7]~feeder_combout\);

-- Location: IOIBUF_X85_Y73_N1
\SW7~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW7,
	o => \SW7~input_o\);

-- Location: FF_X84_Y72_N29
\inst|s_shiftReg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst1|ALT_INV_clkOut~clkctrl_outclk\,
	d => \inst|s_shiftReg[7]~feeder_combout\,
	asdata => \SW7~input_o\,
	sload => \SW14~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_shiftReg\(7));

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


