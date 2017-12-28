LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TAG_VER_REG IS
	PORT
	(
		CLK		:IN STD_LOGIC;
		INIT		:IN STD_LOGIC;
		WR_PTX	:IN STD_LOGIC;
		VERIFY	:IN STD_LOGIC;
		MSG_VER	:IN STD_LOGIC;
		MSG		:IN STD_LOGIC_VECTOR(127 downto 0);
		TAG		:IN STD_LOGIC_VECTOR(127 downto 0);
		STATE		:IN STD_LOGIC_VECTOR(127 downto 0);
		TAG_VER	:OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE TAG_VER_REG_ARCH OF TAG_VER_REG IS
	SIGNAL TAG_VALID	:STD_LOGIC;
	SIGNAL MSG_XOR		:STD_LOGIC_VECTOR(127 downto 0);
BEGIN
	PROCESS(CLK, INIT)
	BEGIN
		IF INIT = '1' THEN
			TAG_VALID	<= '1';
			MSG_XOR		<= (OTHERS => '0');
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF WR_PTX = '1' THEN
				MSG_XOR	<= MSG_XOR XOR MSG;
			END IF;
			
			IF VERIFY = '1' AND STATE /= TAG THEN
				TAG_VALID	<= '0';
			END IF;
			IF MSG_VER = '1' AND MSG /= MSG_XOR THEN
				TAG_VALID	<= '0';
			END IF;
		END IF;
	END PROCESS;
	
	TAG_VER	<= TAG_VALID;
END ARCHITECTURE;
