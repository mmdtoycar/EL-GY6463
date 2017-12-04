--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:55:28 12/03/2017
-- Design Name:   
-- Module Name:   E:/17 FALL/AHD/Final Project/Final Project/TESHBENCH/Decoder_TB.vhd
-- Project Name:  ass62
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Decoder
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
 
ENTITY Decoder_TB IS
END Decoder_TB;
 
ARCHITECTURE behavior OF Decoder_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Decoder
    PORT(
         instruction : IN  std_logic_vector(31 downto 0);
         wrtEnable : OUT  std_logic;
         isload : OUT  std_logic;
         isStore : OUT  std_logic;
         Itype : OUT  std_logic;
         JMP : OUT  std_logic;
         branch : OUT  std_logic_vector(1 downto 0);
         ALUOP : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal wrtEnable : std_logic;
   signal isload : std_logic;
   signal isStore : std_logic;
   signal Itype : std_logic;
   signal JMP : std_logic;
   signal branch : std_logic_vector(1 downto 0);
   signal ALUOP : std_logic_vector(2 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Decoder PORT MAP (
          instruction => instruction,
          wrtEnable => wrtEnable,
          isload => isload,
          isStore => isStore,
          Itype => Itype,
          JMP => JMP,
          branch => branch,
          ALUOP => ALUOP
        );

   process
   begin 
		instruction <= "00000100000000010000000000000111";--ADDI R1, R0, 7 
		wait FOR 100ns;
		
		instruction <= "00000000100000110010000000010001";--SUB R4, R4, R3 
		wait FOR 100ns;
		
		instruction <= "00000000011000100010000000010010";--AND R4, R2, R3 
		wait FOR 100ns;
		
		instruction <= "00000000011000100010000000010011";--OR R4, R2, R3
		wait FOR 100ns;
		
		instruction <= "00011100011000100000000000000001";--LW R2, 1(R3)
		wait FOR 100ns;
		
		instruction <= "00010100010001000000000000001010";--SHL R4, R2, 10 
		wait FOR 100ns;
		
		instruction <= "00100100100001010000000000000000";  --BLT R5, R4, 0  
		wait FOR 100ns;
		
		instruction <= "00101000000001011111111111111110";--BEQ R5, R0, -2 
		wait FOR 100ns;
		
		instruction <= "00101100100001010000000000000000";--BNE R5, R4, 0 
		wait FOR 100ns;
		
		instruction <= "00110000000000000000000000010100";---JMP 20 
		wait FOR 100ns;
		
		instruction <= "11111100000000000000000000000000";----HAL 
		wait FOR 100ns;
		
		instruction <= "00100000011001000000000000000010";--SW R4, 2(R3)  
		wait for 100ns;
   end process;
 

   

END;
