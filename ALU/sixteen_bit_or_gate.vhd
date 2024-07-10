library ieee;
use ieee.std_logic_1164.all;

entity sixteen_bit_or_gate is
    port (
        A : in  std_logic_vector(15 downto 0);
        B : in  std_logic_vector(15 downto 0);
        Y : out std_logic_vector(15 downto 0)
    );
end entity sixteen_bit_or_gate;

architecture behavioral of sixteen_bit_or_gate is
begin
    Y <= A or B;
end architecture behavioral;
