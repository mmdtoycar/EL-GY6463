--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:16:30 12/03/2017
-- Design Name:   
-- Module Name:   E:/AHD/Lab/Final project/registerfile_test.vhd
-- Project Name:  Finalproject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
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
use work.final.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY registerfile_test IS
END registerfile_test;
 
ARCHITECTURE behavior OF registerfile_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
	 
    COMPONENT RegisterFile
    PORT(
         clk : IN  std_logic;
         WrtEnable : IN  std_logic;
         reg : OUT  mem_array;
         enc : IN  std_logic;
         dec : IN  std_logic;
         key_in : IN  std_logic;
         AB : IN  std_logic_vector(63 downto 0);
         RdReg1 : IN  std_logic_vector(4 downto 0);
         RdReg2 : IN  std_logic_vector(4 downto 0);
         WrtReg : IN  std_logic_vector(4 downto 0);
         WrtData : IN  std_logic_vector(31 downto 0);
         RdData1 : OUT  std_logic_vector(31 downto 0);
         RdData2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal WrtEnable : std_logic := '0';
   signal enc : std_logic := '0';
   signal dec : std_logic := '0';
   signal key_in : std_logic := '0';
   signal AB : std_logic_vector(63 downto 0) := (others => '0');
   signal RdReg1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RdReg2 : std_logic_vector(4 downto 0) := (others => '0');
   signal WrtReg : std_logic_vector(4 downto 0) := (others => '0');
   signal WrtData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal reg : mem_array;
   signal RdData1 : std_logic_vector(31 downto 0);
   signal RdData2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          clk => clk,
          WrtEnable => WrtEnable,
          reg => reg,
          enc => enc,
          dec => dec,
          key_in => key_in,
          AB => AB,
          RdReg1 => RdReg1,
          RdReg2 => RdReg2,
          WrtReg => WrtReg,
          WrtData => WrtData,
          RdData1 => RdData1,
          RdData2 => RdData2
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
		AB <= "1111111111111111000000000000000000000000000000001111111111111111";
		WrtData <= "11111111111111111111111111111111";
		key_in <= '1';
      wait for clk_period*10;
		key_in <= '0';
		enc <= '1';
		wait for clk_period*10;
		enc <= '0';
		dec <= '1';
		wait for clk_period*10;
		dec <= '0';
		WrtEnable <= '1';
      -- insert stimulus here 

      wait;
   end process;

END;
