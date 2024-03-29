LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.STD_LOGIC_UNSIGNED.ALL;
	USE IEEE.NUMERIC_STD.ALL;

ENTITY CONTROL IS
	PORT (
		CLK			:IN STD_LOGIC;
		INIT			:IN STD_LOGIC;
		WR				:IN STD_LOGIC;
		RD				:IN STD_LOGIC;
		ADDR_WR		:IN STD_LOGIC_VECTOR(31 downto 0);
		DRL_CTX		:IN STD_LOGIC;
		DRL_TAG		:IN STD_LOGIC;
		TAG_CTR		:IN STD_LOGIC_VECTOR(7 downto 0);
		TAG_INTVL	:IN STD_LOGIC_VECTOR(15 downto 0);
		TAG_LEN		:IN STD_LOGIC_VECTOR(7 downto 0);
		TAG_VALID	:IN STD_LOGIC;
		
		WR_PTX		:OUT STD_LOGIC;
		WR_CTX		:OUT STD_LOGIC;
		WR_TAG		:OUT STD_LOGIC;
		RD_PTX		:OUT STD_LOGIC;
		RD_CTX		:OUT STD_LOGIC;
		RD_TAG		:OUT STD_LOGIC;
		DBL_L			:OUT STD_LOGIC;
		DBL_L2		:OUT STD_LOGIC;
		WR_RO			:OUT STD_LOGIC;
		INIT_DK1		:OUT STD_LOGIC;
		INIT_DK3		:OUT STD_LOGIC;
		KEY_RD1		:OUT STD_LOGIC;
		KEY_RD3		:OUT STD_LOGIC;
		
		RUN_DK1		:OUT STD_LOGIC;
		RUN_DK3		:OUT STD_LOGIC;
		
		TAG_VER		:OUT STD_LOGIC;
		MSG_VER		:OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE ARCH_CONTROL OF CONTROL IS
	SIGNAL COUNTER_CTX	:STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL COUNTER_PTX	:STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL TAG_CTR_VAL	:STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL RUN_DEC_PTX	:STD_LOGIC := '0';
BEGIN
	PROCESS(CLK, INIT)
	BEGIN
		IF INIT = '1' THEN
			COUNTER_CTX		<= (OTHERS => '0');
			COUNTER_PTX		<= (OTHERS => '0');
			TAG_CTR_VAL		<= (OTHERS => '0');
			RUN_DEC_PTX		<= '0';
		ELSIF CLK = '1' AND CLK'EVENT THEN
			IF (WR = '1' AND ADDR_WR = X"FFFFFFFF") OR COUNTER_CTX /= X"0" THEN
				IF COUNTER_CTX /= X"2B" AND COUNTER_CTX /= X"FF" THEN
					COUNTER_CTX	<= COUNTER_CTX + 1;
				END IF;
				IF COUNTER_CTX = X"27" THEN -- START PTX BEFORE CTX ENDS
					RUN_DEC_PTX	<= '1';
				END IF;
				IF COUNTER_CTX = X"2B" THEN
					COUNTER_CTX	<= X"01";
				END IF;
				IF COUNTER_CTX = X"2B" AND DRL_CTX = '0' THEN
					COUNTER_CTX	<= X"FF";
				END IF;
				
				IF RUN_DEC_PTX = '1' AND COUNTER_PTX /= X"FF" THEN
					COUNTER_PTX	<= COUNTER_PTX + 1;
				END IF;
				IF COUNTER_PTX = X"2B" THEN
					COUNTER_PTX	<= X"01";
				END IF;
				IF COUNTER_CTX = X"FF" AND DRL_CTX = '0' AND COUNTER_PTX = X"2B" THEN
					COUNTER_PTX	<= X"FF";
				END IF;
				
				IF DRL_CTX = '1' AND COUNTER_CTX = X"01" AND (TAG_CTR(7 downto 2)+1 = TAG_CTR_VAL + TAG_INTVL) THEN
					TAG_CTR_VAL	<= TAG_CTR_VAL + TAG_INTVL(7 downto 0);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
	RUN_DK1		<= '1'
						WHEN COUNTER_CTX >= X"02" AND COUNTER_CTX <= X"2B" -- DECRYPT CTX
						ELSE '0';
	INIT_DK1		<= '1'
						WHEN COUNTER_CTX = X"01"
						ELSE '0';
	KEY_RD1		<= '1'
						WHEN (CONV_INTEGER(COUNTER_CTX) MOD 4) = 2
						ELSE '0';
	WR_PTX		<= '1'
						WHEN COUNTER_PTX = X"2B" AND COUNTER_CTX /= X"FF"
						ELSE '0';
	WR_RO			<= '1'
						WHEN COUNTER_CTX = X"2B"
						ELSE '0';
	DBL_L			<= '1'
						WHEN COUNTER_PTX = X"01"
						ELSE '0';
	DBL_L2		<= '1'
						WHEN COUNTER_CTX = X"01"
						  OR (DRL_CTX = '1' AND COUNTER_CTX = X"2B" AND (TAG_CTR(7 downto 2)+1 = TAG_CTR_VAL + TAG_INTVL))
						ELSE '0';
	RUN_DK3		<= '1'
						WHEN COUNTER_PTX >= X"01" AND COUNTER_PTX <= X"2B"
						ELSE '0';
	INIT_DK3		<= '1'
						WHEN COUNTER_PTX = X"01"
						ELSE '0';
	KEY_RD3		<= '1'
						WHEN (CONV_INTEGER(COUNTER_PTX) MOD 4) = 2
						ELSE '0';
	RD_CTX		<= '1'
						WHEN DRL_CTX = '1' AND COUNTER_CTX = X"01"
						ELSE '0';
	RD_TAG		<= '1'
						WHEN DRL_CTX = '1' AND COUNTER_CTX = X"01" AND (TAG_CTR(7 downto 2)+1 = TAG_CTR_VAL + TAG_INTVL)
						ELSE '0';
	TAG_VER		<= '1'
						WHEN (COUNTER_CTX = X"2B" AND (TAG_CTR(7 downto 2) = TAG_CTR_VAL + TAG_INTVL))
						ELSE '0';
	MSG_VER		<= '1'
						WHEN COUNTER_PTX = X"2B" AND COUNTER_CTX = X"FF"
						ELSE '0';
						
	RD_PTX		<= '1'
						WHEN RD = '1' AND ADDR_WR = X"11111111" AND TAG_VALID = '1' AND COUNTER_CTX = X"FF"
						ELSE '0';
	WR_CTX		<= '1'
						WHEN WR = '1' AND ADDR_WR = X"33333333"
						ELSE '0';
	WR_TAG		<= '1'
						WHEN WR = '1' AND ADDR_WR = X"44444444"
						ELSE '0';
END ARCHITECTURE;