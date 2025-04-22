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

-- DATE "04/08/2024 17:42:52"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
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

ENTITY 	MiniProjetoTreino IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(0 DOWNTO 0);
	LEDG : OUT std_logic_vector(3 DOWNTO 0);
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0)
	);
END MiniProjetoTreino;

-- Design Ports Information
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF MiniProjetoTreino IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \counter|s_count~3_combout\ : std_logic;
SIGNAL \pulse|Add0~0_combout\ : std_logic;
SIGNAL \pulse|Add0~1\ : std_logic;
SIGNAL \pulse|Add0~2_combout\ : std_logic;
SIGNAL \pulse|Add0~3\ : std_logic;
SIGNAL \pulse|Add0~4_combout\ : std_logic;
SIGNAL \pulse|Add0~5\ : std_logic;
SIGNAL \pulse|Add0~6_combout\ : std_logic;
SIGNAL \pulse|Add0~7\ : std_logic;
SIGNAL \pulse|Add0~8_combout\ : std_logic;
SIGNAL \pulse|Add0~9\ : std_logic;
SIGNAL \pulse|Add0~10_combout\ : std_logic;
SIGNAL \pulse|Add0~11\ : std_logic;
SIGNAL \pulse|Add0~12_combout\ : std_logic;
SIGNAL \pulse|Add0~13\ : std_logic;
SIGNAL \pulse|Add0~14_combout\ : std_logic;
SIGNAL \pulse|s_cnt~5_combout\ : std_logic;
SIGNAL \pulse|Add0~15\ : std_logic;
SIGNAL \pulse|Add0~16_combout\ : std_logic;
SIGNAL \pulse|Add0~17\ : std_logic;
SIGNAL \pulse|Add0~18_combout\ : std_logic;
SIGNAL \pulse|Add0~19\ : std_logic;
SIGNAL \pulse|Add0~20_combout\ : std_logic;
SIGNAL \pulse|Add0~21\ : std_logic;
SIGNAL \pulse|Add0~22_combout\ : std_logic;
SIGNAL \pulse|Add0~23\ : std_logic;
SIGNAL \pulse|Add0~24_combout\ : std_logic;
SIGNAL \pulse|s_cnt~4_combout\ : std_logic;
SIGNAL \pulse|Add0~25\ : std_logic;
SIGNAL \pulse|Add0~26_combout\ : std_logic;
SIGNAL \pulse|s_cnt~3_combout\ : std_logic;
SIGNAL \pulse|Add0~27\ : std_logic;
SIGNAL \pulse|Add0~28_combout\ : std_logic;
SIGNAL \pulse|s_cnt~2_combout\ : std_logic;
SIGNAL \pulse|Add0~29\ : std_logic;
SIGNAL \pulse|Add0~30_combout\ : std_logic;
SIGNAL \pulse|s_cnt~1_combout\ : std_logic;
SIGNAL \pulse|Add0~31\ : std_logic;
SIGNAL \pulse|Add0~32_combout\ : std_logic;
SIGNAL \pulse|Add0~33\ : std_logic;
SIGNAL \pulse|Add0~34_combout\ : std_logic;
SIGNAL \pulse|s_cnt~0_combout\ : std_logic;
SIGNAL \pulse|Add0~35\ : std_logic;
SIGNAL \pulse|Add0~36_combout\ : std_logic;
SIGNAL \pulse|Add0~37\ : std_logic;
SIGNAL \pulse|Add0~38_combout\ : std_logic;
SIGNAL \pulse|s_cnt~6_combout\ : std_logic;
SIGNAL \pulse|Add0~39\ : std_logic;
SIGNAL \pulse|Add0~40_combout\ : std_logic;
SIGNAL \pulse|s_cnt~7_combout\ : std_logic;
SIGNAL \pulse|Add0~41\ : std_logic;
SIGNAL \pulse|Add0~42_combout\ : std_logic;
SIGNAL \pulse|s_cnt~8_combout\ : std_logic;
SIGNAL \pulse|Add0~43\ : std_logic;
SIGNAL \pulse|Add0~44_combout\ : std_logic;
SIGNAL \pulse|s_cnt~9_combout\ : std_logic;
SIGNAL \pulse|Add0~45\ : std_logic;
SIGNAL \pulse|Add0~46_combout\ : std_logic;
SIGNAL \pulse|s_cnt~10_combout\ : std_logic;
SIGNAL \pulse|Equal0~6_combout\ : std_logic;
SIGNAL \pulse|Add0~47\ : std_logic;
SIGNAL \pulse|Add0~48_combout\ : std_logic;
SIGNAL \pulse|Add0~49\ : std_logic;
SIGNAL \pulse|Add0~50_combout\ : std_logic;
SIGNAL \pulse|s_cnt~11_combout\ : std_logic;
SIGNAL \pulse|Equal0~7_combout\ : std_logic;
SIGNAL \pulse|Equal0~5_combout\ : std_logic;
SIGNAL \pulse|Equal0~2_combout\ : std_logic;
SIGNAL \pulse|Equal0~0_combout\ : std_logic;
SIGNAL \pulse|Equal0~3_combout\ : std_logic;
SIGNAL \pulse|Equal0~1_combout\ : std_logic;
SIGNAL \pulse|Equal0~4_combout\ : std_logic;
SIGNAL \pulse|Equal0~8_combout\ : std_logic;
SIGNAL \pulse|pulse~q\ : std_logic;
SIGNAL \blink|s_counter[0]~24_combout\ : std_logic;
SIGNAL \blink|s_counter[21]~67\ : std_logic;
SIGNAL \blink|s_counter[22]~68_combout\ : std_logic;
SIGNAL \blink|s_counter[22]~69\ : std_logic;
SIGNAL \blink|s_counter[23]~70_combout\ : std_logic;
SIGNAL \blink|LessThan1~0_combout\ : std_logic;
SIGNAL \blink|LessThan0~0_combout\ : std_logic;
SIGNAL \blink|LessThan0~1_combout\ : std_logic;
SIGNAL \blink|LessThan1~2_combout\ : std_logic;
SIGNAL \blink|LessThan0~2_combout\ : std_logic;
SIGNAL \blink|LessThan0~3_combout\ : std_logic;
SIGNAL \blink|LessThan0~4_combout\ : std_logic;
SIGNAL \blink|LessThan0~5_combout\ : std_logic;
SIGNAL \blink|s_counter[0]~25\ : std_logic;
SIGNAL \blink|s_counter[1]~26_combout\ : std_logic;
SIGNAL \blink|s_counter[1]~27\ : std_logic;
SIGNAL \blink|s_counter[2]~28_combout\ : std_logic;
SIGNAL \blink|s_counter[2]~29\ : std_logic;
SIGNAL \blink|s_counter[3]~30_combout\ : std_logic;
SIGNAL \blink|s_counter[3]~31\ : std_logic;
SIGNAL \blink|s_counter[4]~32_combout\ : std_logic;
SIGNAL \blink|s_counter[4]~33\ : std_logic;
SIGNAL \blink|s_counter[5]~34_combout\ : std_logic;
SIGNAL \blink|s_counter[5]~35\ : std_logic;
SIGNAL \blink|s_counter[6]~36_combout\ : std_logic;
SIGNAL \blink|s_counter[6]~37\ : std_logic;
SIGNAL \blink|s_counter[7]~38_combout\ : std_logic;
SIGNAL \blink|s_counter[7]~39\ : std_logic;
SIGNAL \blink|s_counter[8]~40_combout\ : std_logic;
SIGNAL \blink|s_counter[8]~41\ : std_logic;
SIGNAL \blink|s_counter[9]~42_combout\ : std_logic;
SIGNAL \blink|s_counter[9]~43\ : std_logic;
SIGNAL \blink|s_counter[10]~44_combout\ : std_logic;
SIGNAL \blink|s_counter[10]~45\ : std_logic;
SIGNAL \blink|s_counter[11]~46_combout\ : std_logic;
SIGNAL \blink|s_counter[11]~47\ : std_logic;
SIGNAL \blink|s_counter[12]~48_combout\ : std_logic;
SIGNAL \blink|s_counter[12]~49\ : std_logic;
SIGNAL \blink|s_counter[13]~50_combout\ : std_logic;
SIGNAL \blink|s_counter[13]~51\ : std_logic;
SIGNAL \blink|s_counter[14]~52_combout\ : std_logic;
SIGNAL \blink|s_counter[14]~53\ : std_logic;
SIGNAL \blink|s_counter[15]~54_combout\ : std_logic;
SIGNAL \blink|s_counter[15]~55\ : std_logic;
SIGNAL \blink|s_counter[16]~56_combout\ : std_logic;
SIGNAL \blink|s_counter[16]~57\ : std_logic;
SIGNAL \blink|s_counter[17]~58_combout\ : std_logic;
SIGNAL \blink|s_counter[17]~59\ : std_logic;
SIGNAL \blink|s_counter[18]~60_combout\ : std_logic;
SIGNAL \blink|s_counter[18]~61\ : std_logic;
SIGNAL \blink|s_counter[19]~62_combout\ : std_logic;
SIGNAL \blink|s_counter[19]~63\ : std_logic;
SIGNAL \blink|s_counter[20]~64_combout\ : std_logic;
SIGNAL \blink|s_counter[20]~65\ : std_logic;
SIGNAL \blink|s_counter[21]~66_combout\ : std_logic;
SIGNAL \blink|LessThan1~1_combout\ : std_logic;
SIGNAL \blink|LessThan1~3_combout\ : std_logic;
SIGNAL \blink|LessThan1~4_combout\ : std_logic;
SIGNAL \blink|LessThan1~5_combout\ : std_logic;
SIGNAL \blink|LessThan1~6_combout\ : std_logic;
SIGNAL \reg4Bits|dataOut~0_combout\ : std_logic;
SIGNAL \counter|Equal0~0_combout\ : std_logic;
SIGNAL \counter|s_count~1_combout\ : std_logic;
SIGNAL \counter|s_count~0_combout\ : std_logic;
SIGNAL \counter|Equal0~1_combout\ : std_logic;
SIGNAL \counter|s_count~2_combout\ : std_logic;
SIGNAL \reg4Bits|dataOut~1_combout\ : std_logic;
SIGNAL \reg4Bits|dataOut~2_combout\ : std_logic;
SIGNAL \reg4Bits|dataOut~3_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~0_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~1_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~2_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~3_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~4_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~5_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~6_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~7_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~9_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~12_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~8_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~10_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~11_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[3]~13_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~14_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~15_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~16_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n~17_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[6]~18_combout\ : std_logic;
SIGNAL \bin7Seg1|decOut_n[6]~19_combout\ : std_logic;
SIGNAL \bin7Seg2|decOut_n[0]~0_combout\ : std_logic;
SIGNAL \blink|s_counter\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \pulse|s_cnt\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \reg4Bits|dataOut\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \counter|s_count\ : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
LEDG <= ww_LEDG;
HEX0 <= ww_HEX0;
HEX1 <= ww_HEX1;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg4Bits|dataOut\(0),
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg4Bits|dataOut\(1),
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg4Bits|dataOut\(2),
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg4Bits|dataOut\(3),
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7Seg1|decOut_n~1_combout\,
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
	i => \bin7Seg1|decOut_n~4_combout\,
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
	i => \bin7Seg1|decOut_n~6_combout\,
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
	i => \bin7Seg1|decOut_n[3]~13_combout\,
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
	i => \bin7Seg1|decOut_n~15_combout\,
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
	i => \bin7Seg1|decOut_n~17_combout\,
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
	i => \bin7Seg1|decOut_n[6]~19_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7Seg2|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[0]~input_o\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7Seg2|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7Seg2|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \bin7Seg2|decOut_n[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

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

-- Location: LCCOMB_X111_Y59_N22
\counter|s_count~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|s_count~3_combout\ = (!\counter|s_count\(0) & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter|s_count\(0),
	datad => \SW[0]~input_o\,
	combout => \counter|s_count~3_combout\);

-- Location: LCCOMB_X112_Y53_N6
\pulse|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~0_combout\ = \pulse|s_cnt\(0) $ (VCC)
-- \pulse|Add0~1\ = CARRY(\pulse|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(0),
	datad => VCC,
	combout => \pulse|Add0~0_combout\,
	cout => \pulse|Add0~1\);

-- Location: FF_X112_Y53_N7
\pulse|s_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(0));

