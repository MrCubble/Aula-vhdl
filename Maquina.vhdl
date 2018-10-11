library ieee;
USE IEEE.std_logic_1164.all;
Entity Maquina is
	Port(
		start: in std_logic;
		stop: in std_logic;
		reset: in std_logic;
		clk: in std_logic;
		cont: out natural := 0 
	);
end Maquina;

Architecture Maquina_arc of Maquina is
	signal aux: Natural :=0;
	begin 
		Process(start, reset, clk, stop) is
				variable state: natural :=0;
			Begin
				if reset = '0' then
					state := 0;
					aux <= 0;
				elsif state = 0 then
					if start 'event and start = '0' then
						state := 1;
					end if;
				elsif (clk 'Event and clk = '1') then
					if aux < 15 then
						aux <= aux + 1;
					end if;
				end if;
		end Process;
		cont <= aux;
End Maquina_arc; 
