--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:36:09 12/04/2017
-- Design Name:   
-- Module Name:   E:/AHD/Lab/Final project/PCMUX_test.vhd
-- Project Name:  Finalproject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PCMUX
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
 
ENTITY PCMUX_test IS
END PCMUX_test;
 
ARCHITECTURE behavior OF PCMUX_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PCMUX
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         c : IN  std_logic_vector(31 downto 0);
         NextAddress : OUT  std_logic_vector(31 downto 0);
         sel : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal c : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal NextAddress : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PCMUX PORT MAP (
          a => a,
          b => b,
          c => c,
          NextAddress => NextAddress,
          sel => sel
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		a <= "11111111111111111111111111111111";
		b <= "00000000000000001111111111111111";
		c <= "11111111111111110000000000000000";
		
      -- insert stimulus here 
		wait for 100ns;
		sel <= "00";
		wait for 100ns;
		sel <= "01";
		wait for 100ns;
		sel <= "10";
		wait for 100ns;
		sel <= "11";
		
      wait;
   end process;

END;