-- Location: LCCOMB_X112_Y53_N8
\pulse|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~2_combout\ = (\pulse|s_cnt\(1) & (!\pulse|Add0~1\)) # (!\pulse|s_cnt\(1) & ((\pulse|Add0~1\) # (GND)))
-- \pulse|Add0~3\ = CARRY((!\pulse|Add0~1\) # (!\pulse|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(1),
	datad => VCC,
	cin => \pulse|Add0~1\,
	combout => \pulse|Add0~2_combout\,
	cout => \pulse|Add0~3\);

-- Location: FF_X112_Y53_N9
\pulse|s_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(1));

-- Location: LCCOMB_X112_Y53_N10
\pulse|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~4_combout\ = (\pulse|s_cnt\(2) & (\pulse|Add0~3\ $ (GND))) # (!\pulse|s_cnt\(2) & (!\pulse|Add0~3\ & VCC))
-- \pulse|Add0~5\ = CARRY((\pulse|s_cnt\(2) & !\pulse|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(2),
	datad => VCC,
	cin => \pulse|Add0~3\,
	combout => \pulse|Add0~4_combout\,
	cout => \pulse|Add0~5\);

-- Location: FF_X112_Y53_N11
\pulse|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(2));

-- Location: LCCOMB_X112_Y53_N12
\pulse|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~6_combout\ = (\pulse|s_cnt\(3) & (!\pulse|Add0~5\)) # (!\pulse|s_cnt\(3) & ((\pulse|Add0~5\) # (GND)))
-- \pulse|Add0~7\ = CARRY((!\pulse|Add0~5\) # (!\pulse|s_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(3),
	datad => VCC,
	cin => \pulse|Add0~5\,
	combout => \pulse|Add0~6_combout\,
	cout => \pulse|Add0~7\);

-- Location: FF_X112_Y53_N13
\pulse|s_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(3));

-- Location: LCCOMB_X112_Y53_N14
\pulse|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~8_combout\ = (\pulse|s_cnt\(4) & (\pulse|Add0~7\ $ (GND))) # (!\pulse|s_cnt\(4) & (!\pulse|Add0~7\ & VCC))
-- \pulse|Add0~9\ = CARRY((\pulse|s_cnt\(4) & !\pulse|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(4),
	datad => VCC,
	cin => \pulse|Add0~7\,
	combout => \pulse|Add0~8_combout\,
	cout => \pulse|Add0~9\);

-- Location: FF_X112_Y53_N15
\pulse|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(4));

-- Location: LCCOMB_X112_Y53_N16
\pulse|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~10_combout\ = (\pulse|s_cnt\(5) & (!\pulse|Add0~9\)) # (!\pulse|s_cnt\(5) & ((\pulse|Add0~9\) # (GND)))
-- \pulse|Add0~11\ = CARRY((!\pulse|Add0~9\) # (!\pulse|s_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(5),
	datad => VCC,
	cin => \pulse|Add0~9\,
	combout => \pulse|Add0~10_combout\,
	cout => \pulse|Add0~11\);

-- Location: FF_X112_Y53_N17
\pulse|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(5));

-- Location: LCCOMB_X112_Y53_N18
\pulse|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~12_combout\ = (\pulse|s_cnt\(6) & (\pulse|Add0~11\ $ (GND))) # (!\pulse|s_cnt\(6) & (!\pulse|Add0~11\ & VCC))
-- \pulse|Add0~13\ = CARRY((\pulse|s_cnt\(6) & !\pulse|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(6),
	datad => VCC,
	cin => \pulse|Add0~11\,
	combout => \pulse|Add0~12_combout\,
	cout => \pulse|Add0~13\);

-- Location: FF_X112_Y53_N19
\pulse|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(6));

-- Location: LCCOMB_X112_Y53_N20
\pulse|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~14_combout\ = (\pulse|s_cnt\(7) & (!\pulse|Add0~13\)) # (!\pulse|s_cnt\(7) & ((\pulse|Add0~13\) # (GND)))
-- \pulse|Add0~15\ = CARRY((!\pulse|Add0~13\) # (!\pulse|s_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(7),
	datad => VCC,
	cin => \pulse|Add0~13\,
	combout => \pulse|Add0~14_combout\,
	cout => \pulse|Add0~15\);

-- Location: LCCOMB_X112_Y53_N2
\pulse|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~5_combout\ = (\pulse|Add0~14_combout\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse|Add0~14_combout\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_cnt~5_combout\);

-- Location: FF_X112_Y53_N3
\pulse|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(7));

-- Location: LCCOMB_X112_Y53_N22
\pulse|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~16_combout\ = (\pulse|s_cnt\(8) & (\pulse|Add0~15\ $ (GND))) # (!\pulse|s_cnt\(8) & (!\pulse|Add0~15\ & VCC))
-- \pulse|Add0~17\ = CARRY((\pulse|s_cnt\(8) & !\pulse|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(8),
	datad => VCC,
	cin => \pulse|Add0~15\,
	combout => \pulse|Add0~16_combout\,
	cout => \pulse|Add0~17\);

-- Location: FF_X112_Y53_N23
\pulse|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(8));

