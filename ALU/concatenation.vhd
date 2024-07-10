LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity concatenation is
	port
	(
	I1 	: in STD_LOGIC_VECTOR (15 DOWNTO 0);
	I2 	: in STD_LOGIC_VECTOR (15 DOWNTO 0);
	O1	: out STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
end concatenation;

ARCHITECTURE SYN OF concatenation IS
begin
O1 <= I1 & I2;
end SYN;