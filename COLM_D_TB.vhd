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

	SIGNAL INIT :    STD_LOGIC := '0';
	SIGNAL WR :    STD_LOGIC := '0';
	SIGNAL RD :    STD_LOGIC := '0';
	SIGNAL CLK :    STD_LOGIC := '0';
	SIGNAL ADDR_WR :    STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DIN :    STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DOUT :    STD_LOGIC_VECTOR(127 DOWNTO 0) := (OTHERS => '0');
	
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
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00112233"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000001"; DIN <= X"44556677"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000002"; DIN <= X"8899AABB"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000003"; DIN <= X"CCDDEEFF"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000004"; DIN <= X"11111111"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000005"; DIN <= X"22222222"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000006"; DIN <= X"00028000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000007"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000008"; DIN <= X"FDE4FBAE"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000009"; DIN <= X"4A09E020"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000A"; DIN <= X"EFF72296"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000B"; DIN <= X"9F83832B"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000C"; DIN <= X"75FC664E"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000D"; DIN <= X"963541F6"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000E"; DIN <= X"0B1014EA"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000F"; DIN <= X"01238AE0"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"3B324663"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"683C48EA"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"DE4901A3"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"776389D9"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"742C26A7"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"28573C22"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"C9D55FF3"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"7E104968"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"A89DB2CA"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"D86DA110"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"B5E3ACDD"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"8E7249EA"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"82F32187"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"ADCA33B6"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"999D3AA7"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"CF999F9C"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"5F67B514"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"E9BCF0D2"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"E363AD5F"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"3ACFB4D1"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"2097132B"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"D3AC79FF"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"11703FCC"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"9A4D62C8"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"A336981C"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"25E99C58"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"46CD5571"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"388F19D1"; wait for CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for 10*CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"FFFFFFFF"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for 350*CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;

		wait;
	END PROCESS;
END ARCHITECTURE;