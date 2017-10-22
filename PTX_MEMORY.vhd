LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.NUMERIC_STD.ALL;
	
LIBRARY WORK;

ENTITY PTX_MEMORY IS PORT
(	
	CLK	:IN STD_LOGIC;
	INIT	:IN STD_LOGIC;
	STORE	:IN STD_LOGIC;
	LOAD	:IN STD_LOGIC;
	DIN	:IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	
	DRL	:OUT STD_LOGIC;
	DOUT	:OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END ENTITY;

ARCHITECTURE PTX_MEMORY_ARCH OF PTX_MEMORY IS
	
	-- liczba slotów pamięci
	CONSTANT MEM_SIZE	 :STD_LOGIC_VECTOR(7 DOWNTO 0) := X"FF";
	CONSTANT LAST_ADDR :STD_LOGIC_VECTOR(7 DOWNTO 0) := STD_LOGIC_VECTOR(unsigned(MEM_SIZE) - 1);
	
	TYPE MEMORY_BLOCK IS ARRAY (0 TO conv_integer(LAST_ADDR)) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL MEM : MEMORY_BLOCK;
	
	SIGNAL LOAD_COUNTER :STD_LOGIC_VECTOR(1 downto 0);
	
	SIGNAL CTR :STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL IXS :STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL IXL :STD_LOGIC_VECTOR(7 DOWNTO 0);	
	
BEGIN
	
	PROCESS(CLK, INIT)
	BEGIN
		IF(INIT = '1') THEN CTR <= (others => '0');
		ELSE
			IF (CLK'EVENT AND CLK = '1') THEN
				IF ((STORE = '1' AND LOAD = '0' AND CTR /= MEM_SIZE) OR (STORE = '1' AND LOAD = '1' AND CTR = X"00")) THEN
					CTR <= STD_LOGIC_VECTOR(unsigned(CTR) + 4);
				END IF;
				IF ((STORE = '0' AND LOAD = '1' AND CTR /= X"00") OR (STORE = '1' AND LOAD = '1' AND CTR = MEM_SIZE)) THEN
					CTR <= STD_LOGIC_VECTOR(unsigned(CTR) - 1);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(CLK, INIT)
	BEGIN
		IF(INIT = '1') THEN IXS <= (others => '0');
		ELSE
			IF (CLK'EVENT AND CLK = '1') THEN
				IF (STORE = '1' AND CTR /= MEM_SIZE) THEN
					IF(IXS /= LAST_ADDR) THEN
						IXS <= STD_LOGIC_VECTOR(unsigned(IXS) + 4);
					ELSE
						IXS <= (others => '0');
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(CLK, INIT)
	BEGIN
		IF(INIT = '1') THEN IXL <= (others => '0');
		ELSE
			IF (CLK'EVENT AND CLK = '1') THEN
				IF (LOAD = '1' AND CTR /= X"00") THEN
					IF(IXL /= LAST_ADDR) THEN
						IXL <= STD_LOGIC_VECTOR(unsigned(IXL) + 1);
					ELSE
						IXL <= (others => '0');
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(CLK, INIT)
	BEGIN
		IF INIT = '1' THEN
			LOAD_COUNTER	<= (OTHERS => '0');
		ELSIF (CLK'EVENT AND CLK = '1') THEN
			IF (STORE = '1' AND CTR /= MEM_SIZE AND LOAD_COUNTER = "00") THEN
				MEM(conv_integer(IXS)) 	<= DIN(127 downto 96);
				LOAD_COUNTER				<= LOAD_COUNTER + 1;
			END IF;
			IF LOAD_COUNTER = "01" THEN
				MEM(conv_integer(IXS)) 	<= DIN(95 downto 64);
				LOAD_COUNTER				<= LOAD_COUNTER + 1;
			END IF;
			IF LOAD_COUNTER = "10" THEN
				MEM(conv_integer(IXS)) 	<= DIN(63 downto 32);
				LOAD_COUNTER				<= LOAD_COUNTER + 1;
			END IF;
			IF LOAD_COUNTER = "11" THEN
				MEM(conv_integer(IXS)) 	<= DIN(31 downto 0);
				LOAD_COUNTER				<= LOAD_COUNTER + 1;
			END IF;
		END IF;
	END PROCESS;
	
	PROCESS(CLK)
	BEGIN
		IF (CLK'EVENT AND CLK = '1') THEN
			IF(LOAD = '1' AND CTR /= X"00") THEN
				DOUT <= MEM(conv_integer(IXL));
			ELSE
				DOUT <= (others => 'Z');
			END IF;
		END IF;
	END PROCESS;
	
	DRL	<= '1' WHEN CTR /= X"00" ELSE '0';
	
END ARCHITECTURE;