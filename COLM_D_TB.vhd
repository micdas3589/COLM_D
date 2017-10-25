LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;

ENTITY COLM_D_TB IS END ENTITY;

ARCHITECTURE ARCH_COLM_D_TB OF COLM_D_TB IS
	COMPONENT COLM_D IS PORT
	(
		INIT :  IN  STD_LOGIC;
		WR :  IN  STD_LOGIC;
		RD :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		ADDR_WR :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DIN :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		DOUT :  OUT  STD_LOGIC_VECTOR(127 DOWNTO 0)
	);
	END COMPONENT;

	SIGNAL INIT :  IN  STD_LOGIC := '0';
	SIGNAL WR :  IN  STD_LOGIC := '0';
	SIGNAL RD :  IN  STD_LOGIC := '0';
	SIGNAL CLK :  IN  STD_LOGIC := '0';
	SIGNAL ADDR_WR :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DIN :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DOUT :  OUT  STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
	
	SIGNAL CLKp :time := 40 ns;
BEGIN
	tb: COLM_D PORT MAP (INIT, WR, RD, CLK, ADDR_WR, DIN, DOUT);

	PROCESS
	BEGIN
		CLK <= '0'; wait for CLKp / 2;
		CLK <= '1'; wait for CLKp / 2;
	END PROCESS;

	PROCESS
	BEGIN
		INIT <= '1'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000001"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000002"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000003"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000004"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000005"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000006"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000007"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000008"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000009"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000A"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000B"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000C"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000D"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000E"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000F"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"11111111"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"11111111"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"11111111"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"11111111"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"22222222"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"22222222"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"22222222"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"22222222"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for 500*CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;

		wait;
	END PROCESS;
END ARCHITECTURE;