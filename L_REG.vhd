LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY L_REG IS
	PORT
	(
		CLK		:IN STD_LOGIC;
		INIT		:IN STD_LOGIC;
		WR			:IN STD_LOGIC;
		ADDR_WR	:IN STD_LOGIC_VECTOR(31 downto 0);
		DATA_WR	:IN STD_LOGIC_VECTOR(31 downto 0);
		DBL_L		:IN STD_LOGIC;
		DBL_L2	:IN STD_LOGIC;
		CTX_CTR	:IN STD_LOGIC_VECTOR(7 downto 0);
		LA			:OUT STD_LOGIC_VECTOR(127 downto 0);
		LC2		:OUT STD_LOGIC_VECTOR(127 downto 0)
	);
END ENTITY;

ARCHITECTURE L_REG_ARCH OF L_REG IS
	SIGNAL COUNTER			:STD_LOGIC_VECTOR(2 downto 0) := (OTHERS => '0');
	SIGNAL MULT_L_BY_7	:STD_LOGIC := '0';
	SIGNAL MULT_L2_BY_7	:STD_LOGIC := '0';
	SIGNAL L_VALUE			:STD_LOGIC_VECTOR(127 downto 0) := (OTHERS => '0');
	SIGNAL L2_VALUE		:STD_LOGIC_VECTOR(127 downto 0) := (OTHERS => '0');
BEGIN
	PROCESS(CLK, INIT)
	BEGIN
		IF INIT = '1' THEN
			COUNTER			<= (OTHERS => '0');
			MULT_L_BY_7		<= '0';
			MULT_L2_BY_7	<= '0';
			L_VALUE			<= (OTHERS => '0');
			L2_VALUE			<= (OTHERS => '0');
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF DBL_L = '1' AND L_VALUE(127) = '1' THEN
				L_VALUE	<= (L_VALUE(126 downto 0) & '0') XOR X"00000000000000000000000000000087";
			ELSIF DBL_L = '1' THEN
				L_VALUE	<= (L_VALUE(126 downto 0) & '0');
			END IF;
			IF DBL_L2 = '1' AND L2_VALUE(127) = '1' THEN
				L2_VALUE	<= (L2_VALUE(126 downto 0) & '0') XOR X"00000000000000000000000000000087";
			ELSIF DBL_L2 = '1' THEN
				L2_VALUE	<= (L2_VALUE(126 downto 0) & '0');
			END IF;
			
			IF CTX_CTR = X"00" AND COUNTER = X"3" AND MULT_L_BY_7 = '0' AND DBL_L = '0' THEN
				IF L_VALUE(127 downto 126) = "00" THEN
					L_VALUE	<= (L_VALUE(125 downto 0) & "00")
							  XOR (L_VALUE(126 downto 0) & '0')
							  XOR L_VALUE;
				END IF;
				IF L_VALUE(127 downto 126) = "01" THEN
					L_VALUE	<= (L_VALUE(125 downto 0) & "00")
							  XOR X"00000000000000000000000000000087"
							  XOR (L_VALUE(126 downto 0) & '0')
							  XOR L_VALUE;
				END IF;
				IF L_VALUE(127 downto 126) = "10" THEN
					L_VALUE	<= (L_VALUE(125 downto 0) & "00")
							  XOR X"0000000000000000000000000000010E"
							  XOR (L_VALUE(126 downto 0) & '0')
							  XOR X"00000000000000000000000000000087"
							  XOR L_VALUE;
				END IF;
				IF L_VALUE(127 downto 126) = "11" THEN
					L_VALUE	<= (L_VALUE(125 downto 0) & "00")
							  XOR X"0000000000000000000000000000010E"
							  XOR (L_VALUE(126 downto 0) & '0')
							  XOR L_VALUE;
				END IF;
				
				MULT_L_BY_7	<= '1';
			END IF;
			
			IF CTX_CTR = X"04" AND COUNTER = X"3" AND MULT_L2_BY_7 = '0' AND DBL_L2 = '0' THEN
				IF L2_VALUE(127 downto 126) = "00" THEN
					L2_VALUE	<= (L2_VALUE(125 downto 0) & "00")
							  XOR (L2_VALUE(126 downto 0) & '0')
							  XOR L2_VALUE;
				END IF;
				IF L2_VALUE(127 downto 126) = "01" THEN
					L2_VALUE	<= (L2_VALUE(125 downto 0) & "00")
							  XOR X"00000000000000000000000000000087"
							  XOR (L2_VALUE(126 downto 0) & '0')
							  XOR L2_VALUE;
				END IF;
				IF L2_VALUE(127 downto 126) = "10" THEN
					L2_VALUE	<= (L2_VALUE(125 downto 0) & "00")
							  XOR X"0000000000000000000000000000010E"
							  XOR (L2_VALUE(126 downto 0) & '0')
							  XOR X"00000000000000000000000000000087"
							  XOR L2_VALUE;
				END IF;
				IF L2_VALUE(127 downto 126) = "11" THEN
					L2_VALUE	<= (L2_VALUE(125 downto 0) & "00")
							  XOR X"0000000000000000000000000000010E"
							  XOR (L2_VALUE(126 downto 0) & '0')
							  XOR L2_VALUE;
				END IF;
				
				MULT_L2_BY_7	<= '1';
			END IF;
			
			IF WR = '1' AND ADDR_WR = X"8" THEN
				L_VALUE(127 downto 96)	<= DATA_WR;
			END IF;
			IF WR = '1' AND ADDR_WR = X"9" THEN
				L_VALUE(95 downto 64)	<= DATA_WR;
			END IF;
			IF WR = '1' AND ADDR_WR = X"A" THEN
				L_VALUE(63 downto 32)	<= DATA_WR;
			END IF;
			IF WR = '1' AND ADDR_WR = X"B" THEN
				L_VALUE(31 downto 0)	<= DATA_WR;
				
				COUNTER	<= COUNTER + 1;
			END IF;
			
			IF COUNTER = X"1" THEN
				IF L_VALUE(127) = '1' THEN
					L2_VALUE	<= L_VALUE XOR (L_VALUE(126 downto 0) & '0') XOR X"00000000000000000000000000000087";
				ELSE
					L2_VALUE	<= L_VALUE XOR (L_VALUE(126 downto 0) & '0');
				END IF;
				
				COUNTER	<= COUNTER + 1;
			END IF;
			IF COUNTER = X"2" THEN
				IF L2_VALUE(127) = '1' THEN
					L2_VALUE	<= L2_VALUE XOR (L2_VALUE(126 downto 0) & '0') XOR X"00000000000000000000000000000087";
				ELSE
					L2_VALUE	<= L2_VALUE XOR (L2_VALUE(126 downto 0) & '0');
				END IF;
				
				COUNTER	<= COUNTER + 1;
			END IF;
		END IF;
	END PROCESS;
	
	LA		<= L_VALUE;
	LC2	<= L2_VALUE;
END ARCHITECTURE;
