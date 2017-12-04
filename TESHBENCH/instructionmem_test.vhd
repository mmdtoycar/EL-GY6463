--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:13:42 12/03/2017
-- Design Name:   
-- Module Name:   E:/17 FALL/AHD/Final Project/Final Project/TESTBENCH/InstructionMem_TB.vhd
-- Project Name:  TESTBENCHES
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: InstructionMem
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
 
ENTITY InstructionMem_TB IS
END InstructionMem_TB;
 
ARCHITECTURE behavior OF InstructionMem_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT InstructionMem
    PORT(
         clk : IN  std_logic;
         ReadAddress : IN  std_logic_vector(31 downto 0);
         instruction : OUT  std_logic_vector(31 downto 0);
         LastInsAddress : OUT  std_logic_vector(31 downto 0);
         changeInstruction : IN  std_logic_vector(31 downto 0);
         changeAddress : IN  std_logic_vector(31 downto 0);
         changecommit : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ReadAddress : std_logic_vector(31 downto 0) := (others => '0');
   signal changeInstruction : std_logic_vector(31 downto 0) := (others => '0');
   signal changeAddress : std_logic_vector(31 downto 0) := (others => '0');
   signal changecommit : std_logic := '0';

 	--Outputs
   signal instruction : std_logic_vector(31 downto 0);
   signal LastInsAddress : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: InstructionMem PORT MAP (
          clk => clk,
          ReadAddress => ReadAddress,
          instruction => instruction,
          LastInsAddress => LastInsAddress,
          changeInstruction => changeInstruction,
          changeAddress => changeAddress,
          changecommit => changecommit
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
   process
   begin		
      changecommit <= '0';
      wait for 100 ns;	

      wait for clk_period*10;

       ReadAddress <= "00000000000000000000000000000001";
       changeInstruction <= "00000000000000000000000011000001";
       changeAddress <= "00000000000000000000000000000001";
		 changecommit <= '1';


      wait;
   end process;

END;
