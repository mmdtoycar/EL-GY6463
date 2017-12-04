--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:27:29 12/03/2017
-- Design Name:   
-- Module Name:   E:/AHD/Lab/Final project/mux_test.vhd
-- Project Name:  Finalproject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
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
 
ENTITY mux_test IS
END mux_test;
 
ARCHITECTURE behavior OF mux_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         x : IN  std_logic_vector(0 downto 0);
         y : IN  std_logic_vector(0 downto 0);
         s : IN  std_logic;
         z : OUT  std_logic_vector(0 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(0 downto 0) := (others => '0');
   signal y : std_logic_vector(0 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(0 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          x => x,
          y => y,
          s => s,
          z => z
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x <= "1";
		y <= "0";
		
		wait for 100 ns;
		s <= '0';
      wait for 100 ns;
		s <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
