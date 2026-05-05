
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity scan_chain is
    port(
        clk         : in  std_logic;
        d           : in  std_logic_vector(3 downto 0);
        scan_in     : in  std_logic;
        scan_enable : in  std_logic;
        q           : out std_logic_vector(3 downto 0);
        scan_out    : out std_logic
    );
end scan_chain;

architecture rtl of scan_chain is

    component scan_ff
        port(
            clk         : in  std_logic;
            d           : in  std_logic;
            scan_in     : in  std_logic;
            scan_enable : in  std_logic;
            q           : out std_logic;
            scan_out    : out std_logic
        );
    end component;

    signal chain : std_logic_vector(4 downto 0);

begin
    chain(0) <= scan_in;

    SFF0 : scan_ff port map(clk, d(0), chain(0), scan_enable, q(0), chain(1));
    SFF1 : scan_ff port map(clk, d(1), chain(1), scan_enable, q(1), chain(2));
    SFF2 : scan_ff port map(clk, d(2), chain(2), scan_enable, q(2), chain(3));
    SFF3 : scan_ff port map(clk, d(3), chain(3), scan_enable, q(3), chain(4));

    scan_out <= chain(4);

end rtl;