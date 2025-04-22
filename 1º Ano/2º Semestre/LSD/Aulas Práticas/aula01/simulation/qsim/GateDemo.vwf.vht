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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/15/2024 15:00:34"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Gatedemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Gatedemo_vhd_vec_tst IS
END Gatedemo_vhd_vec_tst;
ARCHITECTURE Gatedemo_arch OF Gatedemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL pin_name3 : STD_LOGIC;
COMPONENT Gatedemo
	PORT (
	A : IN STD_LOGIC;
	B : IN STD_LOGIC;
	pin_name3 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Gatedemo
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	pin_name3 => pin_name3
	);

-- A
t_prcs_A: PROCESS
BEGIN
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 15000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 15000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 25000 ps;
	A <= '1';
	WAIT FOR 15000 ps;
	A <= '0';
	WAIT FOR 20000 ps;
	A <= '1';
	WAIT FOR 15000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 20000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 45000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 15000 ps;
	A <= '0';
	WAIT FOR 30000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 25000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 25000 ps;
	A <= '1';
	WAIT FOR 20000 ps;
	A <= '0';
	WAIT FOR 25000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 15000 ps;
	A <= '1';
	WAIT FOR 20000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 15000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 20000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 10000 ps;
	A <= '0';
	WAIT FOR 10000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
	WAIT FOR 5000 ps;
	A <= '1';
	WAIT FOR 5000 ps;
	A <= '0';
WAIT;
END PROCESS t_prcs_A;

-- B
t_prcs_B: PROCESS
BEGIN
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 25000 ps;
	B <= '1';
	WAIT FOR 35000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 20000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 15000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 15000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
	WAIT FOR 15000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 20000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 25000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 20000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 20000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 10000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 5000 ps;
	B <= '0';
	WAIT FOR 10000 ps;
	B <= '1';
	WAIT FOR 40000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
	WAIT FOR 5000 ps;
	B <= '1';
	WAIT FOR 15000 ps;
	B <= '0';
WAIT;
END PROCESS t_prcs_B;
END Gatedemo_arch;
