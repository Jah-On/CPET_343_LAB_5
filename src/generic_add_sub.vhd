/* 

Author: John Schulz
Date:   06/19/205

Generic ALU with addition and subtraction.

*/

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity generic_add_sub is
    generic (
        input_length : integer := 3 -- Default with 3 bit inputs
    );
    port (
        a,   b   : in  std_logic_vector((input_length - 1) downto 0);
        add, sub : in  std_logic;
        sum      : out std_logic_vector(input_length downto 0);
        clk      : in  std_logic;
        reset    : in  std_logic
    );
end entity generic_add_sub;

architecture arithmetic of generic_add_sub is
    signal int_a : integer;
    signal int_b : integer;
begin
    add_sub_nums: process(clk, reset)
    begin
        if (reset = '1') then
            sum <= std_logic_vector(to_unsigned(0, sum'length));
        elsif (rising_edge(clk)) then
            int_a <= to_integer(unsigned(a));
            int_b <= to_integer(unsigned(b));

            if (add = '1') then
                sum <= std_logic_vector(to_unsigned(int_a + int_b, sum'length));
            elsif (sub = '1') then
                sum <= std_logic_vector(to_signed(int_a - int_b, sum'length));
            end if;
        end if;
    end process add_sub_nums;
end architecture arithmetic;