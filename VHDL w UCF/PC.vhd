------------------------------------------------------
-- Program Counter component
--
-- Points to address of next instruction to run and returns
-- that address in current_address.
------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_arith.ALL;

entity pc is
	port(
		clk: in std_logic;
		enc, dec: in std_logic;
		key_in: in std_logic;
		sample : in std_logic;
		NextAddress: in std_logic_vector(31 downto 0);
		CurrentAddress: out std_logic_vector(31 downto 0);
		data_rdy: out std_logic;
		key_rdy: out std_logic
		--control: out std_logic_vector (3 downto 0)
	);
end pc;

architecture beh of pc is
	type state is (IDLE,RUNNING);
	signal s1: state;
	signal address: std_logic_vector(31 downto 0);
	signal nextadd: std_logic_vector(31 downto 0);
	signal ctrl: std_logic_vector (3 downto 0);
begin
	ctrl <= sample & key_in & enc & dec;
	with ctrl select
	nextadd <= "00000000000000000000000000000000" WHEN "1000",  --0
				  "00000000000000000000000110010000" WHEN "0100", --100
				  "00000000000000000000001001011000" when "0010", --150
				  "00000000000000000000001100100000" when "0001", --200 
				  NextAddress when others; 
				  
	process(clk)
		begin
   	if (clk'event and clk = '1') then
			address <= nextadd;
		end if;
	end process;
	CurrentAddress <= address;
				  
	process(clk, NextAddress)
		begin
			if(clk'event and clk = '1') then
				case s1 is
					when IDLE => 
						-- if key_in = '1' go running set nextaddress to 0
						if(key_in = '1') then
							s1 <= RUNNING;
							key_rdy <= '0';
							data_rdy <= '0';
						elsif(enc = '1') then
							s1 <= RUNNING;
						elsif(dec ='1') then
							s1 <= RUNNING;
						elsif(sample ='1') then
							s1 <= RUNNING;
						end if;
					when RUNNING => 
					   if(NextAddress = "00000000000000000000000110001100") then --99
							s1 <= IDLE;	
						elsif(NextAddress = "00000000000000000000001001010100") then --149
							s1 <= IDLE;	
							key_rdy <= '1';
						ELSIF(NextAddress = "00000000000000000000001100011100") then --199
							s1 <= IDLE;
							data_rdy <= '1';
						ELSIF(NextAddress = "00000000000000000000001111100100") then --249
							s1 <= IDLE;
						END IF;
				end case;
			end if;
		end process;
		--control <= ctrl;
end beh;
