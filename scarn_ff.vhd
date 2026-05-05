
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity scan_ff is
    port(
        clk         : in  std_logic;
        d           : in  std_logic;
        scan_in     : in  std_logic;
        scan_enable : in  std_logic;
        q           : out std_logic;
        scan_out    : out std_logic
    );
end scan_ff;

architecture rtl of scan_ff is
    signal q_int : std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if scan_enable = '1' then
                q_int <= scan_in;
            else
                q_int <= d;
            end if;
        end if;
    end process;

    q        <= q_int;
    scan_out <= q_int;
end rtl;