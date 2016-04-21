----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:38:37 03/14/2016 
-- Design Name: 
-- Module Name:    output_unit - Behavioral 
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
use IEEE.std_logic_unsigned.all;


use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity output_unit is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           number_clk : in  STD_LOGIC;
           digit_clk : in  STD_LOGIC;
           error : in  STD_LOGIC;
           digit : out  STD_LOGIC_VECTOR (3 downto 0);
           led_en : out  STD_LOGIC_VECTOR (3 downto 0);
           to_led : out  STD_LOGIC_VECTOR (7 downto 0);
           digit_led : out  STD_LOGIC_VECTOR (5 downto 0);
           trans_number : out  STD_LOGIC_VECTOR (15 downto 0));
end output_unit;

architecture Behavioral of output_unit is
	signal a_temp: STD_LOGIC_VECTOR (3 downto 0);
	signal b_temp: STD_LOGIC_VECTOR (3 downto 0);
	signal c_temp: STD_LOGIC_VECTOR (3 downto 0);
	signal error_temp: STD_LOGIC;
	
	signal number_counter: STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
	signal trans_number_temp: STD_LOGIC_VECTOR (15 downto 0):= (others => '1');
	signal digit_temp: STD_LOGIC_VECTOR (3 downto 0) := (others => '1');

	signal led_en_temp: STD_LOGIC_VECTOR (3 downto 0) := (others => '1');
	signal reset : STD_LOGIC := '0';
	
	function to_int(x: STD_LOGIC_VECTOR(3 downto 0)) return integer is
			variable result: integer range -8 to 8 := 0;
		begin
			for i in 2 downto 0 loop
				if (x(i) = '1') then 
					result := result + 2 ** i;
				end if;
			end loop;
			if x(3) = '1' then result := - result;
			end if;
			return result;
	end function to_int;		

	function to_4dig(x: STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
		variable code_dig: STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
		variable temp : STD_LOGIC_VECTOR(3 downto 0) := (others => '1');
		begin
			if (x(3) = '1') then
				temp := '0' & (not(x(2 downto 0)) + 1);
			else temp := x;
			end if;
			if (temp > "0011" AND x(3) = '1') then
				code_dig(11 downto 0) := "1010" & "0001" & (temp - "0100");
			elsif (temp > "0011" AND x(3) = '0') then
				code_dig(7 downto 0) := "0001" & (temp - "0100");
			elsif (temp < "0100" AND x(3) = '1') then
				code_dig(7 downto 0) := "1010" & temp;
			else code_dig(3 downto 0) := x;
			end if;
			return code_dig;
	end function to_4dig;
	
	function to_2dig(x: STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
		variable code_dig: STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
		begin
			for i in 3 downto 0 loop
				code_dig((i*4+3) downto i*4) := "000" & x(i);
			end loop;
			return code_dig;
	end function to_2dig;
	
	
	function to_10dig(x: STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
		variable code_dig: STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
		begin
			if (x(3) = '1') then
				code_dig(7 downto 0) := "1010" & '0' & ((not(x(2 downto 0))) + 1);
			else code_dig(3 downto 0) := x;
			end if;
			return code_dig;
	end function to_10dig;	
begin

	reset <= '1' when number_clk = '0' else
				'0';
				
	-- формируем входы разрешения 			
	process(digit_clk, reset)
		variable digit_counter: STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
		--variable led_en_temp: STD_LOGIC_VECTOR (3 downto 0) := (others => '1');
	begin
		if reset = '1' AND digit_clk = '0' then
			digit_counter := "00";
			led_en_temp <= "1111";
			--do async reset her
		elsif rising_edge(digit_clk) then
			case digit_counter is
					when "00" => led_en_temp <= "1110";
					when "01" => led_en_temp <= "1101";
				   when "10" => led_en_temp <= "1011";
					when others => led_en_temp <= "0111";					--when others => led_en_temp <= "1111";
				end case;
			digit_counter := digit_counter + 1;
		end if;
	end process;
	led_en <= led_en_temp;
	
	--счетчик для формирования последовательности чисел
	process(number_clk)
	begin
		if falling_edge(number_clk) then
			if (number_counter = "101") then
				number_counter <= (others => '0'); 
			else number_counter <= number_counter + 1;
			end if;
		end if;
	end process;
	
	-- обновляем числа только в начале итерации 
    a_temp <= a when number_counter = "000" AND rising_edge(number_clk);
	 b_temp <= b when number_counter = "000" AND rising_edge(number_clk);
	 c_temp <= c when number_counter = "000" AND rising_edge(number_clk);
	 error_temp <= error when number_counter = "000" AND rising_edge(number_clk);
	 
	 -- подсвечиваем LED - индикаторы в соответствии с отображауемым числом
	 with number_counter select
		digit_led <=   "000001" when "000",
							"000010" when "001",
							"000100" when "010",
							"001000" when "011",
							"010000" when "100",
							"100000" when "101",
							"000000" when others;
	 
	 -- тут без 100 грам не объяснить
	 trans_number_temp <= to_2dig(a_temp) when number_counter = "000" else 
							to_10dig(a_temp) when number_counter = "001" else
							to_2dig(b_temp) when number_counter = "010" else
							to_10dig(b_temp) when number_counter = "011" else
							to_10dig(c_temp) when number_counter = "100" AND error_temp = '0' else
							to_4dig(c_temp) when number_counter = "101" AND error_temp = '0' else
							"111111111111" & "1011" when number_counter = "100" AND error_temp = '1' else
							"111111111111" & "1011" when number_counter = "101" AND error = '1' else
							"1111111111111111";

	trans_number <= trans_number_temp;
	
	with led_en_temp select
		digit_temp <= trans_number_temp(3 downto 0) when "1110",
					trans_number_temp(7 downto 4) when "1101",
					trans_number_temp(11 downto 8) when "1011",
					trans_number_temp(15 downto 12) when others;
					
	digit <= digit_temp;

	with digit_temp select 
		to_led <= "00000011" when "0000",
					 "10011111" when "0001",
					 "00100101" when "0010",
					 "00001101" when "0011",
					 "10011001" when "0100",
					 "01001001" when "0101",
					 "01000001" when "0110",
					 "00011111" when "0111",
					 "11111101" when "1010",
					 "01100001" when "1011",
					 "11111111" when others;

end Behavioral;

