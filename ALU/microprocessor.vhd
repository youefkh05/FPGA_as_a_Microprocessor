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
-- CREATED		"Sun Jul 16 12:01:20 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY microprocessor IS 
	PORT
	(
		Selctor :  IN  STD_LOGIC;
		NUM1 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		NUM2 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		S :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Y :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END microprocessor;

ARCHITECTURE bdf_type OF microprocessor IS 

COMPONENT logic_alu
	PORT(N1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 N2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT arthemtic_alu_signed
	PORT(NUM1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 NUM2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT selector_mux
	PORT(S : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 



b2v_inst : logic_alu
PORT MAP(N1 => NUM1,
		 N2 => NUM2,
		 S => S,
		 Y => SYNTHESIZED_WIRE_1);


b2v_inst1 : arthemtic_alu_signed
PORT MAP(NUM1 => NUM1,
		 NUM2 => NUM2,
		 S => S,
		 Y => SYNTHESIZED_WIRE_0);


b2v_inst2 : selector_mux
PORT MAP(S => Selctor,
		 A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_1,
		 Y => Y);


END bdf_type;