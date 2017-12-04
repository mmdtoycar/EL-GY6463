--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:33:08 12/02/2017
-- Design Name:   
-- Module Name:   C:/Users/yzwan/Dropbox/17Fall/AHD_SPERATE/ALU/test_alu.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY test_alu IS
END test_alu;
 
ARCHITECTURE behavior OF test_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         Oprand1 : IN  std_logic_vector(31 downto 0);
         Oprand2 : IN  std_logic_vector(31 downto 0);
         ALUOP : IN  std_logic_vector(2 downto 0);
         ALUResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Oprand1 : std_logic_vector(31 downto 0) := (others => '0');
   signal Oprand2 : std_logic_vector(31 downto 0) := (others => '0');
   signal ALUOP : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal ALUResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          Oprand1 => Oprand1,
          Oprand2 => Oprand2,
          ALUOP => ALUOP,
          ALUResult => ALUResult
        );

	process
   begin
		-- "RightShift"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "111";
		wait for 100ns;
		-- "LeftShift"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "110";
		wait for 100ns;
		-- "+"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "001";
		wait for 100ns;
		-- "-"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "010";		
		wait for 100ns;
		-- "and"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "011";		
		wait for 100ns;
		-- "or"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "100";
		wait for 100ns;
		-- "nor"
		Oprand1 <= "00000000000000000000000000000111";
		Oprand2 <= "00000000000000000000000000000001";
		ALUOP <= "101";
		wait;
   end process;	

END;
