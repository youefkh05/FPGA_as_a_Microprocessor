-- Copyright (C) 2021  Intel Corporation. All rights reserved.
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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"
-- CREATED		"Thu Jul 13 23:07:18 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY sixteen_bit_divider_signed_O1 IS 
	PORT
	(
		denom :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		numer :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		O1 :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END sixteen_bit_divider_signed_O1;

ARCHITECTURE bdf_type OF sixteen_bit_divider_signed_O1 IS 

COMPONENT sixteen_bit_divider_signed
	PORT(denom : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 numer : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 quotient : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 remain : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT concatenation
	PORT(I1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 I2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 O1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst : sixteen_bit_divider_signed
PORT MAP(denom => denom,
		 numer => numer,
		 quotient => SYNTHESIZED_WIRE_0,
		 remain => SYNTHESIZED_WIRE_1);


b2v_inst1 : concatenation
PORT MAP(I1 => SYNTHESIZED_WIRE_0,
		 I2 => SYNTHESIZED_WIRE_1,
		 O1 => O1);


END bdf_type;