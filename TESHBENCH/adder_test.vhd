--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:15:48 12/03/2017
-- Design Name:   
-- Module Name:   C:/Users/yzwan/Dropbox/17Fall/AHD_SPERATE/Adder/adder_test.vhd
-- Project Name:  Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_test IS
END adder_test;
 
ARCHITECTURE behavior OF adder_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Adder
    PORT(
         add1 : IN  std_logic_vector(31 downto 0);
         add2 : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal add1 : std_logic_vector(31 downto 0) := (others => '0');
   signal add2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Adder PORT MAP (
          add1 => add1,
          add2 => add2,
          output => output
        );


	process
		begin
		-- "Case1"
		add1 <= "00000000000000000000000000000111";
		add2 <= "00000000000000000000000000000001";
		wait for 100ns;
		-- "Case2"
		add1 <= "00000000000000000000000000000001";
		add2 <= "00000000000000000000000000000001";
		wait;
   end process;	

END;
