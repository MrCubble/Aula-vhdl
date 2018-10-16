library ieee;
USE IEEE.std_logic_1164.all;
Entity Maquina is
	Port(
		start: in std_logic;
		stop: in std_logic;
		reset: in std_logic;
		clk: in std_logic;
		led_RED:out std_logic;
		led_YELLOW:out std_logic;
		led_GREEN:out std_logic;
		led_PGREEN:out std_logic;
		led_PRED:out std_logic;
		cont: out natural := 0 
	);
end Maquina;

Architecture Maquina_arc of Maquina is
	signal aux: Natural :=0;
	begin 
		Process(start, reset, clk, stop) is
				variable state: natural :=0;
				variable case: natural :=0;
				variable pisca: natural :=0;
			Begin
				if reset = '0' then
					state := 0;
					aux <= 0;
					led_RED<=0;
					led_YELLOW<=0;
					led_GREEN<=0;
					led_PGREEN <=0;
					led_PRED <=0;
				elsif state = 0 then
					if start 'event and start = '0' then
						state := 1;
						case:= 1;
						led_GREEN<=1;
						LED_PRED<=1;
					end if;
				elsif (clk 'Event and clk = '1' and case=1) then
					if aux < 3 then
						aux <= aux + 1;
					end if;
					case = 2;
				elsif (clk 'Event and clk = '1' and case=2) then
					led_YELLOW <= 1;
					if (aux < 3 and pisca=0) then
						aux <= aux + 1;
						led_PRED<= pisca;
						pisca :=1; 
					end if;
					if (aux < 3 and pisca=1) then
						aux <= aux + 1;
						led_PRED<= pisca;
						pisca :=0; 
					end if;
					case = 3;
				elsif (clk 'Event and clk = '1' and case=3) then
					led_YELLOW <= 0;
					led_PRED <=  0;
					led_PGREEN <= 1;
					led_RED <= 1;
					if aux < 3 then
						aux <= aux + 1;
					end if;
					case = 4;
				elsif (clk 'Event and clk = '1' and case=5) then
					led_RED <= 1;
					if (aux < 3 and pisca=0) then
						aux <= aux + 1;
						led_PGREEN<= pisca;
						pisca :=1; 
					end if;
					if (aux < 3 and pisca=1) then
						aux <= aux + 1;
						led_PGREEN<= pisca;
						pisca :=0; 
					end if;
					case = 6;
				elsif (clk 'Event and clk = '1' and case=4) then
					led_YELLOW <= 0;
					led_PRED <=  0;
					led_PGREEN <= 1;
					led_RED <= 1;
					if aux < 3 then
						aux <= aux + 1;
					end if;
					case = 5;
				elsif (clk 'Event and clk = '1' and case=4) then
					led_YELLOW <= 0;
					led_PRED <=  0;
					led_PGREEN <= 0;
					led_RED <= 0;
					if aux < 3 then
						aux <= aux + 1;
					end if;
					state = 0;
				end if;
		end Process;
		cont <= aux;
End Maquina_arc; 
