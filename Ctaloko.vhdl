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
			when others => display1 <= "0000110";
		end Case;
	end process;
end decoder_display;
