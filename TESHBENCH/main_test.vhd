-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use work.final.all;
  use ieee.std_logic_textio.all;
  USE STD.TEXTIO.ALL;
  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
component main is
	port(clk: in std_logic;
		  key_in: in std_logic;
		  enc: in std_logic;
		  dec: in std_logic;
		  reg: out mem_array;
		  ukey: in std_logic_vector(127 downto 0);
		  AB: in std_logic_vector(63 downto 0);
		  key_rdy: out std_logic;
		  memdata: out mem_array;
		  data_rdy: out std_logic;
		  changeInstruction: in std_logic_vector(31 downto 0);
		  changeAddress: in std_logic_vector(31 downto 0);
		  changecommit: in std_logic
	);
end component;

        SIGNAL clk, key_in, enc, dec, key_rdy, data_rdy, changecommit: std_logic;
        SIGNAL reg,memdata:  mem_array;
		  signal ukey : std_logic_vector(127 downto 0);
		  signal AB: std_logic_vector(63 downto 0);
		  signal changeAddress, changeInstruction: std_logic_vector(31 downto 0);
		  CONSTANT   clk_Period	: Time:= 10 ns;


  BEGIN

  -- Component Instantiation
          uut: main PORT MAP(
				clk => clk,
				enc => enc,
				dec => dec,
				reg => reg,
				memdata => memdata,
				ukey => ukey,
				AB => AB,
				key_rdy => key_rdy,
				key_in => key_in,
				data_rdy => data_rdy,
				changeAddress => changeAddress,
				changecommit => changecommit,
				changeInstruction => changeInstruction
          );

	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	     key_in <= '0';
		  enc <= '0';
		  dec <= '0';
		  -- encryption decryption keyexpansion when ukey = 0 AB = 0 
		  ukey <= x"00000000000000000000000000000000";
		  wait for 100ns;
		  key_in <= '1';
        wait for 100 ns;
		  key_in <= '0';
		  wait for 70000 ns;
		  enc <= '1';
	     wait for 100ns;
		  enc <= '0';
--		  dec <= '1';
--		  wait for 100ns;
--		  dec <= '0';
		  wait;
     END PROCESS;
	  
	  check_result: process
	     file cmdfile: TEXT;
	     variable L: Line;
	     variable good:boolean; --status of the read opeartion
	     variable TIN, TOUT: std_logic_vector(63 downto 0);
		  begin
		  FILE_OPEN(cmdfile, "test_vector_result.txt", READ_MODE);
		  loop
			if endfile(cmdfile) then --check EOF
				assert false
					report "End of file encountered; exiting."
					severity NOTE;
				exit;
			end if;
		
			readline(cmdfile, L);
			next when L'length = 0;
			read(L, TIN, good);
				assert good
					report "Text I/O read error"
					severity ERROR;
					
			read(L, TOUT, good);
				assert good
					report "Text I/O read error"
					severity ERROR;
		
			AB <= TIN;
			wait for clk_period*9000;	
		   
			if (data_rdy = '1') then
				assert (memdata(30)&memdata(31) /= TOUT)
					report "check succeeded"
					severity NOTE;
			end if;
		end loop;
		wait;
				
	end process;
  --  End Test Bench 

  END;