library iee, myLibrary;
USE IEEE.std_logic_1164.all;
use myLibrary.jordan.all;
Entity Maquina is
	Port(
		start: in std_logic;
		stop: in std_logic;
		reset: in std_logic;
		clk: in std_logic;
		state: inout std_logic;
		cont: out std_logic 
	);
end Maquina

Architecture Maquina_arc of Maquina is
	signal aux = Natural :0;
	begin 
		Process(start, reset, clk, stop) is
			Begin
				if reset = '0' then
					state <= incial;
					aux <= 0;
				elsif state = inicial then
					if start event and start = '0' then
						state <= contagem;
					end if;
				elsif (clk Event and clk = '1') then
					if aux < 15 then
						aux <= aux + 1;
					end if;
				end if;
		end Process;
		cont <= aux;
End Maquina_arc; 
