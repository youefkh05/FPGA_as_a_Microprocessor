LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY sixteen_bit_multi_signed IS
    PORT
    (
        dataa        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        datab        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        result        : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
END sixteen_bit_multi_signed;


ARCHITECTURE SYN OF sixteen_bit_multi_signed IS

    SIGNAL sub_wire0    : STD_LOGIC_VECTOR (31 DOWNTO 0);



    COMPONENT lpm_mult
    GENERIC (
        lpm_hint        : STRING;
        lpm_representation        : STRING;
        lpm_type        : STRING;
        lpm_widtha        : NATURAL;
        lpm_widthb        : NATURAL;
        lpm_widthp        : NATURAL
    );
    PORT (
            dataa    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            datab    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            result    : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
    );
    END COMPONENT;

BEGIN
    result    <= sub_wire0(31 DOWNTO 0);

    lpm_mult_component : lpm_mult
    GENERIC MAP (
        lpm_hint => "MAXIMIZE_SPEED=5",
        lpm_representation => "SIGNED",
        lpm_type => "LPM_MULT",
        lpm_widtha => 16,
        lpm_widthb => 16,
        lpm_widthp => 32
    )
    PORT MAP (
        dataa => dataa,
        datab => datab,
        result => sub_wire0
    );



END SYN;