-- Location: LCCOMB_X112_Y53_N24
\pulse|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~18_combout\ = (\pulse|s_cnt\(9) & (!\pulse|Add0~17\)) # (!\pulse|s_cnt\(9) & ((\pulse|Add0~17\) # (GND)))
-- \pulse|Add0~19\ = CARRY((!\pulse|Add0~17\) # (!\pulse|s_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(9),
	datad => VCC,
	cin => \pulse|Add0~17\,
	combout => \pulse|Add0~18_combout\,
	cout => \pulse|Add0~19\);

-- Location: FF_X112_Y53_N25
\pulse|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(9));

-- Location: LCCOMB_X112_Y53_N26
\pulse|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~20_combout\ = (\pulse|s_cnt\(10) & (\pulse|Add0~19\ $ (GND))) # (!\pulse|s_cnt\(10) & (!\pulse|Add0~19\ & VCC))
-- \pulse|Add0~21\ = CARRY((\pulse|s_cnt\(10) & !\pulse|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(10),
	datad => VCC,
	cin => \pulse|Add0~19\,
	combout => \pulse|Add0~20_combout\,
	cout => \pulse|Add0~21\);

-- Location: FF_X112_Y53_N27
\pulse|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(10));

-- Location: LCCOMB_X112_Y53_N28
\pulse|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~22_combout\ = (\pulse|s_cnt\(11) & (!\pulse|Add0~21\)) # (!\pulse|s_cnt\(11) & ((\pulse|Add0~21\) # (GND)))
-- \pulse|Add0~23\ = CARRY((!\pulse|Add0~21\) # (!\pulse|s_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(11),
	datad => VCC,
	cin => \pulse|Add0~21\,
	combout => \pulse|Add0~22_combout\,
	cout => \pulse|Add0~23\);

-- Location: FF_X112_Y53_N29
\pulse|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(11));

-- Location: LCCOMB_X112_Y53_N30
\pulse|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~24_combout\ = (\pulse|s_cnt\(12) & (\pulse|Add0~23\ $ (GND))) # (!\pulse|s_cnt\(12) & (!\pulse|Add0~23\ & VCC))
-- \pulse|Add0~25\ = CARRY((\pulse|s_cnt\(12) & !\pulse|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(12),
	datad => VCC,
	cin => \pulse|Add0~23\,
	combout => \pulse|Add0~24_combout\,
	cout => \pulse|Add0~25\);

-- Location: LCCOMB_X112_Y53_N0
\pulse|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~4_combout\ = (\pulse|Add0~24_combout\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Add0~24_combout\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_cnt~4_combout\);

-- Location: FF_X112_Y53_N1
\pulse|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(12));

-- Location: LCCOMB_X112_Y52_N0
\pulse|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~26_combout\ = (\pulse|s_cnt\(13) & (!\pulse|Add0~25\)) # (!\pulse|s_cnt\(13) & ((\pulse|Add0~25\) # (GND)))
-- \pulse|Add0~27\ = CARRY((!\pulse|Add0~25\) # (!\pulse|s_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(13),
	datad => VCC,
	cin => \pulse|Add0~25\,
	combout => \pulse|Add0~26_combout\,
	cout => \pulse|Add0~27\);

-- Location: LCCOMB_X111_Y52_N22
\pulse|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~3_combout\ = (\pulse|Add0~26_combout\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Add0~26_combout\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_cnt~3_combout\);

-- Location: FF_X111_Y52_N23
\pulse|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(13));

-- Location: LCCOMB_X112_Y52_N2
\pulse|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~28_combout\ = (\pulse|s_cnt\(14) & (\pulse|Add0~27\ $ (GND))) # (!\pulse|s_cnt\(14) & (!\pulse|Add0~27\ & VCC))
-- \pulse|Add0~29\ = CARRY((\pulse|s_cnt\(14) & !\pulse|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(14),
	datad => VCC,
	cin => \pulse|Add0~27\,
	combout => \pulse|Add0~28_combout\,
	cout => \pulse|Add0~29\);

-- Location: LCCOMB_X111_Y52_N10
\pulse|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~2_combout\ = (!\pulse|Equal0~8_combout\ & \pulse|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse|Equal0~8_combout\,
	datad => \pulse|Add0~28_combout\,
	combout => \pulse|s_cnt~2_combout\);

-- Location: FF_X111_Y52_N11
\pulse|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(14));

-- Location: LCCOMB_X112_Y52_N4
\pulse|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~30_combout\ = (\pulse|s_cnt\(15) & (!\pulse|Add0~29\)) # (!\pulse|s_cnt\(15) & ((\pulse|Add0~29\) # (GND)))
-- \pulse|Add0~31\ = CARRY((!\pulse|Add0~29\) # (!\pulse|s_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(15),
	datad => VCC,
	cin => \pulse|Add0~29\,
	combout => \pulse|Add0~30_combout\,
	cout => \pulse|Add0~31\);

-- Location: LCCOMB_X111_Y52_N28
\pulse|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~1_combout\ = (!\pulse|Equal0~8_combout\ & \pulse|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse|Equal0~8_combout\,
	datad => \pulse|Add0~30_combout\,
	combout => \pulse|s_cnt~1_combout\);

-- Location: FF_X111_Y52_N29
\pulse|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(15));

-- Location: LCCOMB_X112_Y52_N6
\pulse|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~32_combout\ = (\pulse|s_cnt\(16) & (\pulse|Add0~31\ $ (GND))) # (!\pulse|s_cnt\(16) & (!\pulse|Add0~31\ & VCC))
-- \pulse|Add0~33\ = CARRY((\pulse|s_cnt\(16) & !\pulse|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(16),
	datad => VCC,
	cin => \pulse|Add0~31\,
	combout => \pulse|Add0~32_combout\,
	cout => \pulse|Add0~33\);

-- Location: FF_X112_Y52_N7
\pulse|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(16));

-- Location: LCCOMB_X112_Y52_N8
\pulse|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~34_combout\ = (\pulse|s_cnt\(17) & (!\pulse|Add0~33\)) # (!\pulse|s_cnt\(17) & ((\pulse|Add0~33\) # (GND)))
-- \pulse|Add0~35\ = CARRY((!\pulse|Add0~33\) # (!\pulse|s_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(17),
	datad => VCC,
	cin => \pulse|Add0~33\,
	combout => \pulse|Add0~34_combout\,
	cout => \pulse|Add0~35\);

-- Location: LCCOMB_X111_Y52_N6
\pulse|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~0_combout\ = (\pulse|Add0~34_combout\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Add0~34_combout\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_cnt~0_combout\);

-- Location: FF_X111_Y52_N7
\pulse|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(17));

-- Location: LCCOMB_X112_Y52_N10
\pulse|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~36_combout\ = (\pulse|s_cnt\(18) & (\pulse|Add0~35\ $ (GND))) # (!\pulse|s_cnt\(18) & (!\pulse|Add0~35\ & VCC))
-- \pulse|Add0~37\ = CARRY((\pulse|s_cnt\(18) & !\pulse|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(18),
	datad => VCC,
	cin => \pulse|Add0~35\,
	combout => \pulse|Add0~36_combout\,
	cout => \pulse|Add0~37\);

-- Location: FF_X112_Y52_N11
\pulse|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(18));

-- Location: LCCOMB_X112_Y52_N12
\pulse|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~38_combout\ = (\pulse|s_cnt\(19) & (!\pulse|Add0~37\)) # (!\pulse|s_cnt\(19) & ((\pulse|Add0~37\) # (GND)))
-- \pulse|Add0~39\ = CARRY((!\pulse|Add0~37\) # (!\pulse|s_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(19),
	datad => VCC,
	cin => \pulse|Add0~37\,
	combout => \pulse|Add0~38_combout\,
	cout => \pulse|Add0~39\);

-- Location: LCCOMB_X112_Y52_N26
\pulse|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~6_combout\ = (!\pulse|Equal0~8_combout\ & \pulse|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Equal0~8_combout\,
	datad => \pulse|Add0~38_combout\,
	combout => \pulse|s_cnt~6_combout\);

-- Location: FF_X112_Y52_N27
\pulse|s_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(19));

