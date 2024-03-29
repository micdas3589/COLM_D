LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MEM_OUT IS
	PORT
	(
		CLK	:IN STD_LOGIC;
		LOAD	:IN STD_LOGIC;
		DIN	:IN STD_LOGIC_VECTOR(127 downto 0);
		DOUT	:OUT STD_LOGIC_VECTOR(127 downto 0)
	);
END ENTITY;

ARCHITECTURE MEM_OUT_ARCH OF MEM_OUT IS
	SIGNAL FLAG	:STD_LOGIC;
BEGIN
	PROCESS(CLK)
	BEGIN
		IF CLK = '1' AND CLK'EVENT THEN
			IF LOAD = '0' THEN
				FLAG	<= '0';
			ELSE
				FLAG	<= '1';
			END IF;
			
			IF FLAG = '1' THEN
				DOUT	<= DIN;
			ELSE
				DOUT	<= (OTHERS => '0');
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;