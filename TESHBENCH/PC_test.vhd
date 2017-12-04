--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:48:21 12/03/2017
-- Design Name:   
-- Module Name:   E:/AHD/Lab/Final project/PC_test.vhd
-- Project Name:  Finalproject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc
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
 
ENTITY PC_test IS
END PC_test;
 
ARCHITECTURE behavior OF PC_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc
    PORT(
         clk : IN  std_logic;
         enc : IN  std_logic;
         dec : IN  std_logic;
         key_in : IN  std_logic;
         NextAddress : IN  std_logic_vector(31 downto 0);
         CurrentAddress : OUT  std_logic_vector(31 downto 0);
         data_rdy : OUT  std_logic;
         key_rdy : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal enc : std_logic := '0';
   signal dec : std_logic := '0';
   signal key_in : std_logic := '0';
   signal NextAddress : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CurrentAddress : std_logic_vector(31 downto 0);
   signal data_rdy : std_logic;
   signal key_rdy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc PORT MAP (
          clk => clk,
          enc => enc,
          dec => dec,
          key_in => key_in,
          NextAddress => NextAddress,
          CurrentAddress => CurrentAddress,
          data_rdy => data_rdy,
          key_rdy => key_rdy
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		key_in <= '1';
		wait for clk_period*10;
		NextAddress <= "00000000000000000000000101000000";
      wait for clk_period*10;
		key_in <= '0';
		enc <= '1';
		wait for clk_period*10;
		NextAddress <= "00000000000000000000001011010000";
		wait for clk_period*10;
		enc <= '0';
		dec <= '1';
		wait for clk_period*10;
		NextAddress <= "00000000000000000000010001100000";
      -- insert stimulus here 

      wait;
   end process;

END;
