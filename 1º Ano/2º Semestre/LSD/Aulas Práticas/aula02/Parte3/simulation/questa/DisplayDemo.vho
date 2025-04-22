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

-- DATE "02/29/2024 15:57:16"

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


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Bin7SegDecoderDemo IS
    PORT (
	SW : IN std_logic_vector(3 DOWNTO 0);
	KEY : IN std_logic_vector(0 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Bin7SegDecoderDemo;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AD27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Bin7SegDecoderDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[0]~0_combout\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[0]~1_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[1]~2_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[1]~3_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[1]~4_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[2]~5_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[2]~6_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[3]~7_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[3]~8_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[4]~9_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[4]~10_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[5]~11_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[5]~12_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[6]~13_combout\ : std_logic;
SIGNAL \Bin7SegDecoder_0|decOut_n[6]~14_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_SW <= SW;
ww_KEY <= KEY;
HEX0 <= ww_HEX0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[0]~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[1]~4_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[2]~6_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[3]~8_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[4]~10_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[5]~12_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Bin7SegDecoder_0|decOut_n[6]~14_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOIBUF_X115_Y13_N8
\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X115_Y15_N8
\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X114_Y50_N24
\Bin7SegDecoder_0|decOut_n[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[0]~0_combout\ = (\SW[3]~input_o\ & (\SW[0]~input_o\ & (\SW[1]~input_o\ $ (\SW[2]~input_o\)))) # (!\SW[3]~input_o\ & (!\SW[1]~input_o\ & (\SW[2]~input_o\ $ (\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[0]~0_combout\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: LCCOMB_X114_Y50_N2
\Bin7SegDecoder_0|decOut_n[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[0]~1_combout\ = (\Bin7SegDecoder_0|decOut_n[0]~0_combout\) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Bin7SegDecoder_0|decOut_n[0]~0_combout\,
	datad => \KEY[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[0]~1_combout\);

-- Location: LCCOMB_X114_Y50_N28
\Bin7SegDecoder_0|decOut_n[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[1]~2_combout\ = (\SW[3]~input_o\ & (\SW[2]~input_o\ & ((\SW[1]~input_o\) # (!\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[1]~2_combout\);

-- Location: LCCOMB_X114_Y50_N22
\Bin7SegDecoder_0|decOut_n[1]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[1]~3_combout\ = (\SW[3]~input_o\ & (\SW[1]~input_o\ & (!\SW[2]~input_o\ & \SW[0]~input_o\))) # (!\SW[3]~input_o\ & (\SW[2]~input_o\ & (\SW[1]~input_o\ $ (\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[1]~3_combout\);

-- Location: LCCOMB_X114_Y50_N16
\Bin7SegDecoder_0|decOut_n[1]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[1]~4_combout\ = (\Bin7SegDecoder_0|decOut_n[1]~2_combout\) # ((\Bin7SegDecoder_0|decOut_n[1]~3_combout\) # (!\KEY[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Bin7SegDecoder_0|decOut_n[1]~2_combout\,
	datac => \Bin7SegDecoder_0|decOut_n[1]~3_combout\,
	datad => \KEY[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[1]~4_combout\);

-- Location: LCCOMB_X114_Y50_N18
\Bin7SegDecoder_0|decOut_n[2]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[2]~5_combout\ = (!\SW[3]~input_o\ & (\SW[1]~input_o\ & (!\SW[2]~input_o\ & !\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[2]~5_combout\);

-- Location: LCCOMB_X114_Y50_N4
\Bin7SegDecoder_0|decOut_n[2]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[2]~6_combout\ = ((\Bin7SegDecoder_0|decOut_n[2]~5_combout\) # (\Bin7SegDecoder_0|decOut_n[1]~2_combout\)) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \Bin7SegDecoder_0|decOut_n[2]~5_combout\,
	datad => \Bin7SegDecoder_0|decOut_n[1]~2_combout\,
	combout => \Bin7SegDecoder_0|decOut_n[2]~6_combout\);

-- Location: LCCOMB_X114_Y50_N30
\Bin7SegDecoder_0|decOut_n[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[3]~7_combout\ = (\SW[1]~input_o\ & ((\SW[2]~input_o\ & ((\SW[0]~input_o\))) # (!\SW[2]~input_o\ & (\SW[3]~input_o\ & !\SW[0]~input_o\)))) # (!\SW[1]~input_o\ & (!\SW[3]~input_o\ & (\SW[2]~input_o\ $ (\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[3]~7_combout\);

-- Location: LCCOMB_X114_Y50_N8
\Bin7SegDecoder_0|decOut_n[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[3]~8_combout\ = (\Bin7SegDecoder_0|decOut_n[3]~7_combout\) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Bin7SegDecoder_0|decOut_n[3]~7_combout\,
	datad => \KEY[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[3]~8_combout\);

-- Location: LCCOMB_X114_Y50_N10
\Bin7SegDecoder_0|decOut_n[4]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[4]~9_combout\ = (\SW[1]~input_o\ & (!\SW[3]~input_o\ & ((\SW[0]~input_o\)))) # (!\SW[1]~input_o\ & ((\SW[2]~input_o\ & (!\SW[3]~input_o\)) # (!\SW[2]~input_o\ & ((\SW[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[4]~9_combout\);

-- Location: LCCOMB_X114_Y50_N20
\Bin7SegDecoder_0|decOut_n[4]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[4]~10_combout\ = (\Bin7SegDecoder_0|decOut_n[4]~9_combout\) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Bin7SegDecoder_0|decOut_n[4]~9_combout\,
	datad => \KEY[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[4]~10_combout\);

-- Location: LCCOMB_X114_Y50_N6
\Bin7SegDecoder_0|decOut_n[5]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[5]~11_combout\ = (!\SW[3]~input_o\ & ((\SW[1]~input_o\ & ((\SW[0]~input_o\) # (!\SW[2]~input_o\))) # (!\SW[1]~input_o\ & (!\SW[2]~input_o\ & \SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[5]~11_combout\);

-- Location: LCCOMB_X114_Y50_N0
\Bin7SegDecoder_0|decOut_n[5]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[5]~12_combout\ = (\Bin7SegDecoder_0|decOut_n[5]~11_combout\) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Bin7SegDecoder_0|decOut_n[5]~11_combout\,
	datad => \KEY[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[5]~12_combout\);

-- Location: LCCOMB_X114_Y50_N26
\Bin7SegDecoder_0|decOut_n[6]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[6]~13_combout\ = (\SW[1]~input_o\ & (!\SW[3]~input_o\ & (\SW[2]~input_o\ & \SW[0]~input_o\))) # (!\SW[1]~input_o\ & (\SW[3]~input_o\ $ ((!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[3]~input_o\,
	datab => \SW[1]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[6]~13_combout\);

-- Location: LCCOMB_X114_Y50_N12
\Bin7SegDecoder_0|decOut_n[6]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Bin7SegDecoder_0|decOut_n[6]~14_combout\ = (\Bin7SegDecoder_0|decOut_n[6]~13_combout\) # (!\KEY[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Bin7SegDecoder_0|decOut_n[6]~13_combout\,
	datad => \KEY[0]~input_o\,
	combout => \Bin7SegDecoder_0|decOut_n[6]~14_combout\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;
END structure;


