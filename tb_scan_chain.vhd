library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_scan_chain is
end tb_scan_chain;

architecture sim of tb_scan_chain is

    component scan_chain
        port(
            clk         : in  std_logic;
            d           : in  std_logic_vector(3 downto 0);
            scan_in     : in  std_logic;
            scan_enable : in  std_logic;
            q           : out std_logic_vector(3 downto 0);
            scan_out    : out std_logic
        );
    end component;

    signal clk         : std_logic := '0';
    signal d           : std_logic_vector(3 downto 0) := "0000";
    signal scan_in     : std_logic := '0';
    signal scan_enable : std_logic := '0';
    signal q           : std_logic_vector(3 downto 0);
    signal scan_out    : std_logic;

begin

    -- Instanciation
    UUT : scan_chain port map(clk, d, scan_in, scan_enable, q, scan_out);

    -- Horloge : periode = 10 ns
    clk <= not clk after 5 ns;

    process
    begin

        -- ============================================
        -- TEST 1 : MODE NORMAL
        -- ============================================
        scan_enable <= '0';
        d <= "1010";
        wait for 20 ns;

        d <= "1100";
        wait for 20 ns;

        d <= "0011";
        wait for 20 ns;

        -- ============================================
        -- TEST 2 : MODE TEST - Injection "1101"
        -- ============================================
        scan_enable <= '1';

        scan_in <= '1';   wait for 10 ns;
        scan_in <= '0';   wait for 10 ns;
        scan_in <= '1';   wait for 10 ns;
        scan_in <= '1';   wait for 10 ns;

        -- Lecture scan_out
        wait for 40 ns;

        -- ============================================
        -- TEST 3 : DETECTION FAUTE STUCK-AT-0
        -- ============================================
        -- On injecte '1' dans toutes les bascules
        scan_enable <= '1';

        scan_in <= '1';   wait for 10 ns;
        scan_in <= '1';   wait for 10 ns;
        scan_in <= '1';   wait for 10 ns;
        scan_in <= '1';   wait for 10 ns;

        -- Si scan_out = '0' alors faute detectee !
        wait for 40 ns;

        wait;
    end process;

end sim;
