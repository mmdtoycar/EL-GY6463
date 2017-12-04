--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:11:41 12/03/2017
-- Design Name:   
-- Module Name:   E:/AHD/Lab/Final project/signextend_test.vhd
-- Project Name:  Finalproject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SignExtend
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
 
ENTITY signextend_test IS
END signextend_test;
 
ARCHITECTURE behavior OF signextend_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SignExtend
    PORT(
         x : IN  std_logic_vector(15 downto 0);
         y : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal y : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SignExtend PORT MAP (
          x => x,
          y => y
        );

   -- Clock process definitions


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x <= "1111111111111111";
		
		wait for 100 ns;
		x <= "0000000000000000";

      -- insert stimulus here 

      wait;
   end process;

END;
