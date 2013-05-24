LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY mux4in1 IS
PORT (
	in1, in2, in3, in4:	IN STD_LOGIC;
	sel:			IN STD_LOGIC_VECTOR(1 downto 0);  
	output:			OUT STD_LOGIC
);
END mux4in1;

ARCHITECTURE dataflow OF mux4in1 IS
BEGIN

WITH sel SELECT output <=
  in1 when "00", 
  in2 when "01",
  in3 when "10",
  in4 when "11",  
  'X' when others;

END dataflow;


