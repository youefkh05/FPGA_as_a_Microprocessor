library ieee;
use ieee.std_logic_1164.all;

entity selector_mux is
    port (
        A : in  std_logic_vector(31 downto 0);
        B : in  std_logic_vector(15 downto 0);
        S : in  std_logic;
        Y : out std_logic_vector(31 downto 0)
    );
end entity selector_mux;

architecture behavioral of selector_mux is
begin
process(A, B, S)
    begin
        if S='1'then
                 for i in 0 to 15 loop
                   Y(i) <= B(i); 
                end loop;
                	for i in 16 to 31 loop
	                   Y(i) <= '0'; 
	                end loop;
			else 
                Y <= A;
			end if;
	end process;
end architecture behavioral;
