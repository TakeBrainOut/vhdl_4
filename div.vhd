----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:54 03/14/2016 
-- Design Name: 
-- Module Name:    div - Behavioral 
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

entity div is
	 Generic( n: INTEGER := 3);
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           CLK : in  STD_LOGIC;
			  A_out:out STD_LOGIC_VECTOR (3 downto 0);
			  B_out:out STD_LOGIC_VECTOR (3 downto 0);
           C : out  STD_LOGIC_VECTOR (7 downto 0);
			  error: out STD_LOGIC);
end div;

architecture Behavioral of div is

	signal a_temp: STD_LOGIC_VECTOR (3 downto 0);
	signal b_temp: STD_LOGIC_VECTOR (3 downto 0);
	signal c_temp_out: STD_LOGIC_VECTOR (7 downto 0);
	function minus_zero_check(x: STD_LOGIC_VECTOR (3 downto 0)) return STD_LOGIC_VECTOR is
		begin
			if (x /= "1000" ) then
				return x;
			else return "0000";
			end if;
	end function minus_zero_check;

	
begin
	a_temp <= A when rising_edge(CLK);
	b_temp <= B when rising_edge(CLK);
	
	A_out <= minus_zero_check(a_temp);
	B_out <= minus_zero_check(b_temp);
	C <= a_temp * b_temp when rising_edge(CLK);

	process(A,B, CLK)
		variable temp1: integer range -8 to 8;
		variable temp2: integer range -8 to 8;
		variable C_temp: STD_LOGIC_VECTOR (3 downto 0);
		
		function complete_to_binary(x: STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
		begin
			if (x(3) = '1') then
				return '0' & std_logic_vector(unsigned(not(x(2 downto 0))) + 1);
			end if;
			
			
			return x;
		end function complete_to_binary;
		
		function binary_to_complete(x: STD_LOGIC_VECTOR(3 downto 0)) return STD_LOGIC_VECTOR is
		begin
			if (x(3) = '1') then
				return '1' & std_logic_vector(unsigned(not(x(2 downto 0))) + 1);
			end if;
			return x;
		end function binary_to_complete;		
		
		function to_int(x: STD_LOGIC_VECTOR(3 downto 0)) return integer is
			variable result: integer range -8 to 8 := 0;
		begin
			for i in n - 1 downto 0 loop
				if (x(i) = '1') then 
					result := result + 2 ** i;
				end if;
			end loop;
			if x(3) = '1' then result := - result;
			end if;
			return result;
		end function to_int;		

		
	begin
		temp1 := to_int(complete_to_binary(a_temp));
		temp2 := to_int(complete_to_binary(b_temp));
		if (temp2 = 0) then error <= '1';
		else error <= '0';
		end if;
		for i in n downto 0 loop
			if (temp1 >= temp2 * 2 ** i) then
				C_temp(i) := '1';
				temp1 := temp1 - temp2 * 2 ** i;
			else C_temp(i) := '0';
			end if;
		end loop;
		if ((A(3) = '1' AND B(3) = '0') OR (A(3) = '0' AND B(3) = '1')) then
			c_temp := binary_to_complete('1' & C_temp(2 downto 0));
		elsif (A = "0000") then
			C_temp := (others => '0');
		end if;
		c_temp_out <= minus_zero_check(c_temp);
	end process;
end Behavioral;

