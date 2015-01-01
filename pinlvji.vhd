library ieee;
use ieee.std_logic_1164.all;  	 
entity pinlvji is                     
port ( clkk : in std_logic;
	    fsin : in std_logic;
		 
		 key1,key2 : in std_logic; 
	    qout : out std_logic_vector(55 downto 0)
	  );
end entity pinlvji;                         
architecture  bhv of pinlvji is       	
 component  TESTCTL
 	port ( clk : in std_logic;
	       clr : out std_logic;
	       load : out std_logic;
	       ena : out std_logic
	      );
 end component;
 component DIV5 
 	port(clkk : in std_logic;
 		k_or,k1,k2: out std_logic
         );
 end component;
 component DIV10 
	port (clkk : in std_logic;
	         k : out std_logic
	      );
 end component;
 component CNT10
 	port( fin: in std_logic;
		  clr: in std_logic;
		  ena: in std_logic;
		  cout: out std_logic;
		  dout:out std_logic_vector(3 downto 0)
		  );
 end component;
 component REG32B
 	port( load : in std_logic;
		  din : in std_logic_vector(31 downto 0);
		  fout:out std_logic_vector(31 downto 0)
		 );
 end component;
 component MUX41A
	port( a,b,c,d,s0,s1 : in std_logic;
	                  y : out std_logic
	     );
 end component;
 component DECL7S
 	port( A : in std_logic_vector(3 downto 0);
	      LED7S : out std_logic_vector(6 downto 0)
	     );
 end component;
 
 signal net1,net2,net3,net5 : std_logic;
 signal net4 : std_logic_vector(31 downto 0);
 signal a1,a2,a3,a4,a5,a6,a7,a8 : std_logic;
 signal b1,b2,b3,b4,b5,b6,b7,b8 : std_logic_vector(3 downto 0);
 signal c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12 : std_logic;
 signal d1,d2,d3,d4,d5,d6,d7,d8 : std_logic_vector(3 downto 0);
 
 begin
   u1 : DIV5  port map (clkk=>clkk,k_or=>c1);
   u2 : DIV10 port map (clkk=>c1,k=>c2);		
   u3 : DIV10 port map (clkk=>c2,k=>c3);  
   u4 : DIV10 port map (clkk=>c3,k=>c4);
   u5 : DIV10 port map (clkk=>c4,k=>c5);
   u6 : DIV10 port map (clkk=>c5,k=>c6);
   u7 : DIV10 port map (clkk=>c6,k=>c7);
   u8 : DIV10 port map (clkk=>c7,k=>c8);
   u9  : DIV5  port map (clkk=>fsin,k_or=>c9);
   u10 : DIV10 port map (clkk=>fsin,k=>c10);
   u11 : DIV10 port map (clkk=>c9,k=>c11);
   u12 : TESTCTL port map(clk=>c8,load=>net1,
                         clr=>net2,ena=>net3);
   u13 : MUX41A port map (a=>fsin,b=>c9,c=>c10,d=>c11,
                          s0=>key1,s1=>key2,y=>net5);
   u14 : DECL7S port map(A=>d1,LED7S=>qout(6 downto 0));
   u15 : DECL7S port map(A=>d2,LED7S=>qout(13 downto 7));
   u16 : DECL7S port map(A=>d3,LED7S=>qout(20 downto 14));
   u17 : DECL7S port map(A=>d4,LED7S=>qout(27 downto 21));
   u18 : DECL7S port map(A=>d5,LED7S=>qout(34 downto 28));
   u19 : DECL7S port map(A=>d6,LED7S=>qout(41 downto 35));
   u20 : DECL7S port map(A=>d7,LED7S=>qout(48 downto 42));
   u21 : DECL7S port map(A=>d8,LED7S=>qout(55 downto 49));
   u22 : CNT10 port map(clr=>net2,ena=>net3,fin=>net5,
                        cout=>a1,dout=>b1);
   u23 : CNT10 port map(clr=>net2,ena=>net3,fin=>a1,
                        cout=>a2,dout=>b2);
   u24 : CNT10 port map(clr=>net2,ena=>net3,fin=>a2,
                        cout=>a3,dout=>b3);
   u25 : CNT10 port map(clr=>net2,ena=>net3,fin=>a3,
                        cout=>a4,dout=>b4);
   u26 : CNT10 port map(clr=>net2,ena=>net3,fin=>a4,
                        cout=>a5,dout=>b5);
   u27 : CNT10 port map(clr=>net2,ena=>net3,fin=>a5,
                        cout=>a6,dout=>b6);
   u28 : CNT10 port map(clr=>net2,ena=>net3,fin=>a6,
                        cout=>a7,dout=>b7);
   u29 : CNT10 port map(clr=>net2,ena=>net3,fin=>a7,
                        dout=>b8);
   u30 : REG32B port map (load=>net1,
	                              din( 3 downto  0)=>b1,
								  din( 7 downto  4)=>b2,
								  din(11 downto  8)=>b3,
								  din(15 downto 12)=>b4,
								  din(19 downto 16)=>b5,
								  din(23 downto 20)=>b6,
								  din(27 downto 24)=>b7,
								  din(31 downto 28)=>b8,
								  fout( 3 downto  0)=>d1,
								  fout( 7 downto  4)=>d2,
								  fout(11 downto  8)=>d3,
								  fout(15 downto 12)=>d4,
								  fout(19 downto 16)=>d5,
								  fout(23 downto 20)=>d6,
								  fout(27 downto 24)=>d7,
								  fout(31 downto 28)=>d8);
end architecture bhv;
