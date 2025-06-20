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
        a,   b     : in  std_logic_vector((input_length - 1) downto 0);
        op_a, op_s : in  std_logic;
        sum        : out std_logic_vector(input_length downto 0);
        clk        : in  std_logic;
        reset      : in  std_logic
    );
end entity generic_add_sub;

architecture arithmetic of generic_add_sub is
    type operation_t is (ADD, SUBTRACT);

    signal op    : operation_t := ADD;
    signal int_a : integer     := 0;
    signal int_b : integer     := 0;
begin
    clock_ab: process(clk, reset)
    begin
        if (reset = '1') then
            int_a <= 0;
            int_b <= 0;
        elsif rising_edge(clk) then
            int_a <= to_integer(unsigned(a));
            int_b <= to_integer(unsigned(b));
        end if;
    end process clock_ab;

    clock_op: process(clk, reset)
    begin
        if (reset = '1') then
            op <= ADD;
        elsif rising_edge(clk) then
            if (op_a = '0') then
                op <= ADD;
            elsif (op_s = '0') then
                op <= SUBTRACT;
            end if;
        end if;
    end process clock_op;

    add_sub_nums: process(int_a, int_b, op)
    begin
        case op is
            when ADD =>
                sum <= std_logic_vector(to_unsigned(int_a + int_b, sum'length));        
            when others =>
                sum <= std_logic_vector(to_signed(int_a - int_b, sum'length));
        end case;
    end process add_sub_nums;
end architecture arithmetic;