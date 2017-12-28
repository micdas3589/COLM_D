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
		DOUT :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
	END COMPONENT;

	SIGNAL INIT :    STD_LOGIC := '0';
	SIGNAL WR :    STD_LOGIC := '0';
	SIGNAL RD :    STD_LOGIC := '0';
	SIGNAL CLK :    STD_LOGIC := '0';
	SIGNAL ADDR_WR :    STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DIN :    STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	SIGNAL DOUT :    STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
	
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

		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"3651C484"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"53AB20DA"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"359D7879"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"FAED5666"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"1408AD58"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"8C46D4D5"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"BA9F9A98"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"88F428F0"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"004D7F4C"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"B46EFD87"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"3B667430"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"33333333"; DIN <= X"A86E9622"; wait for CLKp;
		
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"E8E5CC52"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"DBE6E91C"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"E788E4E7"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"44444444"; DIN <= X"4E75F375"; wait for CLKp;
		
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"55565758"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000001"; DIN <= X"595A5B5C"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000002"; DIN <= X"5D5E5F60"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000003"; DIN <= X"61626364"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000004"; DIN <= X"B0B1B2B3"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000005"; DIN <= X"B4B5B6B7"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000006"; DIN <= X"00028000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000007"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000008"; DIN <= X"DA8915C2"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"00000009"; DIN <= X"7C4B490E"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000A"; DIN <= X"FA762F48"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000B"; DIN <= X"1EA3A6BF"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000C"; DIN <= X"F13BD440"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000D"; DIN <= X"41F48E7F"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000E"; DIN <= X"1829D6C5"; wait for CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"0000000F"; DIN <= X"C04C82D6"; wait for CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for 50*CLKp;
		INIT <= '0'; WR <= '1'; RD <= '0'; ADDR_WR <= X"FFFFFFFF"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for 350*CLKp;
		INIT <= '0'; WR <= '0'; RD <= '1'; ADDR_WR <= X"11111111"; DIN <= X"00000000"; wait for 16*CLKp;
		INIT <= '0'; WR <= '0'; RD <= '1'; ADDR_WR <= X"00000010"; DIN <= X"00000000"; wait for CLKp;
		INIT <= '0'; WR <= '0'; RD <= '0'; ADDR_WR <= X"00000000"; DIN <= X"00000000"; wait for CLKp;

		wait;
	END PROCESS;
END ARCHITECTURE;