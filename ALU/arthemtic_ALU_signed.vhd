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
-- CREATED		"Thu Jul 13 23:08:26 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY arthemtic_ALU_signed IS 
	PORT
	(
		NUM1 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		NUM2 :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		S :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		Y :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END arthemtic_ALU_signed;

ARCHITECTURE bdf_type OF arthemtic_ALU_signed IS 

COMPONENT sixteen_bit_divider_signed_o1
	PORT(denom : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 numer : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 O1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sixteen_bit_subtractor_signed
	PORT(dataa : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sixteen_bit_multi_signed
	PORT(dataa : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT sixteen_bit_adder_signed
	PORT(dataa : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 datab : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT arithmetic_mux_signed
	PORT(A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 C : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 S : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN 



b2v_inst : sixteen_bit_divider_signed_o1
PORT MAP(denom => NUM1,
		 numer => NUM2,
		 O1 => SYNTHESIZED_WIRE_2);


b2v_inst1 : sixteen_bit_subtractor_signed
PORT MAP(dataa => NUM1,
		 datab => NUM2,
		 result => SYNTHESIZED_WIRE_1);


b2v_inst3 : sixteen_bit_multi_signed
PORT MAP(dataa => NUM1,
		 datab => NUM2,
		 result => SYNTHESIZED_WIRE_3);


b2v_inst8 : sixteen_bit_adder_signed
PORT MAP(dataa => NUM1,
		 datab => NUM2,
		 result => SYNTHESIZED_WIRE_0);


b2v_inst9 : arithmetic_mux_signed
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_1,
		 C => SYNTHESIZED_WIRE_2,
		 D => SYNTHESIZED_WIRE_3,
		 S => S,
		 Y => Y);


END bdf_type;