-- Location: LCCOMB_X112_Y52_N14
\pulse|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~40_combout\ = (\pulse|s_cnt\(20) & (\pulse|Add0~39\ $ (GND))) # (!\pulse|s_cnt\(20) & (!\pulse|Add0~39\ & VCC))
-- \pulse|Add0~41\ = CARRY((\pulse|s_cnt\(20) & !\pulse|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(20),
	datad => VCC,
	cin => \pulse|Add0~39\,
	combout => \pulse|Add0~40_combout\,
	cout => \pulse|Add0~41\);

-- Location: LCCOMB_X111_Y52_N26
\pulse|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~7_combout\ = (\pulse|Add0~40_combout\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Add0~40_combout\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_cnt~7_combout\);

-- Location: FF_X111_Y52_N27
\pulse|s_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(20));

-- Location: LCCOMB_X112_Y52_N16
\pulse|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~42_combout\ = (\pulse|s_cnt\(21) & (!\pulse|Add0~41\)) # (!\pulse|s_cnt\(21) & ((\pulse|Add0~41\) # (GND)))
-- \pulse|Add0~43\ = CARRY((!\pulse|Add0~41\) # (!\pulse|s_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(21),
	datad => VCC,
	cin => \pulse|Add0~41\,
	combout => \pulse|Add0~42_combout\,
	cout => \pulse|Add0~43\);

-- Location: LCCOMB_X112_Y52_N28
\pulse|s_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~8_combout\ = (!\pulse|Equal0~8_combout\ & \pulse|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Equal0~8_combout\,
	datad => \pulse|Add0~42_combout\,
	combout => \pulse|s_cnt~8_combout\);

-- Location: FF_X112_Y52_N29
\pulse|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(21));

-- Location: LCCOMB_X112_Y52_N18
\pulse|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~44_combout\ = (\pulse|s_cnt\(22) & (\pulse|Add0~43\ $ (GND))) # (!\pulse|s_cnt\(22) & (!\pulse|Add0~43\ & VCC))
-- \pulse|Add0~45\ = CARRY((\pulse|s_cnt\(22) & !\pulse|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(22),
	datad => VCC,
	cin => \pulse|Add0~43\,
	combout => \pulse|Add0~44_combout\,
	cout => \pulse|Add0~45\);

-- Location: LCCOMB_X112_Y52_N30
\pulse|s_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~9_combout\ = (!\pulse|Equal0~8_combout\ & \pulse|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Equal0~8_combout\,
	datad => \pulse|Add0~44_combout\,
	combout => \pulse|s_cnt~9_combout\);

-- Location: FF_X112_Y52_N31
\pulse|s_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(22));

-- Location: LCCOMB_X112_Y52_N20
\pulse|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~46_combout\ = (\pulse|s_cnt\(23) & (!\pulse|Add0~45\)) # (!\pulse|s_cnt\(23) & ((\pulse|Add0~45\) # (GND)))
-- \pulse|Add0~47\ = CARRY((!\pulse|Add0~45\) # (!\pulse|s_cnt\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(23),
	datad => VCC,
	cin => \pulse|Add0~45\,
	combout => \pulse|Add0~46_combout\,
	cout => \pulse|Add0~47\);

-- Location: LCCOMB_X111_Y52_N8
\pulse|s_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~10_combout\ = (\pulse|Add0~46_combout\ & !\pulse|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|Add0~46_combout\,
	datad => \pulse|Equal0~8_combout\,
	combout => \pulse|s_cnt~10_combout\);

-- Location: FF_X111_Y52_N9
\pulse|s_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(23));

-- Location: LCCOMB_X111_Y52_N30
\pulse|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~6_combout\ = (\pulse|s_cnt\(21) & (\pulse|s_cnt\(23) & (\pulse|s_cnt\(20) & \pulse|s_cnt\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(21),
	datab => \pulse|s_cnt\(23),
	datac => \pulse|s_cnt\(20),
	datad => \pulse|s_cnt\(22),
	combout => \pulse|Equal0~6_combout\);

-- Location: LCCOMB_X112_Y52_N22
\pulse|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~48_combout\ = (\pulse|s_cnt\(24) & (\pulse|Add0~47\ $ (GND))) # (!\pulse|s_cnt\(24) & (!\pulse|Add0~47\ & VCC))
-- \pulse|Add0~49\ = CARRY((\pulse|s_cnt\(24) & !\pulse|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(24),
	datad => VCC,
	cin => \pulse|Add0~47\,
	combout => \pulse|Add0~48_combout\,
	cout => \pulse|Add0~49\);

-- Location: FF_X112_Y52_N23
\pulse|s_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(24));

-- Location: LCCOMB_X112_Y52_N24
\pulse|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Add0~50_combout\ = \pulse|Add0~49\ $ (\pulse|s_cnt\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \pulse|s_cnt\(25),
	cin => \pulse|Add0~49\,
	combout => \pulse|Add0~50_combout\);

-- Location: LCCOMB_X111_Y52_N20
\pulse|s_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt~11_combout\ = (!\pulse|Equal0~8_combout\ & \pulse|Add0~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse|Equal0~8_combout\,
	datad => \pulse|Add0~50_combout\,
	combout => \pulse|s_cnt~11_combout\);

-- Location: FF_X111_Y52_N21
\pulse|s_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(25));

-- Location: LCCOMB_X111_Y52_N14
\pulse|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~7_combout\ = (\pulse|s_cnt\(25) & !\pulse|s_cnt\(24))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \pulse|s_cnt\(25),
	datad => \pulse|s_cnt\(24),
	combout => \pulse|Equal0~7_combout\);

