LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY sixteen_bit_subtractor_signed IS
    PORT
    (
        dataa        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        datab        : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        result        : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END sixteen_bit_subtractor_signed;


ARCHITECTURE SYN OF sixteen_bit_subtractor_signed IS

    SIGNAL sub_wire0    : STD_LOGIC_VECTOR (15 DOWNTO 0);



    COMPONENT lpm_add_sub
    GENERIC (
        lpm_direction        : STRING;
        lpm_hint        : STRING;
        lpm_representation        : STRING;
        lpm_type        : STRING;
        lpm_width        : NATURAL
    );
    PORT (
            dataa    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            datab    : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            result    : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
    END COMPONENT;

BEGIN
    result    <= sub_wire0(15 DOWNTO 0);

    LPM_ADD_SUB_component : LPM_ADD_SUB
    GENERIC MAP (
        lpm_direction => "SUB",
        lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=NO",
        lpm_representation => "SIGNED",
        lpm_type => "LPM_ADD_SUB",
        lpm_width => 16
    )
    PORT MAP (
        dataa => dataa,
        datab => datab,
        result => sub_wire0
    );



END SYN;