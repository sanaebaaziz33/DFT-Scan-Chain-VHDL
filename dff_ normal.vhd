library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dff_normal is
    port(
        clk : in  std_logic;
        d   : in  std_logic;
        q   : out std_logic
    );
end dff_normal;

architecture rtl of dff_normal is
begin
    process(clk)
    begin
        if rising_edge(clk) then
            q <= d;
        end if;
    end process;
end rtl;