-- Location: LCCOMB_X111_Y52_N4
\pulse|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~5_combout\ = (\pulse|s_cnt\(19) & (\pulse|s_cnt\(1) & (!\pulse|s_cnt\(18) & \pulse|s_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(19),
	datab => \pulse|s_cnt\(1),
	datac => \pulse|s_cnt\(18),
	datad => \pulse|s_cnt\(0),
	combout => \pulse|Equal0~5_combout\);

-- Location: LCCOMB_X112_Y53_N4
\pulse|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~2_combout\ = (!\pulse|s_cnt\(8) & (!\pulse|s_cnt\(7) & (\pulse|s_cnt\(6) & !\pulse|s_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(8),
	datab => \pulse|s_cnt\(7),
	datac => \pulse|s_cnt\(6),
	datad => \pulse|s_cnt\(9),
	combout => \pulse|Equal0~2_combout\);

-- Location: LCCOMB_X111_Y52_N24
\pulse|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~0_combout\ = (\pulse|s_cnt\(14) & (\pulse|s_cnt\(15) & (\pulse|s_cnt\(17) & !\pulse|s_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(14),
	datab => \pulse|s_cnt\(15),
	datac => \pulse|s_cnt\(17),
	datad => \pulse|s_cnt\(16),
	combout => \pulse|Equal0~0_combout\);

-- Location: LCCOMB_X111_Y53_N20
\pulse|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~3_combout\ = (\pulse|s_cnt\(4) & (\pulse|s_cnt\(2) & (\pulse|s_cnt\(3) & \pulse|s_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(4),
	datab => \pulse|s_cnt\(2),
	datac => \pulse|s_cnt\(3),
	datad => \pulse|s_cnt\(5),
	combout => \pulse|Equal0~3_combout\);

-- Location: LCCOMB_X111_Y52_N12
\pulse|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~1_combout\ = (!\pulse|s_cnt\(11) & (\pulse|s_cnt\(13) & (!\pulse|s_cnt\(10) & \pulse|s_cnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(11),
	datab => \pulse|s_cnt\(13),
	datac => \pulse|s_cnt\(10),
	datad => \pulse|s_cnt\(12),
	combout => \pulse|Equal0~1_combout\);

-- Location: LCCOMB_X111_Y52_N18
\pulse|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~4_combout\ = (\pulse|Equal0~2_combout\ & (\pulse|Equal0~0_combout\ & (\pulse|Equal0~3_combout\ & \pulse|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|Equal0~2_combout\,
	datab => \pulse|Equal0~0_combout\,
	datac => \pulse|Equal0~3_combout\,
	datad => \pulse|Equal0~1_combout\,
	combout => \pulse|Equal0~4_combout\);

-- Location: LCCOMB_X111_Y52_N0
\pulse|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~8_combout\ = (\pulse|Equal0~6_combout\ & (\pulse|Equal0~7_combout\ & (\pulse|Equal0~5_combout\ & \pulse|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|Equal0~6_combout\,
	datab => \pulse|Equal0~7_combout\,
	datac => \pulse|Equal0~5_combout\,
	datad => \pulse|Equal0~4_combout\,
	combout => \pulse|Equal0~8_combout\);

-- Location: FF_X111_Y52_N1
\pulse|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|Equal0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|pulse~q\);

-- Location: FF_X111_Y59_N23
\counter|s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \counter|s_count~3_combout\,
	ena => \pulse|pulse~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|s_count\(0));

-- Location: LCCOMB_X113_Y60_N8
\blink|s_counter[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[0]~24_combout\ = \blink|s_counter\(0) $ (VCC)
-- \blink|s_counter[0]~25\ = CARRY(\blink|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(0),
	datad => VCC,
	combout => \blink|s_counter[0]~24_combout\,
	cout => \blink|s_counter[0]~25\);

-- Location: LCCOMB_X113_Y59_N18
\blink|s_counter[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[21]~66_combout\ = (\blink|s_counter\(21) & (!\blink|s_counter[20]~65\)) # (!\blink|s_counter\(21) & ((\blink|s_counter[20]~65\) # (GND)))
-- \blink|s_counter[21]~67\ = CARRY((!\blink|s_counter[20]~65\) # (!\blink|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(21),
	datad => VCC,
	cin => \blink|s_counter[20]~65\,
	combout => \blink|s_counter[21]~66_combout\,
	cout => \blink|s_counter[21]~67\);

-- Location: LCCOMB_X113_Y59_N20
\blink|s_counter[22]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[22]~68_combout\ = (\blink|s_counter\(22) & (\blink|s_counter[21]~67\ $ (GND))) # (!\blink|s_counter\(22) & (!\blink|s_counter[21]~67\ & VCC))
-- \blink|s_counter[22]~69\ = CARRY((\blink|s_counter\(22) & !\blink|s_counter[21]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(22),
	datad => VCC,
	cin => \blink|s_counter[21]~67\,
	combout => \blink|s_counter[22]~68_combout\,
	cout => \blink|s_counter[22]~69\);

-- Location: FF_X113_Y59_N21
\blink|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[22]~68_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(22));

-- Location: LCCOMB_X113_Y59_N22
\blink|s_counter[23]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[23]~70_combout\ = \blink|s_counter\(23) $ (\blink|s_counter[22]~69\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(23),
	cin => \blink|s_counter[22]~69\,
	combout => \blink|s_counter[23]~70_combout\);

-- Location: FF_X113_Y59_N23
\blink|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[23]~70_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(23));

-- Location: LCCOMB_X113_Y59_N24
\blink|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~0_combout\ = (\blink|s_counter\(18) & (\blink|s_counter\(20) & (\blink|s_counter\(19) & \blink|s_counter\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(18),
	datab => \blink|s_counter\(20),
	datac => \blink|s_counter\(19),
	datad => \blink|s_counter\(17),
	combout => \blink|LessThan1~0_combout\);

-- Location: LCCOMB_X112_Y59_N16
\blink|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan0~0_combout\ = (((!\blink|s_counter\(10)) # (!\blink|s_counter\(11))) # (!\blink|s_counter\(12))) # (!\blink|s_counter\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(13),
	datab => \blink|s_counter\(12),
	datac => \blink|s_counter\(11),
	datad => \blink|s_counter\(10),
	combout => \blink|LessThan0~0_combout\);

-- Location: LCCOMB_X113_Y60_N0
\blink|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan0~1_combout\ = (((!\blink|s_counter\(1)) # (!\blink|s_counter\(0))) # (!\blink|s_counter\(4))) # (!\blink|s_counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(2),
	datab => \blink|s_counter\(4),
	datac => \blink|s_counter\(0),
	datad => \blink|s_counter\(1),
	combout => \blink|LessThan0~1_combout\);

-- Location: LCCOMB_X113_Y60_N2
\blink|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~2_combout\ = (!\blink|s_counter\(8) & (!\blink|s_counter\(6) & (!\blink|s_counter\(7) & !\blink|s_counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(8),
	datab => \blink|s_counter\(6),
	datac => \blink|s_counter\(7),
	datad => \blink|s_counter\(5),
	combout => \blink|LessThan1~2_combout\);

-- Location: LCCOMB_X113_Y60_N6
\blink|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan0~2_combout\ = (!\blink|s_counter\(9) & (\blink|LessThan1~2_combout\ & ((\blink|LessThan0~1_combout\) # (!\blink|s_counter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(3),
	datab => \blink|LessThan0~1_combout\,
	datac => \blink|s_counter\(9),
	datad => \blink|LessThan1~2_combout\,
	combout => \blink|LessThan0~2_combout\);

-- Location: LCCOMB_X113_Y59_N26
\blink|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan0~3_combout\ = (\blink|s_counter\(15) & ((\blink|s_counter\(14)) # ((!\blink|LessThan0~0_combout\ & !\blink|LessThan0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(15),
	datab => \blink|s_counter\(14),
	datac => \blink|LessThan0~0_combout\,
	datad => \blink|LessThan0~2_combout\,
	combout => \blink|LessThan0~3_combout\);

-- Location: LCCOMB_X113_Y59_N28
\blink|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan0~4_combout\ = (((!\blink|LessThan0~3_combout\ & !\blink|s_counter\(16))) # (!\blink|LessThan1~0_combout\)) # (!\blink|s_counter\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(21),
	datab => \blink|LessThan1~0_combout\,
	datac => \blink|LessThan0~3_combout\,
	datad => \blink|s_counter\(16),
	combout => \blink|LessThan0~4_combout\);

-- Location: LCCOMB_X113_Y59_N30
\blink|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan0~5_combout\ = (\blink|s_counter\(23) & ((\blink|s_counter\(22)) # (!\blink|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(22),
	datac => \blink|s_counter\(23),
	datad => \blink|LessThan0~4_combout\,
	combout => \blink|LessThan0~5_combout\);

-- Location: FF_X113_Y60_N9
\blink|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[0]~24_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(0));

-- Location: LCCOMB_X113_Y60_N10
\blink|s_counter[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[1]~26_combout\ = (\blink|s_counter\(1) & (!\blink|s_counter[0]~25\)) # (!\blink|s_counter\(1) & ((\blink|s_counter[0]~25\) # (GND)))
-- \blink|s_counter[1]~27\ = CARRY((!\blink|s_counter[0]~25\) # (!\blink|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(1),
	datad => VCC,
	cin => \blink|s_counter[0]~25\,
	combout => \blink|s_counter[1]~26_combout\,
	cout => \blink|s_counter[1]~27\);

-- Location: FF_X113_Y60_N11
\blink|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[1]~26_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(1));

-- Location: LCCOMB_X113_Y60_N12
\blink|s_counter[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[2]~28_combout\ = (\blink|s_counter\(2) & (\blink|s_counter[1]~27\ $ (GND))) # (!\blink|s_counter\(2) & (!\blink|s_counter[1]~27\ & VCC))
-- \blink|s_counter[2]~29\ = CARRY((\blink|s_counter\(2) & !\blink|s_counter[1]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(2),
	datad => VCC,
	cin => \blink|s_counter[1]~27\,
	combout => \blink|s_counter[2]~28_combout\,
	cout => \blink|s_counter[2]~29\);

-- Location: FF_X113_Y60_N13
\blink|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[2]~28_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(2));

-- Location: LCCOMB_X113_Y60_N14
\blink|s_counter[3]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[3]~30_combout\ = (\blink|s_counter\(3) & (!\blink|s_counter[2]~29\)) # (!\blink|s_counter\(3) & ((\blink|s_counter[2]~29\) # (GND)))
-- \blink|s_counter[3]~31\ = CARRY((!\blink|s_counter[2]~29\) # (!\blink|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(3),
	datad => VCC,
	cin => \blink|s_counter[2]~29\,
	combout => \blink|s_counter[3]~30_combout\,
	cout => \blink|s_counter[3]~31\);

-- Location: FF_X113_Y60_N15
\blink|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[3]~30_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(3));

-- Location: LCCOMB_X113_Y60_N16
\blink|s_counter[4]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[4]~32_combout\ = (\blink|s_counter\(4) & (\blink|s_counter[3]~31\ $ (GND))) # (!\blink|s_counter\(4) & (!\blink|s_counter[3]~31\ & VCC))
-- \blink|s_counter[4]~33\ = CARRY((\blink|s_counter\(4) & !\blink|s_counter[3]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(4),
	datad => VCC,
	cin => \blink|s_counter[3]~31\,
	combout => \blink|s_counter[4]~32_combout\,
	cout => \blink|s_counter[4]~33\);

-- Location: FF_X113_Y60_N17
\blink|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[4]~32_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(4));

-- Location: LCCOMB_X113_Y60_N18
\blink|s_counter[5]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[5]~34_combout\ = (\blink|s_counter\(5) & (!\blink|s_counter[4]~33\)) # (!\blink|s_counter\(5) & ((\blink|s_counter[4]~33\) # (GND)))
-- \blink|s_counter[5]~35\ = CARRY((!\blink|s_counter[4]~33\) # (!\blink|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(5),
	datad => VCC,
	cin => \blink|s_counter[4]~33\,
	combout => \blink|s_counter[5]~34_combout\,
	cout => \blink|s_counter[5]~35\);

-- Location: FF_X113_Y60_N19
\blink|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[5]~34_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(5));

-- Location: LCCOMB_X113_Y60_N20
\blink|s_counter[6]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[6]~36_combout\ = (\blink|s_counter\(6) & (\blink|s_counter[5]~35\ $ (GND))) # (!\blink|s_counter\(6) & (!\blink|s_counter[5]~35\ & VCC))
-- \blink|s_counter[6]~37\ = CARRY((\blink|s_counter\(6) & !\blink|s_counter[5]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(6),
	datad => VCC,
	cin => \blink|s_counter[5]~35\,
	combout => \blink|s_counter[6]~36_combout\,
	cout => \blink|s_counter[6]~37\);

-- Location: FF_X113_Y60_N21
\blink|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[6]~36_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(6));

-- Location: LCCOMB_X113_Y60_N22
\blink|s_counter[7]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[7]~38_combout\ = (\blink|s_counter\(7) & (!\blink|s_counter[6]~37\)) # (!\blink|s_counter\(7) & ((\blink|s_counter[6]~37\) # (GND)))
-- \blink|s_counter[7]~39\ = CARRY((!\blink|s_counter[6]~37\) # (!\blink|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(7),
	datad => VCC,
	cin => \blink|s_counter[6]~37\,
	combout => \blink|s_counter[7]~38_combout\,
	cout => \blink|s_counter[7]~39\);

-- Location: FF_X113_Y60_N23
\blink|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[7]~38_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(7));

-- Location: LCCOMB_X113_Y60_N24
\blink|s_counter[8]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[8]~40_combout\ = (\blink|s_counter\(8) & (\blink|s_counter[7]~39\ $ (GND))) # (!\blink|s_counter\(8) & (!\blink|s_counter[7]~39\ & VCC))
-- \blink|s_counter[8]~41\ = CARRY((\blink|s_counter\(8) & !\blink|s_counter[7]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(8),
	datad => VCC,
	cin => \blink|s_counter[7]~39\,
	combout => \blink|s_counter[8]~40_combout\,
	cout => \blink|s_counter[8]~41\);

-- Location: FF_X113_Y60_N25
\blink|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[8]~40_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(8));

-- Location: LCCOMB_X113_Y60_N26
\blink|s_counter[9]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[9]~42_combout\ = (\blink|s_counter\(9) & (!\blink|s_counter[8]~41\)) # (!\blink|s_counter\(9) & ((\blink|s_counter[8]~41\) # (GND)))
-- \blink|s_counter[9]~43\ = CARRY((!\blink|s_counter[8]~41\) # (!\blink|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(9),
	datad => VCC,
	cin => \blink|s_counter[8]~41\,
	combout => \blink|s_counter[9]~42_combout\,
	cout => \blink|s_counter[9]~43\);

-- Location: FF_X113_Y60_N27
\blink|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[9]~42_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(9));

-- Location: LCCOMB_X113_Y60_N28
\blink|s_counter[10]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[10]~44_combout\ = (\blink|s_counter\(10) & (\blink|s_counter[9]~43\ $ (GND))) # (!\blink|s_counter\(10) & (!\blink|s_counter[9]~43\ & VCC))
-- \blink|s_counter[10]~45\ = CARRY((\blink|s_counter\(10) & !\blink|s_counter[9]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(10),
	datad => VCC,
	cin => \blink|s_counter[9]~43\,
	combout => \blink|s_counter[10]~44_combout\,
	cout => \blink|s_counter[10]~45\);

-- Location: FF_X113_Y60_N29
\blink|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[10]~44_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(10));

-- Location: LCCOMB_X113_Y60_N30
\blink|s_counter[11]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[11]~46_combout\ = (\blink|s_counter\(11) & (!\blink|s_counter[10]~45\)) # (!\blink|s_counter\(11) & ((\blink|s_counter[10]~45\) # (GND)))
-- \blink|s_counter[11]~47\ = CARRY((!\blink|s_counter[10]~45\) # (!\blink|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(11),
	datad => VCC,
	cin => \blink|s_counter[10]~45\,
	combout => \blink|s_counter[11]~46_combout\,
	cout => \blink|s_counter[11]~47\);

-- Location: FF_X113_Y60_N31
\blink|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[11]~46_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(11));

-- Location: LCCOMB_X113_Y59_N0
\blink|s_counter[12]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[12]~48_combout\ = (\blink|s_counter\(12) & (\blink|s_counter[11]~47\ $ (GND))) # (!\blink|s_counter\(12) & (!\blink|s_counter[11]~47\ & VCC))
-- \blink|s_counter[12]~49\ = CARRY((\blink|s_counter\(12) & !\blink|s_counter[11]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(12),
	datad => VCC,
	cin => \blink|s_counter[11]~47\,
	combout => \blink|s_counter[12]~48_combout\,
	cout => \blink|s_counter[12]~49\);

-- Location: FF_X113_Y59_N1
\blink|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[12]~48_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(12));

-- Location: LCCOMB_X113_Y59_N2
\blink|s_counter[13]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[13]~50_combout\ = (\blink|s_counter\(13) & (!\blink|s_counter[12]~49\)) # (!\blink|s_counter\(13) & ((\blink|s_counter[12]~49\) # (GND)))
-- \blink|s_counter[13]~51\ = CARRY((!\blink|s_counter[12]~49\) # (!\blink|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(13),
	datad => VCC,
	cin => \blink|s_counter[12]~49\,
	combout => \blink|s_counter[13]~50_combout\,
	cout => \blink|s_counter[13]~51\);

-- Location: FF_X113_Y59_N3
\blink|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[13]~50_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(13));

-- Location: LCCOMB_X113_Y59_N4
\blink|s_counter[14]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[14]~52_combout\ = (\blink|s_counter\(14) & (\blink|s_counter[13]~51\ $ (GND))) # (!\blink|s_counter\(14) & (!\blink|s_counter[13]~51\ & VCC))
-- \blink|s_counter[14]~53\ = CARRY((\blink|s_counter\(14) & !\blink|s_counter[13]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(14),
	datad => VCC,
	cin => \blink|s_counter[13]~51\,
	combout => \blink|s_counter[14]~52_combout\,
	cout => \blink|s_counter[14]~53\);

-- Location: FF_X113_Y59_N5
\blink|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[14]~52_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(14));

-- Location: LCCOMB_X113_Y59_N6
\blink|s_counter[15]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[15]~54_combout\ = (\blink|s_counter\(15) & (!\blink|s_counter[14]~53\)) # (!\blink|s_counter\(15) & ((\blink|s_counter[14]~53\) # (GND)))
-- \blink|s_counter[15]~55\ = CARRY((!\blink|s_counter[14]~53\) # (!\blink|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(15),
	datad => VCC,
	cin => \blink|s_counter[14]~53\,
	combout => \blink|s_counter[15]~54_combout\,
	cout => \blink|s_counter[15]~55\);

-- Location: FF_X113_Y59_N7
\blink|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[15]~54_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(15));

-- Location: LCCOMB_X113_Y59_N8
\blink|s_counter[16]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[16]~56_combout\ = (\blink|s_counter\(16) & (\blink|s_counter[15]~55\ $ (GND))) # (!\blink|s_counter\(16) & (!\blink|s_counter[15]~55\ & VCC))
-- \blink|s_counter[16]~57\ = CARRY((\blink|s_counter\(16) & !\blink|s_counter[15]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(16),
	datad => VCC,
	cin => \blink|s_counter[15]~55\,
	combout => \blink|s_counter[16]~56_combout\,
	cout => \blink|s_counter[16]~57\);

-- Location: FF_X113_Y59_N9
\blink|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[16]~56_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(16));

-- Location: LCCOMB_X113_Y59_N10
\blink|s_counter[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[17]~58_combout\ = (\blink|s_counter\(17) & (!\blink|s_counter[16]~57\)) # (!\blink|s_counter\(17) & ((\blink|s_counter[16]~57\) # (GND)))
-- \blink|s_counter[17]~59\ = CARRY((!\blink|s_counter[16]~57\) # (!\blink|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(17),
	datad => VCC,
	cin => \blink|s_counter[16]~57\,
	combout => \blink|s_counter[17]~58_combout\,
	cout => \blink|s_counter[17]~59\);

-- Location: FF_X113_Y59_N11
\blink|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[17]~58_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(17));

-- Location: LCCOMB_X113_Y59_N12
\blink|s_counter[18]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[18]~60_combout\ = (\blink|s_counter\(18) & (\blink|s_counter[17]~59\ $ (GND))) # (!\blink|s_counter\(18) & (!\blink|s_counter[17]~59\ & VCC))
-- \blink|s_counter[18]~61\ = CARRY((\blink|s_counter\(18) & !\blink|s_counter[17]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(18),
	datad => VCC,
	cin => \blink|s_counter[17]~59\,
	combout => \blink|s_counter[18]~60_combout\,
	cout => \blink|s_counter[18]~61\);

-- Location: FF_X113_Y59_N13
\blink|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[18]~60_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(18));

-- Location: LCCOMB_X113_Y59_N14
\blink|s_counter[19]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[19]~62_combout\ = (\blink|s_counter\(19) & (!\blink|s_counter[18]~61\)) # (!\blink|s_counter\(19) & ((\blink|s_counter[18]~61\) # (GND)))
-- \blink|s_counter[19]~63\ = CARRY((!\blink|s_counter[18]~61\) # (!\blink|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(19),
	datad => VCC,
	cin => \blink|s_counter[18]~61\,
	combout => \blink|s_counter[19]~62_combout\,
	cout => \blink|s_counter[19]~63\);

-- Location: FF_X113_Y59_N15
\blink|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[19]~62_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(19));

-- Location: LCCOMB_X113_Y59_N16
\blink|s_counter[20]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|s_counter[20]~64_combout\ = (\blink|s_counter\(20) & (\blink|s_counter[19]~63\ $ (GND))) # (!\blink|s_counter\(20) & (!\blink|s_counter[19]~63\ & VCC))
-- \blink|s_counter[20]~65\ = CARRY((\blink|s_counter\(20) & !\blink|s_counter[19]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(20),
	datad => VCC,
	cin => \blink|s_counter[19]~63\,
	combout => \blink|s_counter[20]~64_combout\,
	cout => \blink|s_counter[20]~65\);

-- Location: FF_X113_Y59_N17
\blink|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[20]~64_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(20));

-- Location: FF_X113_Y59_N19
\blink|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \blink|s_counter[21]~66_combout\,
	sclr => \blink|LessThan0~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \blink|s_counter\(21));

-- Location: LCCOMB_X113_Y60_N4
\blink|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~1_combout\ = (((!\blink|s_counter\(12)) # (!\blink|s_counter\(11))) # (!\blink|s_counter\(10))) # (!\blink|s_counter\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(9),
	datab => \blink|s_counter\(10),
	datac => \blink|s_counter\(11),
	datad => \blink|s_counter\(12),
	combout => \blink|LessThan1~1_combout\);

-- Location: LCCOMB_X112_Y59_N28
\blink|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~3_combout\ = (\blink|LessThan1~1_combout\) # ((!\blink|s_counter\(4) & \blink|LessThan1~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \blink|s_counter\(4),
	datac => \blink|LessThan1~2_combout\,
	datad => \blink|LessThan1~1_combout\,
	combout => \blink|LessThan1~3_combout\);

-- Location: LCCOMB_X112_Y59_N6
\blink|LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~4_combout\ = (\blink|s_counter\(14) & ((\blink|s_counter\(13)) # (!\blink|LessThan1~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(14),
	datac => \blink|s_counter\(13),
	datad => \blink|LessThan1~3_combout\,
	combout => \blink|LessThan1~4_combout\);

-- Location: LCCOMB_X111_Y59_N18
\blink|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~5_combout\ = (\blink|LessThan1~0_combout\ & (\blink|s_counter\(16) & ((\blink|s_counter\(15)) # (\blink|LessThan1~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|LessThan1~0_combout\,
	datab => \blink|s_counter\(15),
	datac => \blink|s_counter\(16),
	datad => \blink|LessThan1~4_combout\,
	combout => \blink|LessThan1~5_combout\);

-- Location: LCCOMB_X111_Y59_N12
\blink|LessThan1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \blink|LessThan1~6_combout\ = (!\blink|s_counter\(23) & (((!\blink|s_counter\(21) & !\blink|LessThan1~5_combout\)) # (!\blink|s_counter\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \blink|s_counter\(21),
	datab => \blink|s_counter\(23),
	datac => \blink|s_counter\(22),
	datad => \blink|LessThan1~5_combout\,
	combout => \blink|LessThan1~6_combout\);

-- Location: LCCOMB_X111_Y59_N0
\reg4Bits|dataOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg4Bits|dataOut~0_combout\ = (\counter|s_count\(0) & \blink|LessThan1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter|s_count\(0),
	datad => \blink|LessThan1~6_combout\,
	combout => \reg4Bits|dataOut~0_combout\);

-- Location: FF_X111_Y59_N1
\reg4Bits|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \reg4Bits|dataOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg4Bits|dataOut\(0));

-- Location: LCCOMB_X111_Y59_N26
\counter|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|Equal0~0_combout\ = (\counter|s_count\(1) & \counter|s_count\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \counter|s_count\(1),
	datac => \counter|s_count\(0),
	combout => \counter|Equal0~0_combout\);

-- Location: LCCOMB_X111_Y59_N30
\counter|s_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|s_count~1_combout\ = (!\counter|Equal0~1_combout\ & (!\SW[0]~input_o\ & (\counter|Equal0~0_combout\ $ (\counter|s_count\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|Equal0~0_combout\,
	datab => \counter|Equal0~1_combout\,
	datac => \counter|s_count\(2),
	datad => \SW[0]~input_o\,
	combout => \counter|s_count~1_combout\);

-- Location: FF_X111_Y59_N31
\counter|s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \counter|s_count~1_combout\,
	ena => \pulse|pulse~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|s_count\(2));

-- Location: LCCOMB_X111_Y59_N8
\counter|s_count~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|s_count~0_combout\ = (!\SW[0]~input_o\ & ((\counter|Equal0~0_combout\ & (\counter|s_count\(2) & !\counter|s_count\(3))) # (!\counter|Equal0~0_combout\ & ((\counter|s_count\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|Equal0~0_combout\,
	datab => \counter|s_count\(2),
	datac => \counter|s_count\(3),
	datad => \SW[0]~input_o\,
	combout => \counter|s_count~0_combout\);

-- Location: FF_X111_Y59_N9
\counter|s_count[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \counter|s_count~0_combout\,
	ena => \pulse|pulse~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|s_count\(3));

-- Location: LCCOMB_X111_Y59_N24
\counter|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|Equal0~1_combout\ = (!\counter|s_count\(2) & (\counter|s_count\(1) & (\counter|s_count\(0) & \counter|s_count\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|s_count\(2),
	datab => \counter|s_count\(1),
	datac => \counter|s_count\(0),
	datad => \counter|s_count\(3),
	combout => \counter|Equal0~1_combout\);

-- Location: LCCOMB_X111_Y59_N4
\counter|s_count~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \counter|s_count~2_combout\ = (!\counter|Equal0~1_combout\ & (!\SW[0]~input_o\ & (\counter|s_count\(0) $ (\counter|s_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|s_count\(0),
	datab => \counter|Equal0~1_combout\,
	datac => \counter|s_count\(1),
	datad => \SW[0]~input_o\,
	combout => \counter|s_count~2_combout\);

-- Location: FF_X111_Y59_N5
\counter|s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \counter|s_count~2_combout\,
	ena => \pulse|pulse~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \counter|s_count\(1));

-- Location: LCCOMB_X111_Y59_N10
\reg4Bits|dataOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg4Bits|dataOut~1_combout\ = (\counter|s_count\(1) & \blink|LessThan1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter|s_count\(1),
	datad => \blink|LessThan1~6_combout\,
	combout => \reg4Bits|dataOut~1_combout\);

-- Location: FF_X111_Y59_N11
\reg4Bits|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \reg4Bits|dataOut~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg4Bits|dataOut\(1));

-- Location: LCCOMB_X111_Y59_N28
\reg4Bits|dataOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg4Bits|dataOut~2_combout\ = (\counter|s_count\(2) & \blink|LessThan1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter|s_count\(2),
	datad => \blink|LessThan1~6_combout\,
	combout => \reg4Bits|dataOut~2_combout\);

-- Location: FF_X111_Y59_N29
\reg4Bits|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \reg4Bits|dataOut~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg4Bits|dataOut\(2));

-- Location: LCCOMB_X111_Y59_N2
\reg4Bits|dataOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \reg4Bits|dataOut~3_combout\ = (\counter|s_count\(3) & \blink|LessThan1~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \counter|s_count\(3),
	datad => \blink|LessThan1~6_combout\,
	combout => \reg4Bits|dataOut~3_combout\);

-- Location: FF_X111_Y59_N3
\reg4Bits|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \reg4Bits|dataOut~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg4Bits|dataOut\(3));

-- Location: LCCOMB_X110_Y62_N6
\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \counter|s_count\(1) $ (VCC)
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\counter|s_count\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|s_count\(1),
	datad => VCC,
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X110_Y62_N8
\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\counter|s_count\(2) & (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\counter|s_count\(2) & 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\counter|s_count\(2) & !\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \counter|s_count\(2),
	datad => VCC,
	cin => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X110_Y62_N10
\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\counter|s_count\(3) & (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\counter|s_count\(3) & 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\counter|s_count\(3) & !\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \counter|s_count\(3),
	datad => VCC,
	cin => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X110_Y62_N12
\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X110_Y62_N14
\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\counter|s_count\(1)))) # 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \counter|s_count\(1),
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\);

-- Location: LCCOMB_X110_Y62_N24
\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\counter|s_count\(3)))) # 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datac => \counter|s_count\(3),
	datad => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\);

-- Location: LCCOMB_X110_Y62_N16
\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\counter|s_count\(2)))) # 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \counter|s_count\(2),
	combout => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\);

-- Location: LCCOMB_X111_Y62_N20
\bin7Seg1|decOut_n~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~0_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\counter|s_count\(0) & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ 
-- (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))) # (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & 
-- (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ $ (\counter|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n~0_combout\);

-- Location: LCCOMB_X111_Y62_N26
\bin7Seg1|decOut_n~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~1_combout\ = (\SW[0]~input_o\) # (\bin7Seg1|decOut_n~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \bin7Seg1|decOut_n~0_combout\,
	combout => \bin7Seg1|decOut_n~1_combout\);

-- Location: LCCOMB_X111_Y62_N12
\bin7Seg1|decOut_n~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~2_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & ((\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\) # 
-- (!\counter|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n~2_combout\);

-- Location: LCCOMB_X111_Y62_N2
\bin7Seg1|decOut_n~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~3_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- \counter|s_count\(0)))) # (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ 
-- (\counter|s_count\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n~3_combout\);

-- Location: LCCOMB_X111_Y62_N8
\bin7Seg1|decOut_n~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~4_combout\ = (\bin7Seg1|decOut_n~2_combout\) # ((\SW[0]~input_o\) # (\bin7Seg1|decOut_n~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n~2_combout\,
	datac => \SW[0]~input_o\,
	datad => \bin7Seg1|decOut_n~3_combout\,
	combout => \bin7Seg1|decOut_n~4_combout\);

-- Location: LCCOMB_X111_Y62_N18
\bin7Seg1|decOut_n~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~5_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- !\counter|s_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n~5_combout\);

-- Location: LCCOMB_X111_Y62_N4
\bin7Seg1|decOut_n~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~6_combout\ = (\bin7Seg1|decOut_n~2_combout\) # ((\SW[0]~input_o\) # (\bin7Seg1|decOut_n~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n~2_combout\,
	datac => \SW[0]~input_o\,
	datad => \bin7Seg1|decOut_n~5_combout\,
	combout => \bin7Seg1|decOut_n~6_combout\);

-- Location: LCCOMB_X111_Y62_N14
\bin7Seg1|decOut_n[3]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~7_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- \counter|s_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n[3]~7_combout\);

-- Location: LCCOMB_X111_Y62_N10
\bin7Seg1|decOut_n[3]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~9_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- \counter|s_count\(0)))) # (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- !\counter|s_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n[3]~9_combout\);

