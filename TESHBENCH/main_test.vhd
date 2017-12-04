--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:55:12 12/02/2017
-- Design Name:   
-- Module Name:   C:/ahd/part1/test_main.vhd
-- Project Name:  part1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY test_main IS
END test_main;
 
ARCHITECTURE behavior OF test_main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clk : IN  std_logic;
         key_in : IN  std_logic;
         enc : IN  std_logic;
         dec : IN  std_logic;
			sample : in std_logic;
         reg : OUT  mem_array;
         ukey : IN  std_logic_vector(127 downto 0);
         AB : IN  std_logic_vector(63 downto 0);
         key_rdy : OUT  std_logic;
         memdata : OUT  mem_array;
         data_rdy : OUT  std_logic;
         changeInstruction : IN  std_logic_vector(31 downto 0);
         changeAddress : IN  std_logic_vector(31 downto 0);
         changecommit : IN  std_logic;
			PC_value: out std_logic_vector (31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal key_in : std_logic := '0';
   signal enc : std_logic := '0';
   signal dec : std_logic := '0';
   signal ukey : std_logic_vector(127 downto 0) := (others => '0');
   signal AB : std_logic_vector(63 downto 0) := (others => '0');
   signal changeInstruction : std_logic_vector(31 downto 0) := (others => '0');
   signal changeAddress : std_logic_vector(31 downto 0) := (others => '0');
   signal changecommit : std_logic := '0';
   signal sample : std_logic;
 	--Outputs
   signal reg : mem_array;
   signal key_rdy : std_logic;
   signal memdata : mem_array;
   signal data_rdy : std_logic;
   signal PC_value: std_logic_vector (31 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clk => clk,
          key_in => key_in,
          enc => enc,
          dec => dec,
			 sample => sample,
          reg => reg,
          ukey => ukey,
          AB => AB,
          key_rdy => key_rdy,
          memdata => memdata,
          data_rdy => data_rdy,
          changeInstruction => changeInstruction,
          changeAddress => changeAddress,
          changecommit => changecommit,
			 PC_value => PC_value
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	process 
	begin
	   key_in <= '0';
		wait;
	end process;
	
	process
	begin
	   enc <= '0';
		wait;
	end process;
	
	process
	begin
	   sample <= '0';
		--wait for clk_period*4;
		wait for clk_period*21;
		sample <= '1';
		wait for clk_period;
		sample <= '0';
		wait;
	end process;
	
	process 
	begin
	   dec <= '0';
		wait;
	end process;
	
	process
	begin
	   ukey <= x"00000000000000000000000000000000";
		wait;
	end process;
	
	process
	begin
	   AB <= x"0000000000000000";
		wait; 
	end process;
	
	process
	begin
	---sample code 1
--	   changeInstruction <= "00000100000000010000000000000111";
--		wait for clk_period ;
--		changeInstruction <= "00000100000000100000000000001000";
--		wait for clk_period ;
--		changeInstruction <= "00000000010000010001100000010000";
--		wait for clk_period ;
--		changeInstruction <= "11111100000000000000000000000000";
--		wait;
	
	---sample code 2
		changeInstruction <= "00000100000000010000000000000010";
		wait for clk_period ;
		changeInstruction <= "00000100000000110000000000001010";
		wait for clk_period ;
		changeInstruction <= "00000100000001000000000000001110";
		wait for clk_period;
		changeInstruction <= "00000100000001010000000000000010";
		wait for clk_period ;
		changeInstruction <= "00100000011001000000000000000010";
		wait for clk_period ;
		changeInstruction <= "00100000011000110000000000000001";
		wait for clk_period ;
		changeInstruction <= "00000000100000110010000000010001";
		wait for clk_period ;
		changeInstruction <= "00001000000001000000000000000001";
		wait for clk_period ;
		changeInstruction <= "00000000011000100010000000010010";
		wait for clk_period ;
		changeInstruction <= "00001100010001000000000000001010";
		wait for clk_period ;
		changeInstruction <= "00000000011000100010000000010011";
		wait for clk_period ;
		changeInstruction <= "00011100011000100000000000000001";
		wait for clk_period;
		changeInstruction <= "00010000010001000000000000001010";
		wait for clk_period ;
		changeInstruction <= "00000000011000100010000000010100";
		wait for clk_period ;
		changeInstruction <= "00010100010001000000000000001010";
		wait for clk_period ;
		changeInstruction <= "00011000010001000000000000001010";
		wait for clk_period ;
		changeInstruction <= "00101000000001011111111111111110";
		wait for clk_period ;
		changeInstruction <= "00100100100001010000000000000000";
		wait for clk_period ;
		
		changeInstruction <= "00101100100001010000000000000000";
		wait for clk_period ;
		changeInstruction <= "00110000000000000000000000010100";
		wait for clk_period ;
		changeInstruction <= "11111100000000000000000000000000";
		wait  ;
		
	end process;
   
 process
	begin
	   changeAddress <= x"00000000";
		wait for clk_period;
		changeAddress <= x"00000001";
		wait for clk_period;
		changeAddress <= x"00000002";
		wait for clk_period ;
		changeAddress <= x"00000003";
		wait for clk_period;
		changeAddress <= x"00000004";
		wait for clk_period;
		changeAddress <= x"00000005";
		wait for clk_period;
		changeAddress <= x"00000006";
		wait for clk_period ;
		changeAddress <= x"00000007";
		wait for clk_period;
		changeAddress <= x"00000008";
		wait for clk_period;
		changeAddress <= x"00000009";
		wait for clk_period;
		changeAddress <= x"0000000a";
		wait for clk_period ;
		changeAddress <= x"0000000b";
		wait for clk_period;
		changeAddress <= x"0000000c";
		wait for clk_period;
		changeAddress <= x"0000000d";
		wait for clk_period;
		changeAddress <= x"0000000e";
		wait for clk_period ;
		changeAddress <= x"0000000f";
		wait for clk_period;
		changeAddress <= x"00000010";
		wait for clk_period;
		changeAddress <= x"00000011";
		wait for clk_period;
		changeAddress <= x"00000012";
		wait for clk_period ;
		changeAddress <= x"00000013";
		wait for clk_period;
		changeAddress <= x"00000014";
		wait for clk_period;
		changeAddress <= x"00000015";
		wait;
	end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      changecommit <= '1';
 
      -- insert stimulus here 

      wait;
   end process;

END;
