library IEEE; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity decodificador_dec_7_seg is port(
	display_dec: in natural;
	display1: out std_logic_vector (6 downto 0);
	display2: out std_logic_vector (6 downto 0)
	);
end entity decodificador_dec_7_seg;

Architecture decoder_display of decodificador_dec_7_seg is
	signal aux1: natural :=0;
	signal aux2: natural :=0;
	signal convertido : natural :=0;
Begin 
	convertido <= display_dec;
	aux1<= convertido - 10*(convertido/10);
	aux2<= convertido/10;
	Process(display_dec)
	Begin
		Case aux1 is 
			when 0 => display1 <= "0000001";
			when 1 => display1 <= "1001111";
			when 2 => display1 <= "0010010";
			when 3 => display1 <= "0000110";
			when 4 => display1 <= "1001100";
			when 5 => display1 <= "0100100";
			when 6 => display1 <= "0100000";
			when 7 => display1 <= "0001111";
			when 8 => display1 <= "0000000";
			when 9 => display1 <= "0000100";
			when others => display1 <= "1111111";
		end Case;
		
		Case aux2 is 
			when 0 => display2 <= "0000001";
			when 1 => display2 <= "1001111";
			when 2 => display2 <= "0010010";
			when 3 => display2 <= "0000110";
			when 4 => display2 <= "1001100";
			when 5 => display2 <= "0100100";
			when 6 => display2 <= "0100000";
			when 7 => display2 <= "0001111";
			when 8 => display2 <= "0000000";
			when 9 => display2 <= "0000100";
			when others => display2 <= "1111111";
		end Case;
	end process;
end decoder_display;
