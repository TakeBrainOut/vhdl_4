----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:09 03/14/2016 
-- Design Name: 
-- Module Name:    freq_div - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity freq_div is
    Port ( CLK : in  STD_LOGIC;
           freq_1 : out  STD_LOGIC;
           freq_2 : out  STD_LOGIC;
           freq_3 : out  STD_LOGIC);
end freq_div;

architecture Behavioral of freq_div is
	
	--signal freq_1_temp : std_logic := '0';
	--signal freq_2_temp : std_logic := '1';
begin
	
	--freq_2_temp <= '1' when rising_edge(freq_1_temp);
	
process(CLK)
	
	variable counter1 : integer range 0 to 35714286 := 0; -- счетчик частоты  вывода данных 7д√÷
	variable counter2 : integer range 0 to 231481 := 0; -- счетчик обновление индикатора 27 √ц (увеличили в 4 раза)
	variable counter3 : integer range 0 to 1923077 := 0; -- счетчик частоты опроса переключателей 13 √ц
	
	--variable AN_temp : std_logic_vector(3 downto 0) := (0 => '0', others => '1'); --27 √ц частота дл€ входов разрешени€ 
	variable freq_1_temp : std_logic := '0';
	variable freq_2_temp : std_logic := '0';
	variable freq_3_temp : std_logic := '0';
	
	begin 
	
	if rising_edge(CLK) then
	
		if counter1 = 35714286 then 
			freq_1_temp := not freq_1_temp;
			freq_2_temp := not freq_2_temp;
			counter1 := 0;
		else counter1 := counter1 + 1;
		end if;
					
		if (counter2 /= 231481) AND (freq_1_temp = '1') then
			counter2 := counter2 + 1;
		elsif (counter2 = 231481) AND (freq_1_temp = '1') then
			freq_2_temp := not freq_2_temp;
			counter2 := 0;
		else 
			counter2 := 0;
		end if;
		
		--if counter2 = 231481 then
			--AN_temp := AN_temp(2 downto 0) & AN_temp(3);
		--	freq_2_temp := not freq_2_temp;
		--	counter2 := 0;
		--else counter2 := counter2 + 1;
		--end if;
		
		if counter3 = 1923077 then 
			freq_3_temp := not freq_3_temp;
			counter3 := 0;
		else counter3 := counter3 + 1;
		end if;
		
	end if;
		

	--AN <= AN_temp;
	freq_1 <= freq_1_temp;
	freq_2 <= freq_2_temp;
	freq_3 <= freq_3_temp;
	
end process;


end Behavioral;

