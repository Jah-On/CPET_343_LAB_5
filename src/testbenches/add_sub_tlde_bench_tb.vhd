/* 

Author: John Schulz
Date:   06/19/205

Testbench for TLDE.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_sub_tlde_bench is
end entity add_sub_tlde_bench;

architecture stimuli of add_sub_tlde_bench is
    component add_sub_tlde is
        port (
            clk, reset          : in  std_logic;
            switch              : in  std_logic_vector(7 downto 0);
            p_btn, m_btn        : in  std_logic;
            bcd_0, bcd_2, bcd_4 : out std_logic_vector(6 downto 0)
        );
    end component add_sub_tlde;

    constant tick : time := 10ns;

    signal clk, reset, p_btn, m_btn : std_logic := '1';
    signal switch                   : std_logic_vector(7 downto 0);
    signal done                     : std_logic := '0';
begin
    clock_gen: process
    begin
        while (done = '0') loop 
            wait for tick;
            clk <= not clk;
        end loop;

        wait;
    end process clock_gen;
    
    stim_inputs: process
    begin
        reset <= '1';
        for a in 0 to 7 loop
            wait until rising_edge(clk);
        end loop;
        reset <= '0';
        for a in 0 to 7 loop
            wait until rising_edge(clk);
        end loop;

        m_btn <= '0';
        for a in 0 to 3 loop
            wait until rising_edge(clk);
        end loop;
        m_btn <= '1';
        
        for a in 0 to 7 loop
            switch(7 downto 5) <= std_logic_vector(to_unsigned(a, 3));

            for b in 0 to 7 loop
                switch(4 downto 2) <= std_logic_vector(to_unsigned(b, 3));

                wait until rising_edge(clk);
            end loop;
        end loop;

        p_btn <= '0';
        for a in 0 to 3 loop
            wait until rising_edge(clk);
        end loop;
        p_btn <= '1';

        for a in 0 to 7 loop
            switch(7 downto 5) <= std_logic_vector(to_unsigned(a, 3));

            for b in 0 to 7 loop
                switch(4 downto 2) <= std_logic_vector(to_unsigned(b, 3));

                wait until rising_edge(clk);
            end loop;
        end loop;

        p_btn <= '1';

        for a in 0 to 7 loop
            switch(7 downto 5) <= std_logic_vector(to_unsigned(a, 3));

            for b in 0 to 7 loop
                switch(4 downto 2) <= std_logic_vector(to_unsigned(b, 3));

                wait until rising_edge(clk);
            end loop;
        end loop;

        reset <= '1';

        for a in 0 to 7 loop
            switch(7 downto 5) <= std_logic_vector(to_unsigned(a, 3));

            for b in 0 to 7 loop
                switch(4 downto 2) <= std_logic_vector(to_unsigned(b, 3));

                wait until rising_edge(clk);
            end loop;
        end loop;

        done <= '1';

        wait;
    end process stim_inputs;

    uut : add_sub_tlde 
        port map (
            clk     => clk,
            reset   => reset,
            switch  => switch,
            p_btn   => p_btn,
            m_btn   => m_btn,
            bcd_4   => open,
            bcd_2   => open,
            bcd_0   => open
        );
end architecture stimuli;