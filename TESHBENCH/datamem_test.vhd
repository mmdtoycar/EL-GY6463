--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:43:54 12/03/2017
-- Design Name:   
-- Module Name:   E:/17 FALL/AHD/Final Project/Final Project/TESTBENCH/DataMem1.vhd
-- Project Name:  TESTBENCHES
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DataMem
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
use IEEE.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DataMem1 IS
END DataMem1;
 
ARCHITECTURE behavior OF DataMem1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMem
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         WriteMem : IN  std_logic;
         ReadMem : IN  std_logic;
         Clk : IN  std_logic;
         ReadData : OUT  std_logic_vector(31 downto 0);
         key_in : IN  std_logic;
         memdata : OUT  mem_array;
         ukey : IN  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteMem : std_logic := '0';
   signal ReadMem : std_logic := '0';
   signal Clk : std_logic := '0';
   signal key_in : std_logic := '0';
   signal ukey : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);
   signal memdata : mem_array;

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMem PORT MAP (
          address => address,
          WriteData => WriteData,
          WriteMem => WriteMem,
          ReadMem => ReadMem,
          Clk => Clk,
          ReadData => ReadData,
          key_in => key_in,
          memdata => memdata,
          ukey => ukey
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		ReadMem <='0';
		key_in  <= '0';

	  wait for Clk_period*10;
		address <= "00000000000000000000000000000001";
		WriteData <= (others => '0');
		WriteMem <= '0';
		ReadMem <='1';
		key_in  <= '1';
		ukey <= (others => '0');
      
		wait for Clk_period*10;
		address <= (others => '0');
		WriteData <= "00000000000000000000000000000001";
		WriteMem <= '1';
		ReadMem <='0';
		key_in  <= '1';
		ukey <= (others => '0');
   end process;

END;
