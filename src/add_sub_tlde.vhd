/* 

Author: John Schulz
Date:   06/19/205

Top level design entity for ALU with display output.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_sub_tlde is
    port (
        clk, reset          : in  std_logic;
        switch              : in  std_logic_vector(5 downto 0);
        p_btn, m_btn        : in  std_logic;
        bcd_0, bcd_2, bcd_4 : out std_logic_vector(6 downto 0)
    );
end entity add_sub_tlde;

architecture tlde of add_sub_tlde is
    component generic_add_sub is
        generic (
            input_length : integer := 3 -- Default with 3 bit inputs
        );
        port (
            a,   b     : in  std_logic_vector((input_length - 1) downto 0);
            op_a, op_s : in  std_logic;
            sum        : out std_logic_vector(input_length downto 0);
            clk        : in  std_logic;
            reset      : in  std_logic
        );
    end component generic_add_sub;

    component seven_seg_display is
        port (
            clk, reset : in  std_logic;
            bcd        : in  std_logic_vector(3 downto 0);
            ssd        : out std_logic_vector(6 downto 0)
        );
    end component seven_seg_display;

    signal a_signal   : std_logic_vector(3 downto 0) := "0000";
    signal b_signal   : std_logic_vector(3 downto 0) := "0000";
    signal sum_signal : std_logic_vector(3 downto 0) := "0000";
begin    
    a_dsp : seven_seg_display
        port map (
            clk   => clk,
            reset => reset,
            bcd   => '0' & switch(5) & switch(4) & switch(3),
            ssd   => bcd_4
        );

    b_dsp : seven_seg_display
        port map (
            clk   => clk,
            reset => reset,
            bcd   => '0' & switch(2) & switch(1) & switch(0),
            ssd   => bcd_2
        );
    
    alu : generic_add_sub 
        port map (
            clk   => clk,
            reset => reset,
            a     => switch(5) & switch(4) & switch(3),
            b     => switch(2) & switch(1) & switch(0),
            op_a  => p_btn,
            op_s  => m_btn,
            sum   => sum_signal
        );

    sum_dsp : seven_seg_display
        port map (
            clk   => clk,
            reset => reset,
            bcd   => sum_signal,
            ssd   => bcd_0
        );
    
end architecture tlde;