-- Location: LCCOMB_X112_Y62_N18
\bin7Seg1|decOut_n[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~12_combout\ = (\bin7Seg1|decOut_n[3]~9_combout\ & !\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n[3]~9_combout\,
	datac => \SW[0]~input_o\,
	combout => \bin7Seg1|decOut_n[3]~12_combout\);

-- Location: LCCOMB_X111_Y62_N16
\bin7Seg1|decOut_n[3]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~8_combout\ = (!\counter|s_count\(0) & ((\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & 
-- !\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)) # (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n[3]~8_combout\);

-- Location: LCCOMB_X111_Y62_N24
\bin7Seg1|decOut_n[3]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~10_combout\ = (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\counter|s_count\(0) & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ $ 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n[3]~10_combout\);

-- Location: LCCOMB_X112_Y62_N28
\bin7Seg1|decOut_n[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~11_combout\ = (!\bin7Seg1|decOut_n[3]~9_combout\ & (!\bin7Seg1|decOut_n[3]~10_combout\ & !\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n[3]~9_combout\,
	datab => \bin7Seg1|decOut_n[3]~10_combout\,
	datac => \SW[0]~input_o\,
	combout => \bin7Seg1|decOut_n[3]~11_combout\);

-- Location: LCCOMB_X112_Y62_N20
\bin7Seg1|decOut_n[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[3]~13_combout\ = (\bin7Seg1|decOut_n[3]~7_combout\ & (((\bin7Seg1|decOut_n[3]~8_combout\) # (!\bin7Seg1|decOut_n[3]~11_combout\)))) # (!\bin7Seg1|decOut_n[3]~7_combout\ & (!\bin7Seg1|decOut_n[3]~12_combout\ & 
-- ((\bin7Seg1|decOut_n[3]~8_combout\) # (!\bin7Seg1|decOut_n[3]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n[3]~7_combout\,
	datab => \bin7Seg1|decOut_n[3]~12_combout\,
	datac => \bin7Seg1|decOut_n[3]~8_combout\,
	datad => \bin7Seg1|decOut_n[3]~11_combout\,
	combout => \bin7Seg1|decOut_n[3]~13_combout\);

-- Location: LCCOMB_X111_Y62_N22
\bin7Seg1|decOut_n~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~14_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & ((\counter|s_count\(0))))) # 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & ((\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\)) # 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & ((\counter|s_count\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n~14_combout\);

-- Location: LCCOMB_X111_Y62_N28
\bin7Seg1|decOut_n~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~15_combout\ = (\bin7Seg1|decOut_n~14_combout\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n~14_combout\,
	datac => \SW[0]~input_o\,
	combout => \bin7Seg1|decOut_n~15_combout\);

-- Location: LCCOMB_X111_Y62_N30
\bin7Seg1|decOut_n~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~16_combout\ = (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & ((\counter|s_count\(0)) # 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\)))) # (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\counter|s_count\(0) & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ $ 
-- (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n~16_combout\);

-- Location: LCCOMB_X111_Y62_N0
\bin7Seg1|decOut_n~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n~17_combout\ = (\SW[0]~input_o\) # (\bin7Seg1|decOut_n~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datac => \bin7Seg1|decOut_n~16_combout\,
	combout => \bin7Seg1|decOut_n~17_combout\);

-- Location: LCCOMB_X111_Y62_N6
\bin7Seg1|decOut_n[6]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[6]~18_combout\ = (!\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ & (\bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\ & 
-- !\counter|s_count\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[13]~1_combout\,
	datab => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\,
	datac => \bin2BCD|Mod0|auto_generated|divider|divider|StageOut[14]~2_combout\,
	datad => \counter|s_count\(0),
	combout => \bin7Seg1|decOut_n[6]~18_combout\);

-- Location: LCCOMB_X112_Y62_N10
\bin7Seg1|decOut_n[6]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg1|decOut_n[6]~19_combout\ = (\bin7Seg1|decOut_n[3]~7_combout\ & (!\bin7Seg1|decOut_n[3]~12_combout\ & ((\bin7Seg1|decOut_n[6]~18_combout\) # (!\bin7Seg1|decOut_n[3]~11_combout\)))) # (!\bin7Seg1|decOut_n[3]~7_combout\ & 
-- (((\bin7Seg1|decOut_n[6]~18_combout\) # (!\bin7Seg1|decOut_n[3]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bin7Seg1|decOut_n[3]~7_combout\,
	datab => \bin7Seg1|decOut_n[3]~12_combout\,
	datac => \bin7Seg1|decOut_n[6]~18_combout\,
	datad => \bin7Seg1|decOut_n[3]~11_combout\,
	combout => \bin7Seg1|decOut_n[6]~19_combout\);

-- Location: LCCOMB_X111_Y59_N20
\bin7Seg2|decOut_n[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \bin7Seg2|decOut_n[0]~0_combout\ = (\SW[0]~input_o\) # ((\counter|s_count\(3) & ((\counter|s_count\(2)) # (\counter|s_count\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \counter|s_count\(2),
	datab => \counter|s_count\(3),
	datac => \counter|s_count\(1),
	datad => \SW[0]~input_o\,
	combout => \bin7Seg2|decOut_n[0]~0_combout\);

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;
END structure;


