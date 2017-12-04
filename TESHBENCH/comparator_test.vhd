--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:36:53 12/03/2017
-- Design Name:   
-- Module Name:   C:/Users/yzwan/Dropbox/17Fall/AHD_SPERATE/comparator/comparator_test.vhd
-- Project Name:  comparator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Comparator
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
 
ENTITY comparator_test IS
END comparator_test;
 
ARCHITECTURE behavior OF comparator_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Comparator
    PORT(
         branch : IN  std_logic_vector(1 downto 0);
         comp1 : IN  std_logic_vector(31 downto 0);
         comp2 : IN  std_logic_vector(31 downto 0);
         Gobranch : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal branch : std_logic_vector(1 downto 0) := (others => '0');
   signal comp1 : std_logic_vector(31 downto 0) := (others => '0');
   signal comp2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Gobranch : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Comparator PORT MAP (
          branch => branch,
          comp1 => comp1,
          comp2 => comp2,
          Gobranch => Gobranch
        );

   -- Clock process definitions
   process
   begin
		branch <= "01";
		comp1 <= "00000000000000000000000000000001";
		comp2 <= "00000000000000000000011111111111";
		wait for 100ns;
		branch <= "10";
		comp1 <= "00000000000000000000000000000001";
		comp2 <= "00000000000000000000000000000001";
		wait for 100ns;
		branch <= "11";
		comp1 <= "00000000001111111111111110000001";
		comp2 <= "00000000000000000111111111111111";
		wait for 100ns;
		branch <= "11";
		comp1 <= "00000000000000000111111111111111";
		comp2 <= "00000000000000000111111111111111";
		wait;
   end process;
 
END;
