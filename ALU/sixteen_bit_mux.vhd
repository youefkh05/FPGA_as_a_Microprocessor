library ieee;
use ieee.std_logic_1164.all;

entity sixteen_bit_mux is
    port (
        A : in  std_logic_vector(15 downto 0);
        B : in  std_logic_vector(15 downto 0);
        C : in  std_logic_vector(15 downto 0);
        D : in  std_logic_vector(15 downto 0);
        S : in  std_logic_vector(1 downto 0);
        Y : out std_logic_vector(15 downto 0)
    );
end entity sixteen_bit_mux;

architecture behavioral of sixteen_bit_mux is
begin
    process(A, B, C, D, S)
    begin
        case S is
            when "00" =>
                Y <= A;
            when "01" =>
                Y <= B;
            when "10" =>
                Y <= C;
            when "11" =>
                Y <= D;
            when others =>
                Y <= (others => '0');
        end case;
    end process;
end architecture behavioral;
