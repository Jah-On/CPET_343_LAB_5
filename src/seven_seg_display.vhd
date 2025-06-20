/* 

Author: John Schulz
Date:   06/19/205

BCD to SSD converter entity.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity seven_seg_display is
    port (
        reset      : in  std_logic;
        bcd        : in  std_logic_vector(3 downto 0);
        ssd        : out std_logic_vector(6 downto 0)
    );
end entity seven_seg_display;

architecture converter of seven_seg_display is
    type hex_arr_t is array (0 to 15) of std_logic_vector(6 downto 0);

    -- Create list of all values for the DE1-SoC hex display
    constant BCD_SSD_MAP : hex_arr_t := ( 
        "1000000", "1111001", "0100100", "0110000", "0011001", 
        "0010010", "0000010", "1111000", "0000000", "0011000", 
        "0001000", "0000011", "1000110", "0100001", "0000110",
        "0001110"
    );
    constant BLANK : std_logic_vector(6 downto 0) := "1111111";    
begin
    set_display: process(reset, bcd)
    begin
        case reset is
            when '1'    => ssd <= BLANK;
            when others => ssd <= BCD_SSD_MAP(to_integer(unsigned(bcd)));
        end case;
    end process set_display;
end architecture converter;