library ieee;
use ieee.std_logic_1164.all;

entity arithmetic_mux_signed is
    port (
        A : in  std_logic_vector(15 downto 0);
        B : in  std_logic_vector(15 downto 0);
        C : in  std_logic_vector(31 downto 0);
        D : in  std_logic_vector(31 downto 0);
        S : in  std_logic_vector(1 downto 0);
        Y : out std_logic_vector(31 downto 0)
    );
end entity arithmetic_mux_signed;

architecture behavioral of arithmetic_mux_signed is
begin
    process(A, B, C, D, S)
    begin
        case S is
            when "00" =>
                -- Task 1: Select input A
           	 for i in 0 to 15 loop
                   Y(i) <= A(i); 
                end loop;
                if A(15) = '0' then
                	for i in 16 to 31 loop
	                   Y(i) <= '0'; 
	                end loop;
                else
                    for i in 16 to 31 loop
	                   Y(i) <= '1'; 
	                end loop;
                end if;
                
            when "01" =>
                -- Task 2: Select input B
           	 for i in 0 to 15 loop
                   Y(i) <= B(i); 
                end loop;
                if B(15) = '0' then
                	for i in 16 to 31 loop
	                   Y(i) <= '0'; 
	                end loop;
                else
                    for i in 16 to 31 loop
	                   Y(i) <= '1'; 
	                end loop;
                end if;
                
            when "10" =>
                -- Task 3: Select input C
                Y <= C;
                
            when "11" =>
                -- Task 4: Select input D
                Y <= D;
                
            when others =>
                -- Handle any other cases
                Y <= (others => '0');
        end case;
    end process;
end architecture behavioral;
