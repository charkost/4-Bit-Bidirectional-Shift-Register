LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dff IS
PORT(
data_in:		IN STD_LOGIC;
clock:		IN STD_LOGIC;
reset:		IN STD_LOGIC;
data_out:	OUT STD_LOGIC
);
END dff;

ARCHITECTURE behv OF dff IS
BEGIN

  PROCESS(data_in, clock)
  BEGIN
    
    IF (clock='1' AND clock'event) THEN
	   IF reset='1' THEN
	     data_out<='0';
	   ELSE
	     data_out <= data_in;
	   END IF;
    END IF;

  END PROCESS;	

END behv;