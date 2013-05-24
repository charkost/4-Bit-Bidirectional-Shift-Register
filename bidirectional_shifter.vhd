LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY bidirectional_shifter IS
PORT (
	input:		IN STD_LOGIC_VECTOR(3 downto 0);
	clock: 		IN STD_LOGIC;
	serial_right:	IN STD_LOGIC;
	serial_left: 	IN STD_LOGIC;
	sel: 		IN STD_LOGIC_VECTOR(1 downto 0);
	reset: 		IN STD_LOGIC;
	output: 	OUT STD_LOGIC_VECTOR(3 downto 0)
);
END bidirectional_shifter;

ARCHITECTURE dataflow OF bidirectional_shifter IS
  
COMPONENT mux4in1 IS
PORT (
	in1, in2, in3, in4:	IN STD_LOGIC;
	sel: 			IN STD_LOGIC_VECTOR(1 downto 0);  
	output: 		OUT STD_LOGIC
);
END COMPONENT;

COMPONENT dff IS
PORT(	
	data_in:	IN STD_LOGIC;
	clock:		IN STD_LOGIC;
	reset:		IN STD_LOGIC;
	data_out:	OUT STD_LOGIC
);

END COMPONENT; 

SIGNAL muxout: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL dffout: STD_LOGIC_VECTOR(3 downto 0);

BEGIN

mux0: mux4in1 port map(in1=>input(0), in2=>dffout(1), in3=>serial_right, in4=>dffout(0), sel=>sel, output=>muxout(0));
mux1: mux4in1 port map(in1=>input(1), in2=>dffout(2), in3=>dffout(0), in4=>dffout(1), sel=>sel, output=>muxout(1));
mux2: mux4in1 port map(in1=>input(2), in2=>dffout(3), in3=>dffout(1), in4=>dffout(2), sel=>sel, output=>muxout(2));
mux3: mux4in1 port map(in1=>input(3), in2=>serial_left,  in3=>dffout(2), in4=>dffout(3), sel=>sel, output=>muxout(3));
  
dflip0: dff port map(data_in=>muxout(0), clock=>clock, reset=>reset, data_out=>dffout(0));
dflip1: dff port map(data_in=>muxout(1), clock=>clock, reset=>reset, data_out=>dffout(1)); 
dflip2: dff port map(data_in=>muxout(2), clock=>clock, reset=>reset, data_out=>dffout(2)); 
dflip3: dff port map(data_in=>muxout(3), clock=>clock, reset=>reset, data_out=>dffout(3));

output<=dffout;
  
END dataflow;


