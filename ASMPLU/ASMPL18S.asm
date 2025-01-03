;** Z-80(tm) DISASSEMBLER V1.31beta1+DEV - (c) 2015-22 GmEsoft, All rights reserved. **
;
;	Wed Mar 22 15:06:09 2023
;
;	Disassembly of : ORIG/ASMPL18S.CMD
;	Equates file   : ASMPL18S.EQU
;	Screening file : ASMPL18S.SCR

D0000	EQU	0000H		; 0000 or EDTASM cmd B - Basic
D0001	EQU	0001H
D0004	EQU	0004H
D0005	EQU	0005H
D0006	EQU	0006H
RST08	EQU	0008H		; ZBUG breakpoint
D000A	EQU	000AH
RST10	EQU	0010H		;
D0011	EQU	0011H
KBDSCN	EQU	002BH		; Scan keyboard
VDCHAR	EQU	0033H		; Disp char in A
PRCHAR	EQU	003BH		; Print char in A
KBWAIT	EQU	0049H		; Wait keystroke
DELAYBC	EQU	0060H		; Delay BC
D0084	EQU	0084H
D010E	EQU	010EH
CSOFF	EQU	01F8H		; Cassette off
CSON	EQU	0215H		; Cassette on
CSIN	EQU	0235H		; Cassette input byte
CSOUT	EQU	0264H		; Cassette output byte
CSHWR	EQU	0287H		; Cassette output header
CSHIN	EQU	0296H		; Cassette input header
D0303	EQU	0303H
D03FB	EQU	03FBH
D05DC	EQU	05DCH
D0700	EQU	0700H
D0800	EQU	0800H
D0E0F	EQU	0E0FH
D1999	EQU	1999H		; 6553 (max line number is 65529)
CP16ROM	EQU	1C90H		; Compare HL & DE
CASSSEL	EQU	37E4H		; Cassette unit selector
D3801	EQU	3801H
D3939	EQU	3939H
CSTATM	EQU	3C3DH		; Cassette status 'M'emory write fault
CSTATC	EQU	3C3EH		; Cassette status 'C'hecksum error
CSTATUS	EQU	3C3FH		; Cassette blinking asterisk
VRST08	EQU	4000H		; RST 08 jump
VRST08A	EQU	4001H		; RST 08 address (ZBUG bkpt)
VRST18	EQU	4006H		; RST 18 jump
VRST18A	EQU	4007H		; RST 18 address (Compare HL & DE)
VRST20	EQU	4009H		; RST 20 jump
VRST20A	EQU	400AH		; RST 20 address (Output single char in A)
VRST28	EQU	400CH		; RST 28 jump
VRST28A	EQU	400DH		; RST 28 address (Output single char at PC)
VRST30	EQU	400FH		; RST 30 jump
VRST30A	EQU	4010H		; RST 30 address (eval expression)
VKIDVRA	EQU	4016H		; Keyboard driver vector
VCSRPOS	EQU	4020H		; Video cursor position
PPAGLEN	EQU	4028H		; Printer page length + 1
KISTATE	EQU	4036H		; KI pressed keys state
BCASBUF	EQU	4100H		; Cassette system block buffer; block checksum
BCASLEN	EQU	4101H		; Cassette system block length
BPRGNAM	EQU	4104H		; Program name buffer
LST2RPL	EQU	41F0H		; Len of str to rpl (cmd S) flwd by str - ZBUG bnch instr
STR2RPL	EQU	41F1H		; Str to replace (cmd S) - ZBUG mem mod enable flag
ZINPTYP	EQU	41F2H		; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
ZMBWFLG	EQU	41F3H		; ZBUG Exam mode (Mnemo=0, Word=1, Byte=2)
ZNUMFLG	EQU	41F4H		; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
ZOUTRDX	EQU	41F5H		; ZBUG Output radix
D41F6	EQU	41F6H
ZCURLOC	EQU	41F7H		; ZBUG current location
ZTSTOP0	EQU	41F8H		; ZBUG 2 stop points (5 bytes each)
ZNXTLOC	EQU	41F9H		; ZBUG next location
ZTSTOPS	EQU	41FBH		; ZBUG 2 stop + 8 break points (5 bytes each)
LST2SUB	EQU	4201H		; Len of str to substitute (cmd S) followed by str
STR2SUB	EQU	4202H		; Str to substitute (cmd S) - ZBUG 8 Bkpts
ZTBKPTS	EQU	4205H		; Table of 8 breakpoints (5 bytes each)
LST2FND	EQU	4212H		; Len of str to find (cmd F) followed by str
STR2FND	EQU	4213H		; Str to find (cmd F)
FSTRFND	EQU	4223H		; String found flag
FFNDNLY	EQU	4224H		; Find only flag (no substitution)
PCURLIN	EQU	4226H		; Pointer to current line
LINEINC	EQU	4228H		; Line increment
PFNDLIN	EQU	422AH		; Pointer to found line
PLSTLIN	EQU	422CH		; Pointer to last line
PNXTLIN	EQU	422EH		; Pointer to next line
PFSTLIN	EQU	4230H		; Pointer to first line
PENDTXT	EQU	4232H		; Pointer to end of text
PLAST	EQU	4234H		; Pointer to last RAM address
PUSRORG	EQU	4236H		; Pointer to USRORG (command O)
PORGREF	EQU	4238H		; ASM org ref = AFLAGIM && !AFLAGA0 ? PUSRORG : 0000H
PORGAUT	EQU	423AH		; ASM auto org for IM = pointer to end of symbol table
PLSTLOC	EQU	423CH		; Last location address pointer
BCASPTR	EQU	423EH		; Cassette buffer pointer
INPBUF	EQU	4240H		; Input buffer
FZBUGNO	EQU	42C1H		; ZBUG active (not 0) / No output (bit 7)
EXPRSLT	EQU	42C2H		; Expression result
PSYMTBL	EQU	42C4H		; Pointer to symbols table
LINEPTR	EQU	42C6H		; Input line pointer
RMNCHRS	EQU	42C8H		; Remaining chars counter
PPRGNAM	EQU	42C9H		; Pointer to program name
LPRGNAM	EQU	42CBH		; Length of program name (<= 6)
LOCADDR	EQU	42CCH		; Location address ptr
LOCADD1	EQU	42CDH		; Location address ptr + 1
OPCODEP	EQU	42CEH		; Opcode prefix (0 if none)
OPCODE0	EQU	42CFH		; Opcode byte 0
OPCODE1	EQU	42D0H		; Opcode byte 0
OPCODES	EQU	42D2H		; Opcodes length - ZBUG targ jump/call address
ASMPC	EQU	42D4H		; Assembler instruction current PC
ASMERRC	EQU	42D6H		; Assembler error counter
FCSOUT	EQU	42D8H		; Cass out flag
DVDPOS	EQU	42D9H		; Current logical position in line
FPRCHAR	EQU	42DAH		; Print char flag (instead of video)
LISTON	EQU	42DBH		; *LIST ON flag
MLISTON	EQU	42DCH		; *MLIST ON flag
FCASBLK	EQU	42DDH		; Flag for pending cassette block
FERROR	EQU	42DEH		; Assembler error flag for pause
CONDFLG	EQU	42DFH		; Skip assembly if not zero
MACRFLG	EQU	42E1H		; Skip assembly in macro - ZBUG regs save area
FMACRO	EQU	42E2H		; Flag macro being processed
NPASS	EQU	42E3H		; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
D42E4	EQU	42E4H
D42E5	EQU	42E5H
D42E6	EQU	42E6H
D42E7	EQU	42E7H
D42E8	EQU	42E8H
D42E9	EQU	42E9H
D42EA	EQU	42EAH
D42EB	EQU	42EBH
D42EC	EQU	42ECH
D42ED	EQU	42EDH
D42EE	EQU	42EEH
D42EF	EQU	42EFH
D42F0	EQU	42F0H
D42F1	EQU	42F1H
FSKPLN	EQU	42F2H		; Flag to skip line numbers on output
SMACCNT	EQU	42F3H		; Symbol to macro invocation counter to replace #$YM
MACCT12	EQU	42F4H		; Macro invocation counter digits 1-2
Z42F5	EQU	42F5H		; Used by ZBUG
MACCT34	EQU	42F6H		; Macro invocation counter digits 3-4
OPN1VAL	EQU	42F8H		; Operand 1 value
OPADDR	EQU	42FAH		; Ptr to operator prio and address
NMBASIS	EQU	42FCH		; Number basis for constant parsing
NMBAS10	EQU	42FDH		; Force number basis to 10 for constant parsing
D42FE	EQU	42FEH
D4300	EQU	4300H
FINKBD	EQU	4301H		; Flag indicating reading keyboard
ENDLNUM	EQU	4302H		; New end line number for block copy/move
NXTLNUM	EQU	4304H		; Next line number for block copy/move
SPLIMIT	EQU	4306H		; SP limit for stack overflow checking
D434E	EQU	434EH
DD8F0	EQU	0D8F0H
DFC18	EQU	0FC18H
DFF9C	EQU	0FF9CH
DFFCD	EQU	0FFCDH
DFFEC	EQU	0FFECH
DFFF6	EQU	0FFF6H
DFFFA	EQU	0FFFAH
DFFFF	EQU	0FFFFH


	ORG	4380H
VSTART:	; Main entry point - restart with new edit buffer
	JP	START		; Main entry point - restart with new edit buffer

VREST:	; Restart with edit buffer preserved
	JP	RESTART		; Restart with edit buffer preserved

VRESTZB:	; Restart with edit buffer and Z-bug bkpts preserved
	JP	RESTZB		; Restart with edit buffer and Z-bug bkpts preserved

	DB	00H,00H,00H,00H

VPRCHAR:	; Print char
	JP	PRCHAR		; Print char in A       

VCSHIN:	; Turn on cassette and read header
	JP	CCSHIN		; Turn on cassette and read header

VCSHWR:	; Turn on cassette and write header
	JP	CCSHWR		; Turn on cassette and write header

VCSIN:	; Cassette input byte
	JP	CSIN		; Cassette input byte   

VCSOUT:	; Cassette output byte
	JP	CSOUT		; Cassette output byte  

VCSOFF:	; Turn off cassette
	JP	CCSOFF		; Turn off cassette     

CCSHIN:	; Turn on cassette and read header
	DI
	CALL	CSON		; Cassette on           
	JP	CSHIN		; Cassette input header 

CCSHWR:	; Turn on cassette and write header
	DI
	CALL	CSON		; Cassette on           
	JP	CSHWR		; Cassette output header

CCSOFF:	; Turn off cassette
	CALL	CSOFF		; Cassette off          
	NOP
	RET

CSINW:	; Cassette input word HL
	CALL	VCSIN		; Cassette input byte   
	LD	L,A
	CALL	VCSIN		; Cassette input byte   
	LD	H,A
	RET

CBLINK:	; Blink asterisk in upper right corner
	LD	A,(CSTATUS)	; Cassette blinking asterisk
	XOR	0AH
	LD	(CSTATUS),A	; Cassette blinking asterisk
	RET

WAITKEY:	; Wait keystroke
	PUSH	DE
	PUSH	HL
L43C6:	LD	HL,FINKBD	; Flag indicating reading keyboard
	INC	(HL)
	CALL	KBWAIT		; Wait keystroke        
	DEC	(HL)
	LD	HL,CTLKEYS	; Recognized control keys
	LD	E,06H
L43D3:	CP	(HL)
	INC	HL
	JR	Z,L43E2
	DEC	E
	JR	NZ,L43D3
	CP	1BH
	JR	C,L43C6
	CP	61H		; 'a'                   
	JR	NC,L43C6
L43E2:	POP	HL
	POP	DE
	RET

CTLKEYS:	; Recognized control keys
	DB	08H,09H,0AH,0DH,18H,01H

KIDVR:	; Keyboard driver replacement routine (debounce)
	LD	HL,KISTATE	; KI pressed keys state 
	LD	BC,D3801
	LD	D,00H
L43F3:	LD	A,(BC)
	LD	E,A
	XOR	(HL)
	LD	(HL),E
	AND	E
	JR	NZ,L4402
	INC	D
	INC	L
	RLC	C
	JP	P,L43F3
	RET

L4402:	LD	E,A
	PUSH	BC
	LD	BC,D05DC
	CALL	DELAYBC		; Delay BC              
	POP	BC
	LD	A,(BC)
	AND	E
	RET	Z
	JP	D03FB

MOLDM1:	; Old M1 ROM flag
	DB	00H

CKPAUSE:	; Check for pause (Shift-@)
	PUSH	DE
	PUSH	HL
	LD	HL,FINKBD	; Flag indicating reading keyboard
	INC	(HL)
	CALL	KBDSCN		; Scan keyboard         
	DEC	(HL)
	POP	HL
	POP	DE
	OR	A
	RET	Z
	RET	M
L4421:	CP	01H
	JR	Z,JBREAK	; <BREAK> key pressed   
	CP	60H		; '`'                   
	RET	NZ
WKEYBRK:	; Wait any key, <BREAK> to abort
	CALL	WAITKEY		; Wait keystroke        
	JR	L4421

JBREAK:	; <BREAK> key pressed
	LD	A,(FZBUGNO)	; ZBUG active (not 0) / No output (bit 7)
	OR	A
	JP	NZ,ZPMTCMD	; ZBUG Prompt with '#' and get command
	JP	PROMPT		; Main EDTASM prompt    

RDYCASS:	; Ready cassette
	LD	HL,MRDYCAS	; "READY CASSETTE"      
PREADY:	; Prompt READY message and wait keypress
	CALL	DMSGBT7		; Disp message terminated with Bit 7, with NL
	JR	WKEYBRK		; Wait any key, <BREAK> to abort

DSTRB7:	; Disp string terminated with Bit 7
	LD	A,(HL)
DSTRB7A:	; Display A followed by string terminated with Bit 7
	INC	HL
	RST	20H
	RLCA
	JR	NC,DSTRB7	; Disp string terminated with Bit 7
	RET

TAFLAGS:	; Table of assembler flags
	DB	02H
	DB	'NL'
AFLAGNL:	; Assembler flag: NL = No Listing
	DB	00H,02H
	DB	'NO'
AFLAGNO:	; Assembler flag: NO = No Output
	DB	00H,02H
	DB	'LP'
AFLAGLP:	; Assembler flag: LP = Line Printer
	DB	00H,02H
	DB	'NS'
AFLAGNS:	; Assembler flag: NS = No Symbols table
	DB	00H,02H
	DB	'WE'
AFLAGWE:	; Assembler flag: WE = Wait on Error
	DB	00H,02H
	DB	'IM'
AFLAGIM:	; Assembler flag: IM = assemble to Internal Memory
	DB	00H,02H
	DB	'MO'
AFLAGMO:	; Assembler flag: MO = Manual Origin
	DB	00H,02H
	DB	'AO'
AFLAGAO:	; Assembler flag: AO = Absolute Origin
	DB	00H,00H
L4467:	DB	64H
L4468:	DB	00H,00H,00H,00H,00H,00H,00H,00H
	DB	00H,00H,00H,00H,00H,00H,00H,00H
	DB	00H,00H,00H,00H,00H,00H,00H,00H
	DB	00H,00H,00H,00H,00H,00H,00H

START:	; Main entry point - restart with new edit buffer
	LD	HL,EBUFFER	; Editor buffer start   
	LD	(PFSTLIN),HL	; Pointer to first line 
	LD	(PENDTXT),HL	; Pointer to end of text
	LD	(HL),0FFH
	INC	HL
	LD	(HL),0FFH
SCANRAM:	; Scan the RAM to size it (bugged for full RAM systems)
	INC	HL
	LD	A,(HL)
	LD	B,A
	CPL
	LD	(HL),A
	CP	(HL)
	LD	(HL),B
	JR	Z,SCANRAM	; Scan the RAM to size it (bugged for full RAM systems)
	DEC	HL
	LD	(PUSRORG),HL	; Pointer to USRORG (command O)
	DEC	HL
	LD	(PLAST),HL	; Pointer to last RAM address
RESTART:	; Restart with edit buffer preserved
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	XOR	A
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	CALL	SETVEC		; Install vectors       
	LD	HL,L4468
	LD	(PSYMTBL),HL	; Pointer to symbols table
	CALL	TSTOLD1		; Test old M1 ROM       
L44B7:	EQU	$-2
	LD	A,(MOLDM1)	; Old M1 ROM flag       
	OR	A
	JR	Z,L44C5
	LD	HL,KIDVR	; Keyboard driver replacement routine (debounce)
	LD	(VKIDVRA),HL	; Keyboard driver vector
L44C5:	LD	HL,CALLRET	; Dummy call            
	LD	(L44B7),HL
	RST	28H

	DB	1CH

	RST	28H

	DB	1FH

	RST	28H

	DB	0EH

	LD	HL,MTITLE	; EDTASM PLUS TITLE     
	CALL	DMSGBT7		; Disp message terminated with Bit 7, with NL
L44D5:	EQU	$-2
	LD	HL,CALLRET	; Dummy call            
	LD	(L44D5),HL
ZCMDE:	; ZBUG '$E' cmd - exit ZBUG
	LD	HL,D000A
	LD	(LINEINC),HL	; Line increment        
	LD	HL,LST2FND	; Len of str to find (cmd F) followed by str
	LD	(HL),01H
	INC	HL
	LD	(HL),0DH
	LD	HL,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	(HL),01H
	INC	HL
	LD	(HL),0DH
	LD	HL,(PFSTLIN)	; Pointer to first line 
	LD	(PCURLIN),HL	; Pointer to current line
DOBREAK:	; EDTASM do break
	RST	28H

	DB	0DH

PROMPT:	; Main EDTASM prompt
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	CALL	VCSOFF		; Turn off cassette     
	LD	BC,PROMPT	; Main EDTASM prompt    
	PUSH	BC
	XOR	A
	LD	HL,FCSOUT	; Cass out flag         
	LD	(HL),A
	INC	HL
	LD	(HL),0FFH
	INC	HL
	LD	(HL),A
	LD	(FSKPLN),A	; Flag to skip line numbers on output
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	LD	(NMBAS10),A	; Force number basis to 10 for constant parsing
	RST	28H

	DB	'*'

	LD	C,01H
	CALL	GETCMD		; Get command line      
	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	RET	Z
	LD	HL,VPMTTBL	; Prompt command vector table
	LD	B,16H
L4528:	CP	(HL)
	INC	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	JR	NZ,L4558
	PUSH	DE
	LD	A,B
	CP	0DH
	JR	NC,L4540
	CP	04H
	JR	C,L4540
	LD	HL,L4468
	LD	(PSYMTBL),HL	; Pointer to symbols table
L4540:	LD	HL,(PENDTXT)	; Pointer to end of text
	LD	DE,(PFSTLIN)	; Pointer to first line 
	RST	18H
	RET	NZ
	LD	HL,L4467
	LD	(PCURLIN),HL	; Pointer to current line
	LD	A,B
	CP	07H
	RET	C
	LD	HL,MBUFMTY	; "BUFFER EMPTY"        
	JR	ERROR		; Disp error message and abort command

L4558:	DJNZ	L4528
BADCMD:	; Disp BAD COMMAND error msg and abort
	LD	HL,MBADCMD	; "BAD COMMAND"         
ERROR:	; Disp error message and abort command
	LD	BC,PROMPT	; Main EDTASM prompt    
	PUSH	BC
DMSGBT7:	; Disp message terminated with Bit 7, with NL
	LD	A,(HL)
	INC	HL
	RST	20H
	RLCA
	JR	NC,DMSGBT7	; Disp message terminated with Bit 7, with NL
DISPNL:	; Disp <New Line>
	RST	28H

	DB	0DH

	RET

JRST20:	; Output single char in A to selected device(s)
	PUSH	AF
	LD	A,(FZBUGNO)	; ZBUG active (not 0) / No output (bit 7)
	RLCA
	JR	C,L4598
	POP	AF
	PUSH	AF
	PUSH	HL
	LD	HL,FCSOUT	; Cass out flag         
	INC	(HL)
	DEC	(HL)
	INC	HL
	PUSH	AF
	CALL	NZ,VCSOUT	; Cassette output byte  
	POP	AF
	JR	NZ,L4597
	AND	7FH
	JR	Z,L4597
	CP	09H
	JR	Z,DTAB		; Disp TAB              
	INC	(HL)
	INC	HL
	INC	(HL)
	DEC	(HL)
	PUSH	DE
	PUSH	AF
	CALL	NZ,VPRCHAR	; Print char            
	POP	AF
	CALL	Z,VDCHAR	; Disp char in A        
	POP	DE
L4597:	POP	HL
L4598:	POP	AF
	RET

DTAB:	; Disp TAB
	RST	28H

	DB	' '

	LD	A,(HL)
	AND	07H
	JR	NZ,DTAB		; Disp TAB              
	JR	L4597

JRST28:	; Output single char following RST 28H to selected device(s)
	PUSH	AF
	LD	A,(FINKBD)	; Flag indicating reading keyboard
	OR	A
	JR	NZ,L4598
	POP	AF
	EX	(SP),HL
	PUSH	AF
	LD	A,(HL)
	RST	20H
	POP	AF
	INC	HL
	EX	(SP),HL
	RET

SETVEC:	; Install vectors
	XOR	A
	LD	(FCSOUT),A	; Cass out flag         
	LD	(FPRCHAR),A	; Print char flag (instead of video)
	LD	(FINKBD),A	; Flag indicating reading keyboard
	LD	(CASSSEL),A	; Cassette unit selector
	LD	(PPAGLEN),A	; Printer page length + 1
	OUT	(0FFH),A
	LD	A,0C3H
	LD	(VRST18),A	; RST 18 jump           
	LD	(VRST20),A	; RST 20 jump           
	LD	(VRST28),A	; RST 28 jump           
	LD	(VRST30),A	; RST 30 jump           
	LD	HL,CP16ROM	; Compare HL & DE       
	LD	(VRST18A),HL	; RST 18 address (Compare HL & DE)
	LD	HL,JRST20	; Output single char in A to selected device(s)
	LD	(VRST20A),HL	; RST 20 address (Output single char in A)
	LD	HL,JRST28	; Output single char following RST 28H to selected devi
	LD	(VRST28A),HL	; RST 28 address (Output single char at PC)
	LD	HL,JRST30	; Parse expression ?    
	LD	(VRST30A),HL	; RST 30 address (eval expression)
	RET

MSTRNFD:	; "STRING NOT FOUND"
	DB	'STRING NOT FOUN','D'+80H
MBADLIN:	; "BAD LINE NUMBER"
	DB	'BAD LINE NUMBE','R'+80H
MBUFFUL:	; "BUFFER FULL"
	DB	'BUFFER FUL','L'+80H
MBADCMD:	; "BAD COMMAND"
	DB	'BAD COMMAN','D'+80H
MBUFMTY:	; "BUFFER EMPTY"
	DB	'BUFFER EMPT','Y'+80H
MNOROOM:	; "NO ROOM BETWEEN LINES"
	DB	'NO ROOM BETWEEN LINE','S'+80H
MTOOLNG:	; "NEW LINE TOO LONG"
	DB	'NEW LINE TOO LON','G'+80H
MRDYPRT:	; "READY PRINTER"
	DB	'READY PRINTE','R'+80H
MBADPAR:	; "BAD PARAMETER(S)"
	DB	'BAD PARAMETER(S',')'+80H
MRDYCAS:	; "READY CASSETTE"
	DB	'READY CASSETT','E'+80H
MNONAME:	; "NONAME" default program name
	DB	'NONAME'
VPMTTBL:	; Prompt command vector table
	DB	50H		; 'P'
	DW	ECMDP		; EDTASM cmd P - print source P[line1[:line2]]
	DB	48H		; 'H'
	DW	ECMDH		; EDTASM cmd H - hard copy source with line numbers H[line1[
	DB	54H		; 'T'
	DW	ECMDT		; EDTASM cmd T - hard copy source without line numbers T[lin
	DB	44H		; 'D'
	DW	ECMDD		; EDTASM cmd D - Delete lines D[line1[:line2]]
	DB	4EH		; 'N'
	DW	ECMDN		; EDTASM cmd N - reNumber the lines N[line[,inc]]
L4693:	DB	41H		; 'A'
	DW	ECMDA		; EDTASM cmd A - Assemble the source in buffer
	DB	57H		; 'W'
	DW	ECMDW		; EDTASM cmd W - Write source to cassette W[ filename]
	DB	46H		; 'F'
	DW	ECMDF		; EDTASM cmd F - Find str F[rng][$str] ($=ESC) - LD A,0AFH (
	DB	5BH		; '['
	DW	ECMDUP		; EDTASM cmd 'up arrow' - Display prev line
	DB	0AH
	DW	ECMDDWN		; EDTASM cmd 'down arrow' - Display next line
	DB	52H		; 'R'
	DW	ECMDR		; EDTASM cmd R - Replace R[line[,inc]]
	DB	45H		; 'E'
	DW	ECMDE		; EDTASM cmd E - Edit lines E[line1[:line2]]
	DB	58H		; 'X'
	DW	ECMDX		; EDTASM cmd X - Extend lines X[line1[:line2]] - LD A,0AFH (
	DB	53H		; 'S'
	DW	ECMDS		; EDTASM cmd S - Substitute string S[range][$string][$string
	DB	43H		; 'C'
	DW	ECMDC		; EDTASM cmd C - Copy Ctarg,range[,inc]
	DB	4DH		; 'M'
	DW	ECMDM		; EDTASM cmd M - Move Mtarg,range[,inc] - LD A,0AFH (!XOR A)
	DB	4CH		; 'L'
	DW	ECMDL		; EDTASM cmd L - Load file from cassette L[ filename]
	DB	49H		; 'I'
	DW	ECMDI		; EDTASM cmd I - Insert lines I[line1[,inc]]
L46BA:	DB	4FH		; 'O'
	DW	ECMDO		; EDTASM cmd O - Manual origin
L46BD:	DB	51H		; 'Q'
	DW	CQUASH		; Command 'Q'uash
	DB	42H		; 'B'
	DW	D0000		; 0000 or EDTASM cmd B - Basic
L46C3:	DB	5AH		; 'Z'
	DW	ECMDZ		; EDTASM cmd Z - ZBUG ====== START ZBUG CODE ======

CLRLINE:	; Clear line
	LD	HL,DVDPOS	; Current logical position in line
	LD	B,(HL)
	LD	A,08H
L46CC:	DEC	B
	CALL	P,JRST20	; Output single char in A to selected device(s)
	JP	P,L46CC
	LD	(HL),00H
	RET

DOCLRLN:	; EDTASM do clear line
	CALL	CLRLINE		; Clear line            
	JR	L46DE

GETLINE:	; Get text line (LD E,1EH: skip next LD E,00H)
	DB	1EH

GETCMD:	; Get command line
	LD	E,00H
L46DE:	LD	HL,INPBUF	; Input buffer          
	LD	(LINEPTR),HL	; Input line pointer    
	LD	D,00H
NXTKEY:	; Read next keystroke
	CALL	WAITKEY		; Wait keystroke        
	INC	E
	DEC	E
	JR	Z,L46F1
	CP	1BH
	JR	Z,NXTKEY	; Read next keystroke   
L46F1:	CP	18H
	JR	Z,DOCLRLN	; EDTASM do clear line  
	CP	08H
	JR	NZ,L46FE
	CALL	DOBKSP		; EDTASM do backspace   
	JR	NXTKEY		; Read next keystroke   

L46FE:	CP	01H
	JP	Z,DOBREAK	; EDTASM do break       
	CP	0DH
	JR	Z,DOENTER	; EDTASM do ENTER       
	LD	(HL),A
	CP	5BH		; '['                   
	JR	Z,DOSCROL	; EDTASM do Scroll up/dowb
	CP	0AH
	JR	NZ,L4728
DOSCROL:	; EDTASM do Scroll up/dowb
	INC	C
	DEC	C
	JR	Z,NXTKEY	; Read next keystroke   
	LD	A,D
	OR	A
	JR	NZ,NXTKEY	; Read next keystroke   
	INC	D
	LD	A,(VCSRPOS)	; Video cursor position 
	AND	0C0H
	LD	(VCSRPOS),A	; Video cursor position 

SDOENTR:	; CP 0E7H (skip next RST 20)
	DB	0FEH

DOENTER:	; EDTASM do ENTER
	RST	20H
	LD	A,D
	LD	(RMNCHRS),A	; Remaining chars counter
	RET

L4728:	LD	A,D
	CP	80H
	JR	Z,NXTKEY	; Read next keystroke   
	LD	A,(HL)
	INC	HL
	INC	D
	CP	1BH
	JR	NZ,L4736
	LD	A,24H		; '$'                   
L4736:	RST	20H
	JR	NXTKEY		; Read next keystroke   

DOBKSP:	; EDTASM do backspace
	INC	D
	DEC	D
	RET	Z
	DEC	HL
	PUSH	HL
	LD	A,(HL)
	LD	HL,DVDPOS	; Current logical position in line
	CP	09H
	JR	Z,L474D
	RST	28H

	DB	08H

	DEC	(HL)
	DEC	(HL)
	DEC	D
	POP	HL
	RET

L474D:	PUSH	BC
	LD	B,(HL)
L474F:	RST	28H

	DB	08H

	DJNZ	L474F
	LD	(HL),B
	DEC	D
	JR	Z,L4760
	LD	HL,INPBUF	; Input buffer          
	LD	B,D
L475B:	LD	A,(HL)
	INC	HL
	RST	20H
	DJNZ	L475B
L4760:	POP	BC
	POP	HL
	RET

FETCH:	; Fetch to A ignoring space: Z if EOL, NC if digit
	LD	A,20H		; ' '                   

SFTCHNI:	; CP 0AFH (skip next XOR A)
	DB	0FEH

FETCHNI:	; Fetch to A not ignoring space: Z if EOL, NC if digit
	XOR	A
	PUSH	BC
	PUSH	HL
	LD	B,A
L476A:	LD	HL,RMNCHRS	; Remaining chars counter
	INC	(HL)
	DEC	(HL)
	LD	A,0DH
	SCF
	JR	Z,L4789
	DEC	(HL)
	LD	HL,(LINEPTR)	; Input line pointer    
	LD	A,(HL)
	INC	HL
	LD	(LINEPTR),HL	; Input line pointer    
	CP	09H
	JR	NZ,L4783
	LD	A,20H		; ' '                   
L4783:	CP	B
	JR	Z,L476A
	CALL	TSTDIG		; Test if A is a digit. C set if not.
L4789:	POP	HL
	POP	BC
	RET

TSTDIG:	; Test if A is a digit. C set if not.
	CP	30H		; '0'                   
	RET	C
	CP	3AH		; ':'                   
L4791:	CCF
	INC	A
	DEC	A
	RET

TSTLTR:	; Test if A is a letter (uppercase). C set if not
	CP	41H		; 'A'                   
	RET	C
	CP	5BH		; '['                   
	JR	L4791

UNFETCH:	; Unfetch one char
	PUSH	HL
	LD	HL,(LINEPTR)	; Input line pointer    
	DEC	HL
	LD	(LINEPTR),HL	; Input line pointer    
	LD	HL,RMNCHRS	; Remaining chars counter
	INC	(HL)
	POP	HL
	RET

ECMDN:	; EDTASM cmd N - reNumber the lines N[line[,inc]]
	CALL	FETLINC		; Fetch a line number and an increment
	SCF
L47AE:	PUSH	HL
	LD	DE,(PFSTLIN)	; Pointer to first line 
	PUSH	AF
L47B4:	PUSH	HL
	LD	HL,(PENDTXT)	; Pointer to end of text
	RST	18H
	EX	DE,HL
	POP	DE
	JR	NZ,L47C3
	POP	AF
	CCF
	POP	HL
	JR	NC,L47AE
	RET

L47C3:	POP	AF
	PUSH	AF
	INC	HL
	JR	C,L47CC
	DEC	HL
	LD	(HL),E
	INC	HL
	LD	(HL),D
L47CC:	INC	HL
	LD	C,(HL)
	LD	B,00H
	INC	BC
	ADD	HL,BC
	PUSH	HL
	LD	HL,(LINEINC)	; Line increment        
	ADD	HL,DE
	JR	C,L47E0
	LD	DE,DFFFA
	RST	18H
	POP	DE
	JR	C,L47B4
L47E0:	LD	HL,MBADLIN	; "BAD LINE NUMBER"     
	JP	ERROR		; Disp error message and abort command

ECMDI:	; EDTASM cmd I - Insert lines I[line1[,inc]]
	CALL	FETLINC		; Fetch a line number and an increment
	JR	NZ,L47F8
L47EB:	EX	DE,HL
	LD	HL,(LINEINC)	; Line increment        
	ADD	HL,DE
	JR	C,L47E0
	LD	DE,DFFFA
	RST	18H
	JR	NC,L47E0
L47F8:	PUSH	HL
DOINSRT:	; Do insert lines
	CALL	INPLINE		; Input Source Line     
	POP	HL
	JR	L47EB

INPLINE:	; Input Source Line
	POP	DE
	POP	HL
	PUSH	HL
	PUSH	DE
	PUSH	HL

S4804:	; LD B,0B7H (skip next OR A)
	DB	06H

L4805:	OR	A
	LD	HL,(PNXTLIN)	; Pointer to next line  
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	DEC	HL
	EX	(SP),HL
	PUSH	AF
	RST	18H
	JR	C,L4818
	LD	HL,MNOROOM	; "NO ROOM BETWEEN LINES"
	JP	ERROR		; Disp error message and abort command

L4818:	CALL	CHK132C		; Check avail buf space for 132 chars
	POP	AF
	PUSH	AF
	CALL	C,DLNUM		; Display line number in HL and ' '
	POP	AF
	EX	(SP),HL
	PUSH	HL
	LD	C,00H
	CALL	C,GETLINE	; Get text line (LD E,1EH: skip next LD E,00H)
	POP	DE
	LD	HL,(PENDTXT)	; Pointer to end of text
	INC	HL
	LD	B,00H
	LD	A,(RMNCHRS)	; Remaining chars counter
	LD	C,A
	PUSH	BC
	PUSH	HL
	ADD	HL,BC
	INC	HL
	INC	HL
	LD	(PENDTXT),HL	; Pointer to end of text
	INC	HL
	EX	DE,HL
	XOR	A
	SUB	L
	LD	L,A
	SBC	A,H
	SUB	L
	LD	H,A
	POP	BC
	PUSH	BC
	ADD	HL,BC
	INC	HL
	LD	B,H
	LD	C,L
	POP	HL
	LDDR
	INC	DE
	LD	(PNXTLIN),DE	; Pointer to next line  
	INC	HL
	LD	(PCURLIN),HL	; Pointer to current line
	POP	BC
	POP	DE
	LD	(HL),E
	INC	HL
	LD	(HL),D
	INC	HL
	LD	(HL),C
	INC	HL
	EX	DE,HL
	LD	HL,INPBUF	; Input buffer          
DOLDIR:	; Do LDIR if BC > 0
	LD	A,B
	OR	C
	RET	Z
	LDIR
	RET

FETLINC:	; Fetch a line number and an increment
	CALL	FETLINE		; Fetch a line expression
	CP	2CH		; ','                   
	JR	Z,FETINC	; Fetch an increment    
	CP	0DH
	JR	NZ,L487A
FETINC:	; Fetch an increment
	PUSH	HL
	CALL	FETNUMB		; Fetch a line number   
	JR	Z,L4885
	CP	0DH
L487A:	JP	NZ,EBADPAR	; "BAD PARAMETER(S)" error
	LD	A,H
	OR	L
	JP	Z,EBADPAR	; "BAD PARAMETER(S)" error
	LD	(LINEINC),HL	; Line increment        
L4885:	POP	HL
FINDPRV:	; Find previous line number < HL
	PUSH	HL
	LD	HL,(PFSTLIN)	; Pointer to first line 
	PUSH	HL
L488B:	LD	(PFNDLIN),HL	; Pointer to found line 
	POP	HL
	LD	B,H
	LD	C,L
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	PUSH	DE
	LD	E,(HL)
	INC	HL
	LD	D,00H
	ADD	HL,DE
	POP	DE
	EX	(SP),HL
	RST	18H
	EX	(SP),HL
	JR	Z,L48A7
	PUSH	HL
	LD	H,B
	LD	L,C
	JR	NC,L488B
	POP	DE
L48A7:	LD	(PNXTLIN),HL	; Pointer to next line  
	LD	H,B
	LD	L,C
	LD	(PLSTLIN),HL	; Pointer to last line  
	EX	DE,HL
	POP	HL
	LD	A,01H
	RET	Z
	PUSH	HL
	PUSH	AF
	LD	HL,(PFNDLIN)	; Pointer to found line 
	RST	18H
	JR	Z,L48C5
	LD	HL,(PENDTXT)	; Pointer to end of text
	RST	18H
	CPL
	JR	Z,L48C5
	LD	A,01H
L48C5:	LD	D,A
	POP	AF
	LD	A,D
	POP	HL
	RET

FETNUMB:	; Fetch a line number
	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	RET	Z
	JP	C,EBADPAR	; "BAD PARAMETER(S)" error
L48D4:	CALL	FETDIGT		; Fetch digit and add to line number HL
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	NC,L48D4
	OR	A
	RET

FETDIGT:	; Fetch digit and add to line number HL
	SUB	30H
	PUSH	DE
	LD	DE,D1999	; 6553 (max line number is 65529)
	PUSH	AF
	RST	18H
	JP	NC,EBADPAR	; "BAD PARAMETER(S)" error
	POP	AF
	LD	D,H
	LD	E,L
	ADD	HL,HL
	ADD	HL,HL
	ADD	HL,DE
	ADD	HL,HL
	LD	D,00H
	LD	E,A
	ADD	HL,DE
	POP	DE
	RET

FETLINE:	; Fetch a line expression
	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	JR	Z,L4904
	CP	23H		; '#'                   
	LD	HL,(PFSTLIN)	; Pointer to first line 
	JR	Z,L4920
	CP	2EH		; '.'                   
L4904:	LD	HL,(PCURLIN)	; Pointer to current line
	JR	Z,L4920
	CP	1BH
	SCF
	JR	Z,L4920
	CP	21H		; '!'                   
	JR	Z,L4920
	CP	2AH		; '*'                   
	JR	NZ,L492D
	LD	HL,DFFFF
	CALL	FINDPRV		; Find previous line number < HL
	LD	HL,(PFNDLIN)	; Pointer to found line 
	OR	A
L4920:	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	RET	C
	CP	21H		; '!'                   
	RET	Z
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	L4933

L492D:	CALL	UNFETCH		; Unfetch one char      
	CALL	FETNUMB		; Fetch a line number   
L4933:	CP	2DH		; '-'                   
	SCF
	JR	Z,L493E
	CP	2BH		; '+'                   
	JR	Z,L493E
	OR	A
	RET

L493E:	PUSH	AF
	PUSH	HL
	CALL	FETNUMB		; Fetch a line number   
	LD	B,H
	LD	C,L
	POP	HL
	LD	D,A
	POP	AF
	LD	A,D
	PUSH	AF
	LD	A,B
	OR	C
	JR	Z,L4998
L494E:	PUSH	BC
	CALL	FINDPRV		; Find previous line number < HL
	POP	BC
	POP	AF
	PUSH	AF
	JR	C,L4982
	LD	HL,(PNXTLIN)	; Pointer to next line  
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	A,D
	AND	E
	INC	A
	EX	DE,HL
	JR	NZ,L4993
BUG0001:	; Possible BUG: should better be LD DE,(PENDTXT) ...
	LD	DE,PENDTXT	; Pointer to end of text
	LD	HL,(PLSTLIN)	; Pointer to last line  
	RST	18H
	JR	NZ,L496F
	LD	HL,(PFNDLIN)	; Pointer to found line 
L496F:	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	HL,(LINEINC)	; Line increment        
	ADD	HL,DE
	JP	C,L47E0
	LD	DE,DFFFA
	RST	18H
	JP	NC,L47E0
	JR	L4998

L4982:	LD	DE,(PFSTLIN)	; Pointer to first line 
	LD	HL,(PLSTLIN)	; Pointer to last line  
	RST	18H
	JR	Z,L499B
	LD	HL,(PFNDLIN)	; Pointer to found line 
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
L4993:	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,L494E
L4998:	POP	AF
	OR	A
	RET

L499B:	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	HL,(LINEINC)	; Line increment        
	EX	DE,HL
	OR	A
	SBC	HL,DE
	JP	C,EBADPAR	; "BAD PARAMETER(S)" error
	JR	L4998

DLNUM:	; Display line number in HL and ' '
	PUSH	HL
	PUSH	DE
	PUSH	BC
	CALL	DLNUM1		; Display line number in HL - LD A,0AFH (skip next XOR 
	POP	BC
	POP	DE
	POP	HL
	LD	A,0FFH
	LD	(DVDPOS),A	; Current logical position in line
OUTSPC:	; Output white space
	RST	28H

	DB	' '

	RET

DLNUM1:	; Display line number in HL - LD A,0AFH (skip next XOR A)
	DB	3EH

ZDISDEC:	; Display DE in decimal
	XOR	A
	EX	DE,HL
	LD	HL,TPOW10	; Table of negated powers of 10
L49C1:	LD	C,(HL)
	INC	HL
	LD	B,(HL)
	INC	HL
	PUSH	HL
	PUSH	AF
	EX	DE,HL
	LD	A,0AFH
L49CA:	INC	A
	LD	D,H
	LD	E,L
	ADD	HL,BC
	JR	C,L49CA
	POP	HL
	INC	H
	DEC	H
	JR	NZ,L49DA
	CP	0B0H
	JR	Z,L49DB
	INC	H
L49DA:	RST	20H
L49DB:	LD	A,H
	POP	HL
	INC	C
	JR	NZ,L49C1
	RET

TPOW10:	; Table of negated powers of 10
	DW	DD8F0,DFC18,DFF9C,DFFF6
	DW	DFFFF

CHK132C:	; Check avail buf space for 132 chars
	PUSH	DE
	LD	DE,D0084
	CALL	CHKBUFS		; Check avail buf space for DE chars
	POP	DE
	RET

CHKBUFS:	; Check avail buf space for DE chars
	PUSH	HL
	LD	HL,(PENDTXT)	; Pointer to end of text
	ADD	HL,DE
	JR	C,EBUFFUL	; "BUFFER FULL" error   
	EX	DE,HL
	LD	HL,(PUSRORG)	; Pointer to USRORG (command O)
	DEC	HL
	RST	18H
	POP	HL
	RET	NC
EBUFFUL:	; "BUFFER FULL" error
	LD	HL,MBUFFUL	; "BUFFER FULL"         
	JP	ERROR		; Disp error message and abort command

ECMDF:	; EDTASM cmd F - Find str F[rng][$str] ($=ESC) - LD A,0AFH (
	DB	3EH

ECMDS:	; EDTASM cmd S - Substitute string S[range][$string][$string
	XOR	A
	LD	(FFNDNLY),A	; Find only flag (no substitution)
	XOR	A
	LD	(FSTRFND),A	; String found flag     
	LD	(FMACRO),A	; Flag macro being processed
	CALL	FETRANG		; Fetch a range of lines
	PUSH	BC
	INC	B
	DEC	B
	JR	NZ,L4A23
	LD	DE,DFFFF
	PUSH	DE
	JR	L4A38

L4A23:	EX	DE,HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	PUSH	HL
	EX	DE,HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	PUSH	BC
	CALL	FINDPRV		; Find previous line number < HL
	LD	H,B
	LD	L,C
	LD	(PCURLIN),HL	; Pointer to current line
	POP	BC
L4A38:	LD	A,(FFNDNLY)	; Find only flag (no substitution)
	OR	A
	JR	Z,L4A4E
	LD	HL,STR2FND	; Str to find (cmd F)   
	CALL	FETSTRG		; Fetch escaped string for Find/Substitute
	JR	Z,L4A49
	LD	(LST2FND),A	; Len of str to find (cmd F) followed by str
L4A49:	LD	DE,LST2FND	; Len of str to find (cmd F) followed by str
	JR	L4A6B

L4A4E:	LD	HL,STR2RPL	; Str to replace (cmd S) - ZBUG mem mod enable flag
	CALL	FETSTRG		; Fetch escaped string for Find/Substitute
	JR	NZ,L4A59
	JR	C,L4A68
	SCF
L4A59:	JP	C,EBADPAR	; "BAD PARAMETER(S)" error
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	HL,STR2SUB	; Str to substitute (cmd S) - ZBUG 8 Bkpts
	CALL	FETSTRG		; Fetch escaped string for Find/Substitute
	LD	(LST2SUB),A	; Len of str to substitute (cmd S) followed by str
L4A68:	LD	DE,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
L4A6B:	CALL	SUB4B19		; Call compare strings? 
	JR	NC,L4A7D
L4A70:	LD	A,(FSTRFND)	; String found flag     
	OR	A
	POP	DE
	POP	BC
	RET	NZ
	LD	HL,MSTRNFD	; "STRING NOT FOUND"    
	JP	ERROR		; Disp error message and abort command

L4A7D:	POP	DE
	PUSH	HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	RST	18H
	JR	NC,L4A70
	LD	(FSTRFND),A	; String found flag     
	POP	HL
	LD	A,(FFNDNLY)	; Find only flag (no substitution)
	OR	A
	PUSH	DE
	CALL	Z,SUB4AB2	; Do string substitution in source
	PUSH	AF
	LD	BC,D0001
	CALL	OUTSRCL		; Output source line(s) 
	POP	AF
	LD	HL,MTOOLNG	; "NEW LINE TOO LONG"   
	JP	C,ERROR		; Disp error message and abort command
	POP	DE
	POP	BC
	INC	B
	DEC	B
	RET	Z
	PUSH	BC
	PUSH	DE
	LD	A,(FFNDNLY)	; Find only flag (no substitution)
	OR	A
	LD	B,00H
	JP	Z,L4A68
	JR	L4A49

SUB4AB2:	; Do string substitution in source
	PUSH	HL
	CALL	CPYINPB		; Copy source line @HL to input buffer -> DE=length
L4AB6:	LD	B,00H
	LD	D,C
	LD	HL,INPBUF	; Input buffer          
	ADD	HL,BC
	LD	A,(LST2RPL)	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	B,A
	CALL	DELCHRS		; Delete B chars at HL  
	PUSH	HL
	LD	HL,LST2SUB	; Len of str to substitute (cmd S) followed by str
	LD	A,(HL)
	LD	(RMNCHRS),A	; Remaining chars counter
	INC	HL
	LD	(LINEPTR),HL	; Input line pointer    
	LD	B,A
	POP	HL
	OR	A
	JR	Z,DOSUBST	; Do substitution       
	ADD	A,E
	LD	C,A
	LD	A,80H
	CP	C
	JR	C,L4B0F
L4ADC:	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	SCF
	PUSH	BC
	CALL	INSCHAR		; Insert char at HL     
	POP	BC
	DJNZ	L4ADC
DOSUBST:	; Do substitution
	PUSH	DE
	LD	C,D
	LD	B,E
	LD	DE,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	HL,INPBUF	; Input buffer          
	CALL	SUB4B43		; Compare strings?      
	POP	DE
	JR	NC,L4AB6
	LD	A,(FMACRO)	; Flag macro being processed
	OR	A
	RET	NZ
	EX	DE,HL
	EX	(SP),HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	PUSH	HL
	CALL	FINDPRV		; Find previous line number < HL
	POP	HL
	POP	DE
	LD	BC,L4B14
	PUSH	BC
	PUSH	HL
	JP	L4E38

L4B0F:	POP	HL
	LD	(PCURLIN),HL	; Pointer to current line

X4B13:	; 06B7 - LD B,0B7H (="OR A")
	DB	06H

L4B14:	OR	A
	LD	HL,(PCURLIN)	; Pointer to current line
	RET

SUB4B19:	; Call compare strings?
	PUSH	DE
	LD	HL,(PCURLIN)	; Pointer to current line
	INC	B
	DEC	B
	JR	NZ,L4B2A
	PUSH	HL
L4B22:	POP	HL
	INC	HL
	INC	HL
	LD	E,(HL)
	INC	HL
	LD	D,00H
	ADD	HL,DE
L4B2A:	EX	DE,HL
	LD	HL,(PENDTXT)	; Pointer to end of text
	DEC	HL
	RST	18H
	EX	DE,HL
	POP	DE
	RET	C
	PUSH	DE
	PUSH	HL
	INC	HL
	INC	HL
	LD	B,(HL)
	INC	HL
	LD	C,00H
	CALL	SUB4B43		; Compare strings?      
	JR	C,L4B22
	POP	HL
	POP	DE
	RET

SUB4B43:	; Compare strings?
	PUSH	HL
	LD	A,B
	SUB	C
	LD	B,00H
	ADD	HL,BC
	LD	C,A
	DEC	HL
	PUSH	DE
	PUSH	HL
L4B4D:	POP	HL
	INC	HL
	POP	DE
	LD	A,(DE)
	PUSH	DE
	LD	B,A
	INC	DE
	LD	A,C
	CP	B
	PUSH	HL
	JR	C,L4B62
	DEC	C
L4B5A:	LD	A,(DE)
	CP	(HL)
	INC	HL
	INC	DE
	JR	NZ,L4B4D
	DJNZ	L4B5A
L4B62:	POP	HL
	POP	DE
	POP	DE
	RET	C
	LD	A,L
	SUB	E
	LD	L,A
	LD	A,H
	SBC	A,D
	LD	D,A
	LD	C,L
	RET

FETSTRG:	; Fetch escaped string for Find/Substitute
	PUSH	BC
	LD	B,00H
L4B71:	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,L4B85
	CP	1BH
	JR	Z,L4B85
	LD	C,A
	LD	A,B
	CP	10H
	JR	Z,L4B71
	LD	(HL),C
	INC	HL
	INC	B
	JR	L4B71

L4B85:	LD	A,B
	INC	A
	DEC	A
	POP	BC
	RET

CPYINPB:	; Copy source line @HL to input buffer -> DE=length
	PUSH	BC
	INC	HL
	INC	HL
	LD	C,(HL)
	LD	B,00H
	PUSH	BC
	INC	HL
	LD	DE,INPBUF	; Input buffer          
	CALL	DOLDIR		; Do LDIR if BC > 0     
	XOR	A
	LD	(DE),A
	POP	DE
	POP	BC
	RET

ECMDT:	; EDTASM cmd T - hard copy source without line numbers T[lin
	LD	HL,FSKPLN	; Flag to skip line numbers on output
	INC	(HL)
ECMDH:	; EDTASM cmd H - hard copy source with line numbers H[line1[
	LD	HL,MRDYPRT	; "READY PRINTER"       
	CALL	PREADY		; Prompt READY message and wait keypress

SECMDP:	; LD B,0AFH (skip next XOR A)
	DB	06H

ECMDP:	; EDTASM cmd P - print source P[line1[:line2]]
	XOR	A
	PUSH	AF
	CALL	FETRANG		; Fetch a range of lines
	POP	AF
	LD	(FPRCHAR),A	; Print char flag (instead of video)
	INC	B
	DEC	B
	LD	BC,DFFFF
	JR	NZ,L4BC2
	LD	BC,RST10	;                       
	LD	HL,(PENDTXT)	; Pointer to end of text
	EX	DE,HL
	LD	HL,(PCURLIN)	; Pointer to current line
L4BC2:	RST	18H
	RET	Z
	CALL	CKPAUSE		; Check for pause (Shift-@)
	DEC	BC
	LD	A,B
	OR	C
	RET	Z
OUTSRCL:	; Output source line(s)
	LD	(PCURLIN),HL	; Pointer to current line
	PUSH	DE
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	EX	DE,HL
	XOR	A
	LD	(DVDPOS),A	; Current logical position in line
	LD	A,H
	AND	L
	INC	A
	JR	NZ,OUTLINE	; Output source line    
	LD	A,06H
L4BDF:	RST	28H

	DB	' '

	DEC	A
	JR	NZ,L4BDF
	LD	(DVDPOS),A	; Current logical position in line
	JR	L4BF0

OUTLINE:	; Output source line
	LD	A,(FSKPLN)	; Flag to skip line numbers on output
	OR	A
	CALL	Z,DLNUM		; Display line number in HL and ' '
L4BF0:	EX	DE,HL
	LD	E,(HL)
L4BF2:	INC	HL
	DEC	E
	JP	P,L4BFC
	RST	28H

	DB	0DH

	POP	DE
	JR	L4BC2

L4BFC:	LD	A,(HL)
	RST	20H
	JR	L4BF2

ECMDUP:	; EDTASM cmd 'up arrow' - Display prev line
	SCF

SECMDDN:	; LD B,0AFH (skip next XOR A)
	DB	06H

ECMDDWN:	; EDTASM cmd 'down arrow' - Display next line
	XOR	A
	LD	BC,OUTSRCL	; Output source line(s) 
	PUSH	BC
	PUSH	AF
	LD	HL,(PCURLIN)	; Pointer to current line
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	CALL	FINDPRV		; Find previous line number < HL
	LD	BC,D0001
	LD	HL,(PFNDLIN)	; Pointer to found line 
	POP	AF
	RET	C
	LD	HL,(PENDTXT)	; Pointer to end of text
	EX	DE,HL
	LD	HL,(PNXTLIN)	; Pointer to next line  
	RST	18H
	RET	NZ
	LD	HL,(PLSTLIN)	; Pointer to last line  
	RET

FETRANG:	; Fetch a range of lines
	CALL	FETLINE		; Fetch a line expression
	LD	B,00H
	JR	C,L4C4B
	CP	0DH
	JR	Z,L4C49
	CP	1BH
	JR	Z,L4C49
	CP	2CH		; ','                   
	JR	Z,L4C49
	CP	3AH		; ':'                   
	JR	Z,FETENDL	; Fetch end line (:nnnnn)
	CP	21H		; '!'                   
	JR	Z,FETLNCT	; Fetch line count (!nn)
EBADPAR:	; "BAD PARAMETER(S)" error
	LD	HL,MBADPAR	; "BAD PARAMETER(S)"    
	JR	ERROR1		; Disp error message and abort command

L4C47:	POP	DE
	POP	HL
L4C49:	LD	B,01H
L4C4B:	PUSH	BC
	CALL	FINDPRV		; Find previous line number < HL
	JR	Z,L4C57
EBADLIN:	; "BAD LINE NUMBER" error
	LD	HL,MBADLIN	; "BAD LINE NUMBER"     
ERROR1:	; Disp error message and abort command
	JP	ERROR		; Disp error message and abort command

L4C57:	LD	HL,(PNXTLIN)	; Pointer to next line  
	EX	DE,HL
	LD	H,B
	LD	L,C
	POP	BC
	RET

FETENDL:	; Fetch end line (:nnnnn)
	CALL	FINDPRV		; Find previous line number < HL
	INC	A
	JR	Z,EBADLIN	; "BAD LINE NUMBER" error
	PUSH	BC
	PUSH	HL
	CALL	FETLINE		; Fetch a line expression
	JR	C,L4C47
	CP	0DH
	JR	Z,L4C78
	CP	1BH
	JR	Z,L4C78
	CP	2CH		; ','                   
	JR	NZ,EBADPAR	; "BAD PARAMETER(S)" error
L4C78:	POP	DE
	RST	18H
	JR	C,EBADPAR	; "BAD PARAMETER(S)" error
	CALL	FINDPRV		; Find previous line number < HL
	INC	A
	DEC	A
	JR	Z,EBADLIN	; "BAD LINE NUMBER" error
	LD	HL,(PNXTLIN)	; Pointer to next line  
	EX	DE,HL
	POP	HL
	LD	B,01H
	RET

FETLNCT:	; Fetch line count (!nn)
	CALL	FINDPRV		; Find previous line number < HL
	INC	A
	JR	Z,EBADLIN	; "BAD LINE NUMBER" error
	PUSH	BC
	PUSH	HL
	DEC	A
	PUSH	AF
	CALL	FETNUMB		; Fetch a line number   
	JR	Z,EBADPAR	; "BAD PARAMETER(S)" error
	CP	0DH
	JR	Z,L4CA6
	CP	1BH
	JR	Z,L4CA6
	CP	2CH		; ','                   
	JR	NZ,EBADPAR	; "BAD PARAMETER(S)" error
L4CA6:	LD	B,H
	LD	C,L
	LD	A,B
	OR	C
	JR	Z,EBADPAR	; "BAD PARAMETER(S)" error
	POP	AF
	JR	NZ,L4CB0
	INC	BC
L4CB0:	POP	HL
L4CB1:	PUSH	BC
	CALL	FINDPRV		; Find previous line number < HL
	POP	BC
	LD	HL,(PNXTLIN)	; Pointer to next line  
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	LD	A,L
	AND	H
	INC	A
	JR	Z,L4CC7
	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,L4CB1
L4CC7:	DEC	DE
	POP	HL
	INC	B
	RET

ECMDR:	; EDTASM cmd R - Replace R[line[,inc]]
	CALL	FETLINC		; Fetch a line number and an increment
	JP	NZ,EBADLIN	; "BAD LINE NUMBER" error
	LD	BC,DOINSRT	; Do insert lines       
	PUSH	HL
	PUSH	BC
DELCURL:	; Delete current line
	LD	HL,(PNXTLIN)	; Pointer to next line  
	EX	DE,HL
	LD	HL,(PLSTLIN)	; Pointer to last line  
	LD	(PNXTLIN),HL	; Pointer to next line  
	JR	DELRANG		; Delete a range of lines

ECMDD:	; EDTASM cmd D - Delete lines D[line1[:line2]]
	CALL	FETRANG		; Fetch a range of lines
DELRANG:	; Delete a range of lines
	PUSH	HL
	LD	(PCURLIN),HL	; Pointer to current line
	LD	HL,(PENDTXT)	; Pointer to end of text
	RST	18H
	JR	NZ,L4D05
	EX	(SP),HL
	PUSH	HL
	PUSH	DE
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	CALL	FINDPRV		; Find previous line number < HL
	LD	HL,(PFNDLIN)	; Pointer to found line 
	LD	(PCURLIN),HL	; Pointer to current line
	POP	DE
	POP	HL
	LD	(PNXTLIN),HL	; Pointer to next line  
	EX	(SP),HL
L4D05:	PUSH	DE
	XOR	A
	SUB	E
	LD	E,A
	SBC	A,D
	SUB	E
	LD	D,A
	ADD	HL,DE
	INC	HL
	INC	HL
	LD	B,H
	LD	C,L
	POP	HL
	POP	DE
	LDIR
	DEC	DE
	DEC	DE
	EX	DE,HL
	LD	(PENDTXT),HL	; Pointer to end of text
	RET

ECMDW:	; EDTASM cmd W - Write source to cassette W[ filename]
	CALL	FETFNAM		; Fetch file name       
	LD	C,0D3H
	CALL	WCSFNM		; Write cass filename with RDY CASS
	LD	HL,FCSOUT	; Cass out flag         
	INC	(HL)
	PUSH	HL
	LD	BC,D0000	; 0000 or EDTASM cmd B - Basic
	LD	HL,(PENDTXT)	; Pointer to end of text
	EX	DE,HL
	LD	HL,(PFSTLIN)	; Pointer to first line 
	CALL	OUTSRCL		; Output source line(s) 
	RST	28H

	DB	1AH

	POP	HL
	DEC	(HL)
	RET

ECMDL:	; EDTASM cmd L - Load file from cassette L[ filename]
	CALL	FETFNAM		; Fetch file name       
	LD	E,0D3H
	CALL	RCSFNM		; Read and chk cass filename with RDY CASS
	JR	NZ,L4D54
L4D45:	CALL	VCSIN		; Cassette input byte   
	CP	1AH
	JR	NZ,L4D45
	CALL	VCSOFF		; Turn off cassette     
	CALL	RCSFNM1		; Read and chk cass filename w/o RDY CASS
	JR	Z,L4D45
L4D54:	CP	1AH
	RET	Z
	LD	B,A
	CALL	CHK132C		; Check avail buf space for 132 chars
	LD	HL,(PFSTLIN)	; Pointer to first line 
	LD	(PCURLIN),HL	; Pointer to current line
	LD	A,B
	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	LD	B,05H
L4D67:	AND	7FH
	CALL	FETDIGT		; Fetch digit and add to line number HL
	CALL	VCSIN		; Cassette input byte   
	DJNZ	L4D67
	EX	DE,HL
	LD	HL,(PENDTXT)	; Pointer to end of text
	LD	(HL),E
	INC	HL
	LD	(HL),D
	INC	HL
	LD	(HL),00H
	LD	D,H
	LD	E,L
	CALL	CBLINK		; Blink asterisk in upper right corner
L4D80:	INC	HL
	LD	(PENDTXT),HL	; Pointer to end of text
	LD	(HL),0FFH
	INC	HL
	LD	(HL),0FFH
	DEC	HL
	CALL	VCSIN		; Cassette input byte   
	CP	0DH
	JR	NZ,L4D96
	CALL	VCSIN		; Cassette input byte   
	JR	L4D54

L4D96:	EX	DE,HL
	INC	(HL)
	EX	DE,HL
	LD	(HL),A
	JR	L4D80

ECMDX:	; EDTASM cmd X - Extend lines X[line1[:line2]] - LD A,0AFH (
	DB	3EH

ECMDE:	; EDTASM cmd E - Edit lines E[line1[:line2]]
	XOR	A
	PUSH	AF
	CALL	FETRANG		; Fetch a range of lines
	EX	DE,HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	EX	DE,HL
	PUSH	DE
L4DA9:	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	POP	DE
	RST	18H
	JR	Z,L4DBD
	POP	AF
	LD	(NPASS),A	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	PUSH	AF
	PUSH	DE
	CALL	EDITOR		; Line editor ?         
	EX	DE,HL
	JR	L4DA9

L4DBD:	POP	AF
	RET

EDITOR:	; Line editor ?
	CALL	FINDPRV		; Find previous line number < HL
	JP	NZ,EBADLIN	; "BAD LINE NUMBER" error
	PUSH	HL
	LD	H,B
	LD	L,C
	INC	HL
	INC	HL
	LD	C,(HL)
	LD	B,00H
	PUSH	BC
	INC	HL
	LD	DE,INPBUF	; Input buffer          
	CALL	DOLDIR		; Do LDIR if BC > 0     
	XOR	A
	LD	(DE),A
	POP	DE
L4DD8:	LD	HL,INPBUF	; Input buffer          
	EX	(SP),HL
	CALL	DLNUM		; Display line number in HL and ' '
	EX	(SP),HL
	LD	A,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	OR	A
	CALL	NZ,EDTEXTD	; Editor eXtend line    
L4DE7:	LD	B,00H
L4DE9:	CALL	WAITKEY		; Wait keystroke        
	CALL	TSTDIG		; Test if A is a digit. C set if not.
	JR	C,L4E08
	SUB	30H
	LD	C,A
	LD	A,B
	RLCA
	RLCA
	ADD	A,B
	RLCA
	ADD	A,C
	LD	B,A
	JR	L4DE9

OUTSTRZ:	; Output null-terminated string of up to 129 chars
	LD	B,81H
L4DFF:	LD	A,(HL)
	OR	A
	RET	Z
	INC	D
	RST	20H
	INC	HL
	DJNZ	L4DFF
	RET

L4E08:	PUSH	HL
	LD	HL,L4DE7
	EX	(SP),HL
	DEC	B
	INC	B
	JR	NZ,L4E12
	INC	B
L4E12:	CP	41H		; 'A'                   
	JR	NZ,L4E1C
	POP	BC
	RST	28H

	DB	0DH

	POP	HL
	JR	EDITOR		; Line editor ?         

L4E1C:	CP	4CH		; 'L'                   
	JR	NZ,L4E2A
	CALL	OUTSTRZ		; Output null-terminated string of up to 129 chars
	RST	28H

	DB	0DH

	POP	BC
	LD	D,00H
	JR	L4DD8

L4E2A:	CP	20H		; ' '                   
	JR	Z,L4DFF
	CP	0DH
	JR	NZ,L4E42
L4E32:	CALL	OUTSTRZ		; Output null-terminated string of up to 129 chars
L4E35:	RST	28H

	DB	0DH

	POP	BC
L4E38:	LD	A,E
	LD	(RMNCHRS),A	; Remaining chars counter
	CALL	DELCURL		; Delete current line   
	JP	L4805

L4E42:	CP	45H		; 'E'                   
	JR	Z,L4E35
	CP	43H		; 'C'                   
	JR	NZ,L4E5F
L4E4A:	LD	A,(HL)
	OR	A
	RET	Z
L4E4D:	CALL	WAITKEY		; Wait keystroke        
	CP	09H
	JR	Z,L4E58
	CP	1AH
	JR	C,L4E4D
L4E58:	LD	(HL),A
	RST	20H
	INC	HL
	INC	D
	DJNZ	L4E4A
	RET

L4E5F:	CP	44H		; 'D'                   
	JR	NZ,L4E6C
DELCHRS:	; Delete B chars at HL
	LD	A,(HL)
	OR	A
	RET	Z
	CALL	DELCHAR		; Delete char at HL     
	DJNZ	DELCHRS
	RET

L4E6C:	CP	51H		; 'Q'                   
	JP	Z,DOBREAK	; EDTASM do break       
	CP	49H		; 'I'                   
	JR	Z,EDTINSR	; Editor Insert         
	CP	58H		; 'X'                   
	JR	Z,EDTEXTD	; Editor eXtend line    
	CP	48H		; 'H'                   
	JR	NZ,L4ED4
	LD	(HL),00H
	LD	E,D
EDTEXTD:	; Editor eXtend line
	CALL	OUTSTRZ		; Output null-terminated string of up to 129 chars
	LD	(NPASS),A	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
EDTINSR:	; Editor Insert
	CALL	WAITKEY		; Wait keystroke        
	CP	0DH
	JR	Z,L4E32
	CP	1BH
	RET	Z
	CP	08H
	LD	BC,EDTINSR	; Editor Insert         
	PUSH	BC
	JR	NZ,INSPCHR	; Insert char at HL if printable
	INC	D
	DEC	D
	RET	Z
	CALL	DOBKSP		; EDTASM do backspace   
DELCHAR:	; Delete char at HL
	PUSH	HL
	DEC	E
L4EA0:	LD	A,(HL)
	OR	A
	SCF
	JR	Z,L4EAC
	INC	HL
	LD	A,(HL)
	DEC	HL
	LD	(HL),A
	INC	HL
	JR	L4EA0

L4EAC:	POP	HL
	RET

INSPCHR:	; Insert char at HL if printable
	CP	09H
	JR	Z,INSCHAR	; Insert char at HL     
	CP	1AH
	RET	C
INSCHAR:	; Insert char at HL
	PUSH	AF
	LD	A,E
	CP	80H
	JR	C,L4EBD
	POP	AF
	RET

L4EBD:	SUB	D
	LD	C,A
	INC	C
	LD	B,00H
	ADD	HL,BC
	PUSH	DE
	LD	D,H
	LD	E,L
	DEC	HL
	LDDR
	POP	DE
	INC	D
	INC	E
	POP	AF
	INC	HL
	LD	(HL),A
	INC	HL
	CALL	NC,JRST20	; Output single char in A to selected device(s)
	RET

L4ED4:	CP	53H		; 'S'                   
	JR	Z,EDTSK		; Editor Do search (NC) or kill (C)
	CP	4BH		; 'K'                   
	JR	NZ,L4EFB
	SCF
EDTSK:	; Editor Do search (NC) or kill (C)
	PUSH	AF
	CALL	WAITKEY		; Wait keystroke        
	LD	C,A
L4EE2:	LD	A,(HL)
	OR	A
	JR	Z,L4EF9
	POP	AF
	PUSH	AF
	LD	A,(HL)
	CALL	NC,JRST20	; Output single char in A to selected device(s)
	CALL	C,DELCHAR	; Delete char at HL     
	JR	C,L4EF3
	INC	HL
	INC	D
L4EF3:	LD	A,(HL)
	CP	C
	JR	NZ,L4EE2
	DJNZ	L4EE2
L4EF9:	POP	AF
	RET

L4EFB:	CP	08H
	RET	NZ
L4EFE:	CALL	DOBKSP		; EDTASM do backspace   
	DJNZ	L4EFE
	RET

ECMDM:	; EDTASM cmd M - Move Mtarg,range[,inc] - LD A,0AFH (!XOR A)
	DB	3EH

ECMDC:	; EDTASM cmd C - Copy Ctarg,range[,inc]
	XOR	A
	LD	(NPASS),A	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	CALL	FETLINE		; Fetch a line expression
	PUSH	HL
	CALL	FETRANG		; Fetch a range of lines
	INC	B
	DEC	B
	JP	Z,EBADPAR	; "BAD PARAMETER(S)" error
	PUSH	HL
	PUSH	DE
	PUSH	HL
	CALL	FETINC		; Fetch an increment    
	CALL	CHK132C		; Check avail buf space for 132 chars
	POP	DE
	POP	HL
	PUSH	HL
	OR	A
	SBC	HL,DE
	LD	BC,D0084
	ADD	HL,BC
	EX	DE,HL
	LD	A,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	OR	A
	CALL	Z,CHKBUFS	; Check avail buf space for DE chars
	POP	DE
	LD	BC,D0000	; 0000 or EDTASM cmd B - Basic
L4F34:	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	PUSH	DE
	PUSH	BC
	CALL	FINDPRV		; Find previous line number < HL
	POP	BC
	INC	BC
	POP	DE
	LD	HL,(PNXTLIN)	; Pointer to next line  
	RST	18H
	JR	NZ,L4F34
	POP	HL
	EX	(SP),HL
	PUSH	BC
	PUSH	HL
	PUSH	BC
	CALL	FINDPRV		; Find previous line number < HL
	POP	BC
	JR	NZ,L4F59
L4F51:	EX	DE,HL
	LD	HL,(LINEINC)	; Line increment        
	ADD	HL,DE
	JP	C,L47E0
L4F59:	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,L4F51
	LD	DE,DFFFA
	RST	18H
	JP	NC,L47E0
	LD	(ENDLNUM),HL	; New end line number for block copy/move
	PUSH	HL
	LD	HL,(PNXTLIN)	; Pointer to next line  
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	POP	HL
	RST	18H
	LD	HL,MNOROOM	; "NO ROOM BETWEEN LINES"
	JP	NC,ERROR	; Disp error message and abort command
	POP	HL
	CALL	FINDPRV		; Find previous line number < HL
	POP	BC
	EX	(SP),HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	POP	HL
	PUSH	DE
	JR	NZ,L4F89
	EX	DE,HL
	LD	HL,(LINEINC)	; Line increment        
	ADD	HL,DE
L4F89:	LD	(NXTLNUM),HL	; Next line number for block copy/move
L4F8C:	EX	(SP),HL
	PUSH	BC
L4F8E:	CALL	FINDPRV		; Find previous line number < HL
	EX	DE,HL
	LD	HL,(ENDLNUM)	; New end line number for block copy/move
	RST	18H
	LD	HL,(NXTLNUM)	; Next line number for block copy/move
	EX	DE,HL
	JR	C,L4FA8
	RST	18H
	JR	C,L4FA8
	LD	HL,(PNXTLIN)	; Pointer to next line  
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	JR	L4F8E

L4FA8:	LD	H,B
	LD	L,C
	POP	BC
	PUSH	HL
	CALL	CPYINPB		; Copy source line @HL to input buffer -> DE=length
	LD	A,E
	LD	(RMNCHRS),A	; Remaining chars counter
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	DEC	HL
	EX	DE,HL
	EX	(SP),HL
	LD	A,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	OR	A
	PUSH	BC
	CALL	NZ,DELRANG	; Delete a range of lines
	POP	BC
	POP	HL
	EX	(SP),HL
	PUSH	BC
	PUSH	HL
	LD	DE,L4FD1
	PUSH	DE
	PUSH	HL
	CALL	FINDPRV		; Find previous line number < HL
	JP	L4805

L4FD1:	POP	DE
	LD	HL,(LINEINC)	; Line increment        
	ADD	HL,DE
	POP	BC
	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,L4F8C
	POP	HL
	RET

FETFNAM:	; Fetch file name
	CALL	GETFNAM		; Get filename          
	JR	C,L4FE7
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	RET	Z
L4FE7:	JP	EBADPAR		; "BAD PARAMETER(S)" error

GETFNAM:	; Get filename
	LD	HL,LPRGNAM	; Length of program name (<= 6)
	LD	(HL),00H
	CALL	FETOPNI		; Fetch operand ignoring space
	CCF
	RET	Z
	OR	A
	JP	NZ,UNFETCH	; Unfetch one char      
	LD	A,06H
	CP	C
	LD	(HL),C
	LD	(PPRGNAM),DE	; Pointer to program name
	RET

WCSFNM:	; Write cass filename with RDY CASS
	CALL	RDYCASS		; Ready cassette        
	LD	A,(LPRGNAM)	; Length of program name (<= 6)
	LD	E,A
	LD	A,06H
	SUB	E
	LD	B,A
	LD	HL,(PPRGNAM)	; Pointer to program name
	PUSH	BC
	CALL	VCSHWR		; Turn on cassette and write header
	POP	BC
	LD	A,C
	CALL	VCSOUT		; Cassette output byte  
L5018:	DEC	E
	LD	A,(HL)
	INC	HL
	CALL	P,VCSOUT	; Cassette output byte  
	JP	P,L5018
L5021:	LD	A,20H		; ' '                   
	DEC	B
	CALL	P,VCSOUT	; Cassette output byte  
	JP	P,L5021
	RET

RCSFNM:	; Read and chk cass filename with RDY CASS
	CALL	RDYCASS		; Ready cassette        
RCSFNM1:	; Read and chk cass filename w/o RDY CASS
	CALL	VCSHIN		; Turn on cassette and read header
L5031:	CALL	VCSIN		; Cassette input byte   
	CP	E
	JR	NZ,L5031
	LD	HL,(PPRGNAM)	; Pointer to program name
	LD	A,(LPRGNAM)	; Length of program name (<= 6)
	LD	C,A
	LD	B,07H
L5040:	DEC	C
	JP	M,L504D
	DEC	B
	CALL	VCSIN		; Cassette input byte   
	CP	(HL)
	INC	HL
	JR	Z,L5040
	XOR	A
L504D:	PUSH	AF
L504E:	CALL	VCSIN		; Cassette input byte   
	LD	C,A
	DJNZ	L504E
	POP	AF
	LD	A,C
	RET

FETOPNI:	; Fetch operand ignoring space
	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	JR	L505F

FETOPN:	; Fetch operand not ignoring space
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
L505F:	LD	DE,(LINEPTR)	; Input line pointer    
	DEC	DE
	LD	C,01H
	RET	Z
	JR	NC,SKCHARS	; Skip chars            
	CALL	TSTLTR		; Test if A is a letter (uppercase). C set if not
	LD	A,02H
	RET	C
	CALL	SKCHARS		; Skip chars            
	PUSH	HL
	LD	HL,TOPRNDS	; Table of operands (regs, flags, ON/OFF)
	LD	B,01H
	CALL	KEYWORD		; Scan keywords, HL->found value, C if not found
	LD	A,(HL)
	AND	0FH
	LD	B,A
	LD	A,(HL)
	RRCA
	RRCA
	RRCA
	RRCA
	AND	0FH
	POP	HL
	CP	10H
	RET

SKCHARS:	; Skip chars
	INC	C
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,L509A
	JR	NC,SKCHARS	; Skip chars            
	CALL	TSTLTR		; Test if A is a letter (uppercase). C set if not
	JR	NC,SKCHARS	; Skip chars            
	CALL	UNFETCH		; Unfetch one char      
L509A:	DEC	C
	LD	A,01H
	RET

TOPRNDS:	; Table of operands (regs, flags, ON/OFF)
	DB	01H
	DB	'A'
	DB	37H,01H
	DB	'B'
	DB	30H,01H
	DB	'C'
	DB	31H,01H
	DB	'D'
	DB	32H,01H
	DB	'E'
	DB	33H,01H
	DB	'H'
	DB	34H,01H
	DB	'L'
	DB	35H,02H
	DB	'BC'
	DB	40H,02H
	DB	'DE'
	DB	41H,02H
	DB	'HL'
	DB	42H,02H
	DB	'SP'
	DB	43H,02H
	DB	'IX'
	DB	50H,02H
	DB	'IY'
	DB	51H,02H
	DB	'NZ'
	DB	60H,01H
	DB	'Z'
	DB	61H,02H
	DB	'NC'
	DB	62H,02H
	DB	'PO'
	DB	64H,02H
	DB	'PE'
	DB	65H,01H
	DB	'P'
	DB	66H,01H
	DB	'M'
	DB	67H,02H
	DB	'AF'
	DB	73H,01H
	DB	'I'
	DB	80H,01H
	DB	'R'
	DB	88H,02H
	DB	'ON'
	DB	90H,03H
	DB	'OFF'
	DB	91H,00H

L50F8:	LD	A,C
L50F9:	ADD	A,B
	LD	C,A
	LD	B,00H
	ADD	HL,BC
	POP	DE
	POP	BC
KEYWORD:	; Scan keywords, HL->found value, C if not found
	LD	A,(HL)
	AND	07H
	SCF
	RET	Z
	INC	HL
	PUSH	BC
	PUSH	DE
	CP	C
	JR	NZ,L50F9
L510B:	LD	A,(DE)
	INC	DE
	CP	(HL)
	JR	NZ,L50F8
	INC	HL
	DEC	C
	JR	NZ,L510B
	POP	DE
	POP	BC
CALLRET:	; Dummy call
	RET

EASMPSE:	; Assembler error with pause on WE ====== START ASM CODE ===
	LD	BC,ASMLOOP	; Assembler Main Loop - check for pause on error
	PUSH	BC

SEASSEM:	; LD A,0AFH (skip next XOR A)
	DB	3EH

EASSEM:	; Assembler error without pause on WE
	XOR	A
	PUSH	BC
	LD	B,A
	LD	A,(FZBUGNO)	; ZBUG active (not 0) / No output (bit 7)
	OR	A
	JP	NZ,ZERRMSG	; Display error message in DE and abort
	PUSH	HL
	LD	HL,(ASMERRC)	; Assembler error counter
	INC	HL
	LD	(ASMERRC),HL	; Assembler error counter
	EX	DE,HL
	LD	A,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	CP	02H
	JR	NZ,L514E
	CALL	TEEMSG7		; Tee message terminated with Bit 7, with NL
	LD	A,B
	OR	A
	JR	Z,L5149
	LD	BC,D0001
	LD	DE,OUTSRCL	; Output source line(s) 
	LD	HL,(PCURLIN)	; Pointer to current line
	CALL	TEEOUT		; Tee output            
L5149:	LD	A,01H
	LD	(FERROR),A	; Assembler error flag for pause
L514E:	EX	DE,HL
	POP	HL
	POP	BC
	RET

TEEMSG7:	; Tee message terminated with Bit 7, with NL
	LD	DE,DMSGBT7	; Disp message terminated with Bit 7, with NL
TEEOUT:	; Tee output
	PUSH	DE
	PUSH	BC
	PUSH	HL
	PUSH	HL
	LD	HL,OUTSEL	; Output selector       
	EX	(SP),HL
	PUSH	DE
	RET

OUTSEL:	; Output selector
	POP	HL
	POP	BC
	POP	DE
	LD	A,(AFLAGNL)	; Assembler flag: NL = No Listing
	OR	A
	RET	NZ
	LD	A,(AFLAGLP)	; Assembler flag: LP = Line Printer
	OR	A
	RET	Z
	LD	(FPRCHAR),A	; Print char flag (instead of video)
	PUSH	HL
	LD	HL,CLRFPC	; Clear print char flag 
	EX	(SP),HL
	PUSH	DE
	RET

CLRFPC:	; Clear print char flag
	XOR	A
	LD	(FPRCHAR),A	; Print char flag (instead of video)
	RET

FETCH5:	; Fetch operand type 5 (IX/IY)
	LD	A,05H

SFETCH4:	; LD BC,043EH (skip next LD A,04H)
	DB	01H

FETCH4:	; Fetch operand type 4 (16bit regs)
	LD	A,04H

SFETCH3:	; LD BC,033EH (skip next LD A,03H)
	DB	01H

FETCH3:	; Fetch operand type 3 (8bit regs)
	LD	A,03H
FETCHA:	; Fetch operand type (A)
	PUSH	HL
	LD	L,A
	CALL	FETOPN		; Fetch operand not ignoring space
	JR	Z,EMSINFO	; "MISSING INFORMATION" error
	PUSH	BC
	LD	B,A
	LD	A,(DE)
	CP	3BH		; ';'                   
	JR	Z,EMSINFO	; "MISSING INFORMATION" error
	CP	09H
	JR	Z,EMSINFO	; "MISSING INFORMATION" error
	CP	20H		; ' '                   
	LD	A,B
	POP	BC
	JR	Z,EMSINFO	; "MISSING INFORMATION" error
	CP	L
	POP	HL
	RET

EMSINFO:	; "MISSING INFORMATION" error
	LD	DE,MMSINFO	; "MISSING INFORMATION" 
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

UNFPARS:	; Unfetch and parse expr
	CALL	UNFETCH		; Unfetch one char      
	DEC	C
	JR	NZ,UNFPARS	; Unfetch and parse expr
JRST30:	; Parse expression ?
	PUSH	BC
	PUSH	HL
	LD	B,00H
	PUSH	BC
LEXPR:	; Expression main loop
	CALL	CHKSP		; Check for stack overflow
	CALL	PARSVAL		; Parse value           
	LD	(OPN1VAL),HL	; Operand 1 value       
	LD	DE,VBINOP	; Binary operators vector table
	LD	B,03H
	CALL	GETOPER		; Get operator          
	JP	C,EBADEXP	; "BAD EXPRESSION" error
	LD	(OPADDR),HL	; Ptr to operator prio and address
	LD	A,(HL)
	RLCA
	LD	HL,(OPN1VAL)	; Operand 1 value       
	EX	DE,HL
	JR	NC,XHIPRIO	; Exec higher priority operations
	INC	A
	CALL	NZ,UNFETCH	; Unfetch one char      
XPENDNG:	; End of expr: exec pending operations
	POP	AF
	OR	A
	JR	Z,ENDEXPR	; End of expression, store result
	CALL	DOOPER		; Unstack operand and operation, exec operation
	JR	XPENDNG		; End of expr: exec pending operations

ENDEXPR:	; End of expression, store result
	LD	(EXPRSLT),DE	; Expression result     
	POP	HL
	POP	BC
	RET

XHIPRIO:	; Exec higher priority operations
	LD	HL,(OPADDR)	; Ptr to operator prio and address
	LD	B,(HL)
	POP	AF
	CP	B
	JR	C,PUSHOP	; Push operand and operator address
	CALL	DOOPER		; Unstack operand and operation, exec operation
	JR	XHIPRIO		; Exec higher priority operations

PUSHOP:	; Push operand and operator address
	PUSH	AF
	PUSH	DE
	INC	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	PUSH	DE
	PUSH	BC
	JR	LEXPR		; Expression main loop  

DOOPER:	; Unstack operand and operation, exec operation
	POP	HL
	POP	BC
	EX	(SP),HL
	PUSH	BC
	RET

DPLUS:	; DE += HL
	ADD	HL,DE
	EX	DE,HL
	RET

DMINUS:	; DE := HL-DE
	OR	A
	SBC	HL,DE
	EX	DE,HL
	RET

DOR:	; DE |= HL
	LD	A,E
	OR	L
	LD	E,A
	LD	A,D
	OR	H
	LD	D,A
	RET

DXOR:	; DE ^= HL
	LD	A,E
	XOR	L
	LD	E,A
	LD	A,D
	XOR	H
	LD	D,A
	RET

DAND:	; DE &= HL
	LD	A,E
	AND	L
	LD	E,A
	LD	A,D
	AND	H
	LD	D,A
	RET

DMUL:	; DE *= HL
	LD	B,D
	LD	C,E
	LD	DE,D0000	; 0000 or EDTASM cmd B - Basic
L5220:	OR	A
	LD	A,B
	RRA
	LD	B,A
	LD	A,C
	RRA
	LD	C,A
	JR	NC,L522C
	EX	DE,HL
	ADD	HL,DE
	EX	DE,HL
L522C:	LD	A,B
	OR	C
	RET	Z
	ADD	HL,HL
	JR	L5220

DDIV:	; DE /= HL
	LD	BC,D0011
	EX	DE,HL
L5236:	INC	B
	DEC	C
	JR	Z,EDIV0		; Div by 0 error        
	ADD	HL,HL
	JR	NC,L5236
	LD	A,H
	RRA
	LD	H,A
	LD	A,L
	RRA
	LD	L,A
	PUSH	BC
	LD	A,B
	LD	BC,D0000	; 0000 or EDTASM cmd B - Basic
	OR	A
	EX	DE,HL
L524A:	PUSH	AF
	JR	C,L5251
	RST	18H
	CCF
	JR	NC,L5258
L5251:	LD	A,L
	SUB	E
	LD	L,A
	LD	A,H
	SBC	A,D
	LD	H,A
	SCF
L5258:	LD	A,C
	RLA
	LD	C,A
	LD	A,B
	RLA
	LD	B,A
	POP	AF
	ADD	HL,HL
	JR	NC,L5263
	INC	HL
L5263:	DEC	A
	JR	NZ,L524A
	POP	DE
L5267:	LD	A,H
	RRA
	LD	H,A
	LD	A,L
	RRA
	LD	L,A
	OR	A
	DEC	D
	JR	NZ,L5267
	LD	D,B
	LD	E,C
	RET

DMOD:	; DE .MOD. HL
	CALL	DDIV		; DE /= HL              
	EX	DE,HL
	RET

DEQU:	; DE .EQU. HL
	RST	18H
	LD	DE,D0000	; 0000 or EDTASM cmd B - Basic
	RET	NZ
	DEC	DE
	RET

DNEQ:	; DE .NEQ. HL
	CALL	DEQU		; DE .EQU. HL           
	INC	DE
	RET	Z
	DEC	DE
	DEC	DE
	RET

DSHL:	; HL <<= DE
	LD	A,D
	RLCA
	JR	C,DSHR		; HL >>= DE             
	OR	E
	JR	Z,L5297
L528F:	LD	B,H
	LD	C,L
	ADD	HL,BC
	DEC	DE
	LD	A,D
	OR	E
	JR	NZ,L528F
L5297:	EX	DE,HL
	RET

DSHR:	; HL >>= DE
	XOR	A
	LD	A,H
	RRA
	LD	H,A
	LD	A,L
	RRA
	LD	L,A
	INC	DE
	LD	A,D
	OR	E
	JR	NZ,DSHR		; HL >>= DE             
	EX	DE,HL
	RET

EDIV0:	; Div by 0 error
	LD	DE,MDIV0	; "DIVISION BY 0"       
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

GETOPER:	; Get operator
	LD	HL,(LINEPTR)	; Input line pointer    
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,L52DB
	LD	C,01H
	CP	2EH		; '.'                   
	JR	NZ,L52D7
	INC	HL
	LD	A,(HL)
	PUSH	DE
	LD	DE,D0004
	CP	4FH		; 'O'                   
	JR	NZ,L52C6
	DEC	DE
L52C6:	PUSH	HL
	ADD	HL,DE
	LD	A,(RMNCHRS)	; Remaining chars counter
	SUB	E
	JR	C,EBADEXP	; "BAD EXPRESSION" error
	LD	(LINEPTR),HL	; Input line pointer    
	LD	(RMNCHRS),A	; Remaining chars counter
	LD	C,E
	POP	HL
	POP	DE
L52D7:	EX	DE,HL
	JP	KEYWORD		; Scan keywords, HL->found value, C if not found

L52DB:	LD	HL,L5433
	OR	A
	RET

PARSVAL:	; Parse value
	CALL	FETOPN		; Fetch operand not ignoring space
	JR	Z,EBADEXP	; "BAD EXPRESSION" error
	OR	A
	JP	Z,PARSSYM	; Parse symbol          
	DEC	A
	JR	Z,JPARSLT	; Parse literal         
	DEC	A
	JR	NZ,EBADEXP	; "BAD EXPRESSION" error
	LD	A,(DE)
	CP	2EH		; '.'                   
	JR	NZ,PARSUNY	; Parse unary ops: ' $ - + ( .NOT.
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,DOLLAR	; Current PC            
	CALL	UNFETCH		; Unfetch one char      
	CP	4EH		; 'N'                   
	JR	Z,PARSUNY	; Parse unary ops: ' $ - + ( .NOT.
DOLLAR:	; Current PC
	LD	HL,(ASMPC)	; Assembler instruction current PC
	LD	A,(FZBUGNO)	; ZBUG active (not 0) / No output (bit 7)
	OR	A
	RET	Z
	LD	HL,(ZCURLOC)	; ZBUG current location 
	RET

PARSUNY:	; Parse unary ops: ' $ - + ( .NOT.
	CALL	UNFETCH		; Unfetch one char      
	LD	DE,VUNOPS	; Unary operators vector table
	LD	B,02H
	CALL	GETOPER		; Get operator          
	JR	C,EBADEXP	; "BAD EXPRESSION" error
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	JP	(HL)

UMINUS:	; Unary minus
	SCF
UNOT:	; Unary not
	PUSH	AF
	CALL	CHKSP		; Check for stack overflow
	CALL	PARSVAL		; Parse value           
	LD	A,H
	CPL
	LD	H,A
	LD	A,L
	CPL
	LD	L,A
	POP	AF
	RET	NC
	INC	HL
	RET

OPENPAR:	; Opening '('
	RST	30H
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	29H		; ')'                   
	EX	DE,HL
	RET	Z
EBADEXP:	; "BAD EXPRESSION" error
	LD	DE,MBADEXP	; "BAD EXPRESSION"      
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

SQUOTE:	; Single quote
	CALL	FETOPN		; Fetch operand not ignoring space
	JR	Z,EBADEXP	; "BAD EXPRESSION" error
	DEC	C
	JR	NZ,EBADEXP	; "BAD EXPRESSION" error
	LD	A,(DE)
	LD	L,A
	LD	H,C
	CALL	FETCHA		; Fetch operand type (A)
	LD	A,(DE)
	CP	27H		; '''                   
	JR	NZ,EBADEXP	; "BAD EXPRESSION" error
	RET

JPARSLT:	; Parse literal
	CALL	PARSLIT		; Parse literal value in dec/oct/hex
	RET	Z
	JR	EBADEXP		; "BAD EXPRESSION" error

PARSLIT:	; Parse literal value in dec/oct/hex
	LD	HL,NMBASIS	; Number basis for constant parsing
	LD	B,(HL)
	INC	HL
	LD	A,(HL)
	OR	A
	JR	Z,L5363
	LD	B,0AH
L5363:	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	CALL	UNFETCH		; Unfetch one char      
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	NC,L5391
	DEC	C
	CP	44H		; 'D'                   
	JR	NZ,L537C
	LD	A,B
	CP	0EH
	JR	NC,L5390
L5378:	LD	B,0AH
	JR	L5391

L537C:	CP	54H		; 'T'                   
	JR	Z,L5378
	LD	B,08H
	CP	4FH		; 'O'                   
	JR	Z,L5391
	CP	51H		; 'Q'                   
	JR	Z,L5391
	LD	B,10H
	CP	48H		; 'H'                   
	JR	Z,L5391
L5390:	INC	C
L5391:	LD	A,(DE)
	INC	DE
	CALL	TSTDIG		; Test if A is a digit. C set if not.
	JR	NC,L539E
	CALL	TSTLTR		; Test if A is a letter (uppercase). C set if not
	RET	C
	SUB	07H
L539E:	SUB	30H
	CP	B
	INC	B
	DEC	B
	RET	NC
	PUSH	BC
	PUSH	DE
	LD	D,H
	LD	E,L
	DEC	B
L53A9:	ADD	HL,DE
	DJNZ	L53A9
	LD	E,A
	LD	D,00H
	ADD	HL,DE
	POP	DE
	POP	BC
	DEC	C
	JR	NZ,L5391
	RET

VUNOPS:	; Unary operators vector table
	DB	01H,27H
	DW	SQUOTE
	DB	01H
	DB	'$'
	DW	DOLLAR
	DB	01H
	DB	'-'
	DW	UMINUS
	DB	01H
	DB	'+'
	DW	PARSVAL
	DB	01H
	DB	'('
	DW	OPENPAR
	DB	04H
	DB	'NOT.'
	DW	UNOT
	DB	00H
VBINOP:	; Binary operators vector table
	DB	01H
	DB	'+',02H
	DW	DPLUS
	DB	01H
	DB	'-',02H
	DW	DMINUS
	DB	01H
	DB	'*',05H
	DW	DMUL
	DB	01H
	DB	'/',05H
	DW	DDIV
	DB	04H
	DB	'DIV.',05H
	DW	DDIV
	DB	01H
	DB	'<',05H
	DW	DSHL
	DB	04H
	DB	'MOD.',05H
	DW	DMOD
	DB	01H
	DB	'!',03H
	DW	DOR
	DB	03H
	DB	'OR.',03H
	DW	DOR
	DB	04H
	DB	'XOR.',03H
	DW	DXOR
	DB	01H
	DB	'&',04H
	DW	DAND
	DB	04H
	DB	'AND.',04H
	DW	DAND
	DB	01H
	DB	'=',01H
	DW	DEQU
	DB	04H
	DB	'EQU.',01H
	DW	DEQU
	DB	04H
	DB	'NEQ.',01H
	DW	DNEQ
	DB	01H
	DB	' '
L5433:	DB	0FFH
	DW	D0000
	DB	01H,09H,0FFH
	DW	D0000
	DB	01H
	DB	',','~'+80H
	DW	D0000
	DB	01H
	DB	';','~'+80H
	DW	D0000
	DB	01H
	DB	')','~'+80H
	DW	D0000
	DB	00H

CHKSP:	; Check for stack overflow
	LD	HL,DFFEC
	ADD	HL,SP
	EX	DE,HL
	LD	HL,SPLIMIT	; SP limit for stack overflow checking
	RST	18H
	RET	C
	LD	DE,MSTKOVF	; "STACK OVERFLOW"      
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

GETPNAM:	; Get program name (dft: NONAME)
	CALL	GETFNAM		; Get filename          
	INC	(HL)
	DEC	(HL)
	RET	NZ
	LD	(HL),06H
	LD	HL,MNONAME	; "NONAME" default program name
	LD	(PPRGNAM),HL	; Pointer to program name
	RET

L546D:	RLCA
	LD	C,A
	LD	A,80H
	SBC	A,00H
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	CALL	DSTRB7		; Disp string terminated with Bit 7
DFLAGS:	; Display F-Flags or URDMF
	LD	A,C
	DJNZ	L546D
	RET

OUTSYMB:	; Output symbol
	LD	A,(HL)
	AND	07H
	LD	B,A
L5481:	INC	HL
	LD	A,(HL)
	RST	20H
	DJNZ	L5481
	RET

ECMDA:	; EDTASM cmd A - Assemble the source in buffer
	LD	HL,AFLAGNL	; Assembler flag: NL = No Listing
	LD	DE,D0004
	LD	B,08H
L548F:	LD	(HL),D
	ADD	HL,DE
	DJNZ	L548F
	CALL	GETPNAM		; Get program name (dft: NONAME)
	JP	C,EBADPAR	; "BAD PARAMETER(S)" error
	LD	HL,(PPRGNAM)	; Pointer to program name
	LD	DE,BPRGNAM	; Program name buffer   
	LD	(PPRGNAM),DE	; Pointer to program name
	LD	BC,D0006
	LDIR
L54A8:	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	JR	Z,L54C3
	CP	2FH		; '/'                   
	JP	NZ,EBADPAR	; "BAD PARAMETER(S)" error
	CALL	FETOPNI		; Fetch operand ignoring space
	LD	HL,TAFLAGS	; Table of assembler flags
	LD	B,01H
	CALL	KEYWORD		; Scan keywords, HL->found value, C if not found
	JP	C,EBADPAR	; "BAD PARAMETER(S)" error
	INC	(HL)
	JR	L54A8

L54C3:	LD	HL,(PUSRORG)	; Pointer to USRORG (command O)
	DEC	HL
	LD	(PSYMTBL),HL	; Pointer to symbols table
L54CA:	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	LD	A,(AFLAGIM)	; Assembler flag: IM = assemble to Internal Memory
	OR	A
	JR	Z,L54DC
	LD	A,(AFLAGAO)	; Assembler flag: AO = Absolute Origin
	OR	A
	JR	NZ,L54DC
	LD	HL,(PUSRORG)	; Pointer to USRORG (command O)
L54DC:	LD	(PORGREF),HL	; ASM org ref = AFLAGIM && !AFLAGA0 ? PUSRORG : 0000H
	LD	HL,(PSYMTBL)	; Pointer to symbols table
	XOR	A
	LD	(HL),A
	INC	HL
	LD	(PORGAUT),HL	; ASM auto org for IM = pointer to end of symbol table
	LD	(NPASS),A	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
L54EB:	LD	HL,(PFSTLIN)	; Pointer to first line 
	LD	(PNXTLIN),HL	; Pointer to next line  
	LD	A,0AH
	LD	(NMBASIS),A	; Number basis for constant parsing
BUG0002:	; BUG: missing init of SMACCNT, disabling DLNUM on listing
	LD	HL,D3939
	LD	(MACCT12),HL	; Macro invocation counter digits 1-2
	LD	(MACCT34),HL	; Macro invocation counter digits 3-4
	LD	HL,(ASMERRC)	; Assembler error counter
	EX	DE,HL
	LD	B,11H
	XOR	A
	LD	HL,OPCODES	; Opcodes length - ZBUG targ jump/call address
L5509:	LD	(HL),A
	INC	HL
	DJNZ	L5509
	INC	(HL)
	LD	B,(HL)
	LD	HL,(PORGREF)	; ASM org ref = AFLAGIM && !AFLAGA0 ? PUSRORG : 0000H
	LD	(ASMPC),HL	; Assembler instruction current PC
	DEC	B
	JR	Z,L551E
	DJNZ	L5548
	LD	A,(AFLAGIM)	; Assembler flag: IM = assemble to Internal Memory
	OR	A
L551E:	JP	Z,ASMLOOP	; Assembler Main Loop - check for pause on error
	LD	HL,AFLAGMO	; Assembler flag: MO = Manual Origin
	LD	A,(HL)
	OR	A
	JP	NZ,ASMLOOP	; Assembler Main Loop - check for pause on error
	LD	(HL),0FFH
	LD	HL,(PENDTXT)	; Pointer to end of text
	INC	HL
	LD	DE,(PORGAUT)	; ASM auto org for IM = pointer to end of symbol table
	ADD	HL,DE
	LD	DE,(PSYMTBL)	; Pointer to symbols table
	OR	A
	SBC	HL,DE
	LD	(PSYMTBL),HL	; Pointer to symbols table
	INC	HL
	LD	A,(AFLAGAO)	; Assembler flag: AO = Absolute Origin
	OR	A
	JR	Z,L54DC
	JP	L54CA

L5548:	EX	DE,HL
	LD	DE,DLNUM	; Display line number in HL and ' '
	CALL	TEEOUT		; Tee output            
	LD	HL,MTOTERR	; "TOTAL ERRORS"        
	CALL	TEEMSG7		; Tee message terminated with Bit 7, with NL
	LD	A,(AFLAGNS)	; Assembler flag: NS = No Symbols table
	OR	A
	JP	NZ,L55E7
	LD	A,(AFLAGLP)	; Assembler flag: LP = Line Printer
	LD	(FPRCHAR),A	; Print char flag (instead of video)
L5562:	RST	28H

	DB	0DH

	XOR	A
	LD	(DVDPOS),A	; Current logical position in line
	LD	D,A
	LD	E,A
	CALL	CKPAUSE		; Check for pause (Shift-@)
	LD	HL,(PSYMTBL)	; Pointer to symbols table
L5570:	LD	A,(HL)
	AND	07H
	LD	B,A
	JR	Z,L55A2
	PUSH	AF
	PUSH	DE
	PUSH	HL
	INC	HL
	BIT	7,(HL)
	JR	NZ,L5597
	LD	A,D
	OR	E
	JR	Z,L5593
	LD	A,(DE)
	AND	07H
	LD	C,A
L5586:	INC	DE
	LD	A,(DE)
	CP	(HL)
	INC	HL
	JR	C,L5597
	JR	NZ,L5593
	DEC	C
	JR	Z,L5597
	DJNZ	L5586
L5593:	POP	HL
	POP	DE
	PUSH	HL
	PUSH	HL
L5597:	POP	HL
	POP	DE
	POP	AF
	ADD	A,03H
	LD	C,A
	LD	B,00H
	ADD	HL,BC
	JR	L5570

L55A2:	LD	HL,(PSYMTBL)	; Pointer to symbols table
	LD	B,E
	LD	A,D
	OR	E
	JR	Z,L55E1
	EX	DE,HL
	LD	A,(HL)
	XOR	80H
	LD	(HL),A
	INC	HL
	SET	7,(HL)
	DEC	HL
	LD	C,(HL)
	CALL	OUTSYMB		; Output symbol         
	RST	28H

	DB	09H

	BIT	4,C
	JR	NZ,L55C6
	INC	HL
	INC	HL
	CALL	OUTXHL		; Out (HL) in hex       
	DEC	HL
	CALL	OUTXHL		; Out (HL) in hex       
L55C6:	RST	28H

	DB	09H

	LD	HL,MURDMF	; "U(ndef)/R(edef)/D(efl)/M(acro)/F(wdref)"
	LD	B,06H
	CALL	DFLAGS		; Display F-Flags or URDMF
	XOR	A
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	JP	L5562

L55D7:	LD	A,(HL)
	XOR	80H
	LD	(HL),A
	INC	HL
	RES	7,(HL)
	ADD	HL,BC
	INC	HL
	INC	HL
L55E1:	LD	A,(HL)
	AND	07H
	LD	C,A
	JR	NZ,L55D7
L55E7:	XOR	A
	LD	(FPRCHAR),A	; Print char flag (instead of video)
	LD	A,(AFLAGNO)	; Assembler flag: NO = No Output
	LD	HL,AFLAGIM	; Assembler flag: IM = assemble to Internal Memory
	OR	(HL)
	JP	NZ,DOBREAK	; EDTASM do break       
	LD	C,55H		; 'U'                   
	CALL	WCSFNM		; Write cass filename with RDY CASS
ASMLOOP:	; Assembler Main Loop - check for pause on error
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	CALL	CKPAUSE		; Check for pause (Shift-@)
	LD	HL,FERROR	; Assembler error flag for pause
	DEC	(HL)
	JR	NZ,ASMNOWE	; Assembler: no wait on error
	LD	DE,AFLAGWE	; Assembler flag: WE = Wait on Error
	LD	A,(DE)
	OR	A
	JR	Z,ASMNOWE	; Assembler: no wait on error
	CALL	WKEYBRK		; Wait any key, <BREAK> to abort
	SUB	43H
	LD	(DE),A
ASMNOWE:	; Assembler: no wait on error
	XOR	A
	LD	(HL),A
	LD	(RMNCHRS),A	; Remaining chars counter
	LD	HL,ASMLOOP	; Assembler Main Loop - check for pause on error
	PUSH	HL
	LD	HL,(OPCODES)	; Opcodes length - ZBUG targ jump/call address
	EX	DE,HL
	LD	HL,(ASMPC)	; Assembler instruction current PC
	ADD	HL,DE
	LD	(ASMPC),HL	; Assembler instruction current PC
	LD	(LOCADDR),HL	; Location address ptr  
	LD	H,A
	LD	L,A
	LD	(OPCODES),HL	; Opcodes length - ZBUG targ jump/call address
	LD	(OPCODEP),A	; Opcode prefix (0 if none)
	LD	HL,(PENDTXT)	; Pointer to end of text
	EX	DE,HL
	LD	HL,(PNXTLIN)	; Pointer to next line  
	RST	18H
	JP	Z,ASMNOES	; Assembler: no end statement
	LD	(PCURLIN),HL	; Pointer to current line
	INC	HL
	INC	HL
	LD	A,(HL)
	LD	(RMNCHRS),A	; Remaining chars counter
	INC	HL
	LD	(LINEPTR),HL	; Input line pointer    
	LD	D,00H
	LD	E,A
	ADD	HL,DE
	LD	(PNXTLIN),HL	; Pointer to next line  
	LD	A,(FMACRO)	; Flag macro being processed
	OR	A
	JP	Z,ASMNMAC	; End/skip macro processing
	LD	HL,(PCURLIN)	; Pointer to current line
	CALL	CPYINPB		; Copy source line @HL to input buffer -> DE=length
	PUSH	DE
	LD	HL,SMACSYM	; Macro invocation counter symbol #$YM
	LD	DE,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	BC,D0005
	LDIR
	LD	HL,SMACCNT	; Symbol to macro invocation counter to replace #$YM
	LD	(HL),04H
	LD	DE,LST2SUB	; Len of str to substitute (cmd S) followed by str
	LD	C,05H
	LDIR
	POP	DE
	CALL	DOSUBST		; Do substitution       
	PUSH	DE
	LD	HL,D42E4
	LD	DE,D42EA
	LD	BC,D0006
	LDIR
LMACSUB:	; Loop macro symbols substitution
	LD	HL,(D42EA)
	LD	A,(D42EE)
	LD	B,A
	LD	DE,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	XOR	A
	LD	(DE),A
	INC	DE
	CP	B
	JP	Z,XMACSUB	; Exit macro substitution loop
L5697:	LD	A,(LST2RPL)	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	CP	10H
	JR	Z,L56A5
	INC	A
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	A,(HL)
	LD	(DE),A
	INC	DE
L56A5:	INC	HL
	DEC	B
	JR	Z,L56C9
	LD	A,(HL)
	CP	23H		; '#'                   
	JP	Z,ESYNTAX	; "SYNTAX ERROR" error  
X56AF:	; Check 09H = TAB
	SUB	09H
	JR	Z,L56CA
X56B3:	; Check 20H = ' '
	SUB	17H
	JR	Z,L56CA
X56B7:	; Check 3BH = ';'
	SUB	1BH
	JR	Z,L56CA
X56BB:	; Check 2CH = ','
	CP	0F1H
	JR	NZ,L5697
	DEC	B
	JR	Z,L56C9
	INC	HL
	LD	A,(HL)
	CP	23H		; '#'                   
	JP	NZ,ESYNTAX	; "SYNTAX ERROR" error  
L56C9:	LD	A,B
L56CA:	LD	(D42EE),A
	LD	(D42EA),HL
	LD	HL,(D42EC)
	LD	A,(D42EF)
	LD	B,A
	LD	DE,LST2SUB	; Len of str to substitute (cmd S) followed by str
	XOR	A
	LD	(DE),A
	INC	DE
	LD	C,A
	DEC	HL
	CP	B
L56E0:	JR	Z,L5729
	INC	HL
	LD	A,(HL)
	SUB	27H
	JR	NZ,X56FC	; Check 09H = TAB       
	CP	C
	JR	NZ,L56F2
	INC	C
	DEC	B
	JP	Z,EMSINFO	; "MISSING INFORMATION" error
	JR	L56E0

L56F2:	DEC	B
	JR	Z,L5729
	INC	HL
	LD	A,(HL)
	SUB	27H
	JR	Z,L570C
	DEC	C
X56FC:	; Check 09H = TAB
	SUB	0E2H
	JR	Z,L571D
X5700:	; Check 20H = ' '
	SUB	17H
	JR	Z,L571D
X5704:	; Check 3BH = ';'
	SUB	1BH
	JR	Z,L571D
X5708:	; Check 2CH = ','
	SUB	0F1H
	JR	Z,L5722
L570C:	LD	A,(LST2SUB)	; Len of str to substitute (cmd S) followed by str
	CP	10H
	JR	Z,L571A
	INC	A
	LD	(LST2SUB),A	; Len of str to substitute (cmd S) followed by str
	LD	A,(HL)
	LD	(DE),A
	INC	DE
L571A:	DEC	B
	JR	L56E0

L571D:	CP	C
	JR	NZ,L570C
	JR	L572A

L5722:	CP	C
	JR	NZ,L570C
	DEC	B
	JR	Z,L5729
	INC	HL
L5729:	LD	A,B
L572A:	LD	(D42EF),A
	LD	(D42EC),HL
	POP	DE
	LD	D,00H
	CALL	DOSUBST		; Do substitution       
	PUSH	DE
	JP	NC,LMACSUB	; Loop macro symbols substitution
ETOOLNG:	; "NEW LINE TOO LONG" error
	LD	DE,MTOOLNG	; "NEW LINE TOO LONG"   
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

SMACSYM:	; Macro invocation counter symbol #$YM
	DB	04H
	DB	'#$YM'

XMACSUB:	; Exit macro substitution loop
	POP	DE
	PUSH	DE
	LD	A,E
	ADD	A,03H
	CP	80H
	JR	NC,ETOOLNG	; "NEW LINE TOO LONG" error
	LD	C,E
	LD	HL,INPBUF	; Input buffer          
	ADD	HL,BC
	LD	D,H
	LD	E,L
	DEC	HL
	INC	DE
	INC	DE
	LDDR
	INC	HL
	LD	(PCURLIN),HL	; Pointer to current line
	LD	A,0FFH
	LD	(HL),A
	INC	HL
	LD	(HL),A
	INC	HL
	POP	DE
	LD	(HL),E
	INC	HL
	LD	(LINEPTR),HL	; Input line pointer    
	LD	A,E
	LD	(RMNCHRS),A	; Remaining chars counter
	LD	HL,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	(HL),01H
	INC	HL
	LD	(HL),0DH
ASMNMAC:	; End/skip macro processing
	CALL	FETOPN		; Fetch operand not ignoring space
	PUSH	DE
	JR	Z,ASMENDL	; Assembler end of line or ';'
	LD	B,A
	LD	A,(DE)
	DEC	C
	CP	20H		; ' '                   
	JR	Z,ASMELBL	; Assembler end label   
	CP	09H
	JR	Z,ASMELBL	; Assembler end label   
	CP	2AH		; '*'                   
	JR	NZ,ASMSTMT	; Assemble statement (no '*' directive)
	POP	HL
	CALL	FETCHA		; Fetch operand type (A)
	LD	HL,LISTON	; *LIST ON flag         
	LD	A,(DE)
	CP	4CH		; 'L'                   
	JR	Z,L579D
	CP	4DH		; 'M'                   
	INC	HL
	JP	NZ,EBADOPC	; "BAD OPCODE" error    
L579D:	CALL	FETOPNI		; Fetch operand ignoring space
	JP	Z,EMSINFO	; "MISSING INFORMATION" error
	CP	09H
	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	PUSH	HL
	PUSH	BC
	INC	B
	DEC	B
	JR	NZ,L57AF
	LD	(HL),B
L57AF:	CALL	LSTLINE		; List line without location
	POP	BC
	POP	HL
	LD	(HL),B
	RET

ASMSTMT:	; Assemble statement (no '*' directive)
	CP	3BH		; ';'                   
	JR	Z,ASMENDL	; Assembler end of line or ';'
	LD	A,(MACRFLG)	; Skip assembly in macro - ZBUG regs save area
	OR	A
	JR	NZ,ASMENDL	; Assembler end of line or ';'
	LD	A,(CONDFLG)	; Skip assembly if not zero
	OR	A
	JR	Z,ASMOK		; OK to continue assembly
ASMENDL:	; Assembler end of line or ';'
	POP	DE
	JP	LSTLINE		; List line without location

ASMOK:	; OK to continue assembly
	INC	B
	DEC	B
	JR	Z,L57D4
EBADLBL:	; "BAD LABEL" error
	LD	DE,MBADLBL	; "BAD LABEL"           
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

L57D4:	INC	C
	LD	A,C
	CP	07H
	JR	NC,EBADLBL	; "BAD LABEL" error     
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JP	Z,EMSINFO	; "MISSING INFORMATION" error
	CP	20H		; ' '                   
	JR	Z,ASMELBL	; Assembler end label   
	CP	3AH		; ':'                   
	JR	NZ,EBADLBL	; "BAD LABEL" error     
ASMELBL:	; Assembler end label
	LD	L,C
	CALL	FETOPNI		; Fetch operand ignoring space
	INC	L
	DEC	L
	JR	NZ,L57F9
	LD	A,(DE)
	CP	3BH		; ';'                   
	JR	Z,ASMENDL	; Assembler end of line or ';'
	CP	0DH
	JR	Z,ASMENDL	; Assembler end of line or ';'
L57F9:	PUSH	HL
	EX	DE,HL
	LD	DE,TINSTR	; Table of instructions 
	XOR	A
L57FF:	PUSH	BC
	PUSH	HL
	LD	B,A
	LD	A,(DE)
	RLCA
	JR	NC,L5807
	INC	B
L5807:	OR	A
	JR	Z,AENDINS	; Asm instr not found (macro?)
	RRA

S580B:	; CP 1AH (skip next LD A,(DE))
	DB	0FEH

L580C:	LD	A,(DE)
	RLA
	PUSH	AF
	OR	A
	RRA
	CP	(HL)
	INC	DE
	JR	NZ,L5822
	DEC	C
	JR	Z,L582A
	POP	AF
	INC	HL
	JR	NC,L580C
L581C:	INC	DE
	POP	HL
	LD	A,B
	POP	BC
	JR	L57FF

L5822:	POP	AF
L5823:	JR	C,L581C
L5825:	LD	A,(DE)
	INC	DE
	RLA
	JR	L5823

L582A:	POP	AF
	JR	NC,L5825
AENDINS:	; Asm instr not found (macro?)
	EX	DE,HL
	POP	DE
	LD	A,B
	POP	BC
	LD	B,A
	LD	A,(MACRFLG)	; Skip assembly in macro - ZBUG regs save area
	JP	C,L58D5
	LD	HL,CONDFLG	; Skip assembly if not zero
	OR	(HL)
	POP	HL
	JR	NZ,ASMENDL	; Assembler end of line or ';'
	PUSH	HL
	LD	A,10H
	CALL	PARSSYM		; Parse symbol          
	PUSH	HL
	LD	HL,FMACRO	; Flag macro being processed
	INC	(HL)
	DEC	(HL)
	LD	DE,MNESTED	; "NESTED MACROS"       
	JP	NZ,EASMPSE	; Assembler error with pause on WE ====== START ASM COD
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,CNTMAC	; Count macro invocations
	CP	3BH		; ';'                   
	JR	Z,L5874
	CP	20H		; ' '                   
	JP	NZ,EBADOPC	; "BAD OPCODE" error    
CNTMAC:	; Count macro invocations
	LD	HL,OPN1VAL	; Operand 1 value       
	LD	A,39H		; '9'                   

SLCNTMC:	; 013630 - LD BC,3036H (skip LD (HL),'0')
	DB	01H

LCNTMAC:	; Loop to increment digits
	LD	(HL),30H	; '0'                   
	DEC	HL
	INC	(HL)
	CP	(HL)
	JR	C,LCNTMAC	; Loop to increment digits
	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	JR	Z,L587B
	CALL	UNFETCH		; Unfetch one char      
L5874:	SUB	3BH
	JR	NZ,L587B
	LD	(RMNCHRS),A	; Remaining chars counter
L587B:	LD	A,(RMNCHRS)	; Remaining chars counter
	LD	(D42E9),A
	LD	HL,(LINEPTR)	; Input line pointer    
	LD	(D42E6),HL
	LD	HL,(PNXTLIN)	; Pointer to next line  
	LD	(D42F0),HL
	POP	HL
	INC	HL
	INC	HL
	LD	A,(HL)
	LD	(RMNCHRS),A	; Remaining chars counter
	INC	HL
	EX	DE,HL
	LD	L,A
	LD	H,00H
	ADD	HL,DE
	LD	(PNXTLIN),HL	; Pointer to next line  
	EX	DE,HL
	LD	(LINEPTR),HL	; Input line pointer    
L58A1:	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,L58B7
	CP	23H		; '#'                   
	JR	Z,L58B4
	SUB	3BH
	JR	NZ,L58A1
	CALL	UNFETCH		; Unfetch one char      
	LD	(RMNCHRS),A	; Remaining chars counter
L58B4:	CALL	Z,UNFETCH	; Unfetch one char      
L58B7:	LD	A,(RMNCHRS)	; Remaining chars counter
	LD	(D42E8),A
	LD	HL,(LINEPTR)	; Input line pointer    
	LD	(D42E4),HL
	CALL	LSTLIN0		; List line with location - LD A,0AFH (skip XOR A)
	LD	A,01H
	LD	(FMACRO),A	; Flag macro being processed
	POP	BC
	POP	DE
	INC	C
	DEC	C
	RET	Z
	LD	HL,(ASMPC)	; Assembler instruction current PC
	JR	PARSSYM		; Parse symbol          

L58D5:	LD	E,B
	POP	BC
	OR	A
	JR	Z,L58E0
	LD	A,E
	CP	1DH
	JP	NZ,ASMENDL	; Assembler end of line or ';'
L58E0:	LD	A,(CONDFLG)	; Skip assembly if not zero
	OR	A
	JR	Z,L58F0
	LD	A,E
	CP	1FH
	JR	Z,L58F0
	CP	1EH
	JP	NZ,ASMENDL	; Assembler end of line or ';'
L58F0:	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,L5903
	CP	3BH		; ';'                   
	JR	Z,L5903
	CP	20H		; ' '                   
	JR	Z,L5903
EBADOPC:	; "BAD OPCODE" error
	LD	DE,MBADOPC	; "BAD OPCODE"          
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

L5903:	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	CALL	NZ,UNFETCH	; Unfetch one char      
	LD	A,(HL)
	LD	(OPCODE0),A	; Opcode byte 0         
	LD	HL,TVECASM	; Table of assembler vectors
	LD	D,00H
	ADD	HL,DE
	ADD	HL,DE
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	LD	A,E
	LD	DE,ENDSTMT	; Check end of stmt and process stmt
	EX	DE,HL
	EX	(SP),HL
	EX	DE,HL
	PUSH	HL
	INC	C
	DEC	C
	RET	Z
	CP	18H
	LD	A,01H
	LD	HL,(ASMPC)	; Assembler instruction current PC
	RET	NC
PARSSYM:	; Parse symbol
	PUSH	HL
	PUSH	AF
	LD	HL,(PSYMTBL)	; Pointer to symbols table
	LD	B,02H
	CALL	KEYWORD		; Scan keywords, HL->found value, C if not found
	JR	NC,L5979
	PUSH	DE
	LD	A,(FZBUGNO)	; ZBUG active (not 0) / No output (bit 7)
	OR	A
	LD	DE,MUNDSYM	; "UNDEFINED SYMBOL"    
	JP	NZ,EASMPSE	; Assembler error with pause on WE ====== START ASM COD
	PUSH	BC
	LD	HL,(PENDTXT)	; Pointer to end of text
	INC	HL
	INC	HL
	EX	DE,HL
	LD	HL,(PSYMTBL)	; Pointer to symbols table
	LD	A,C
	CP	07H
	JP	NC,ESYNTAX	; "SYNTAX ERROR" error  
	ADD	A,B
	CPL
	LD	C,A
	LD	B,0FFH
	ADD	HL,BC
	RST	18H
	JR	NC,L5961
	LD	HL,MSYMOVF	; "SYMBOL TABLE OVERFLOW"
	JP	ERROR		; Disp error message and abort command

L5961:	LD	(PSYMTBL),HL	; Pointer to symbols table
	POP	BC
	POP	DE
	POP	AF
	PUSH	AF
	AND	10H
	OR	C
	PUSH	BC
	LD	(HL),A
	EX	DE,HL
	INC	DE
	LD	B,00H
	LDIR
	EX	DE,HL
	LD	(HL),B
	INC	HL
	LD	(HL),B
	DEC	HL
	POP	BC
L5979:	POP	DE
	PUSH	HL
	LD	A,C
	CPL
	LD	C,A
	LD	B,0FFH
	ADD	HL,BC
	BIT	0,D
	JR	NZ,L59BB
	BIT	4,D
	JR	NZ,L59A4
	BIT	4,(HL)
	JR	NZ,L59B1
	BIT	7,(HL)
	LD	DE,MUNDSYM	; "UNDEFINED SYMBOL"    
	CALL	Z,EASSEM	; Assembler error without pause on WE
L5995:	BIT	6,(HL)
	LD	DE,MMULSYM	; "MULTIPLY DEFINED SYMBOL"
	CALL	NZ,EASSEM	; Assembler error without pause on WE
	POP	HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	POP	DE
	RET

L59A4:	BIT	4,(HL)
	JR	Z,L59AE
	BIT	7,(HL)
	JR	NZ,L5995
	SET	3,(HL)
L59AE:	JP	EBADOPC		; "BAD OPCODE" error    

L59B1:	POP	HL
	POP	DE
	LD	DE,MUNDSYM	; "UNDEFINED SYMBOL"    
	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	JR	L59ED

L59BB:	LD	A,D
	AND	10H
	LD	B,A
	LD	A,(HL)
	AND	10H
	XOR	B
	JR	NZ,L59E6
	BIT	7,(HL)
	JR	Z,L59F0
	BIT	6,(HL)
	JR	NZ,L59E6
	LD	A,D
	EX	(SP),HL
	POP	BC
	POP	DE
	PUSH	DE
	PUSH	HL
	PUSH	AF
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	RST	18H
	POP	DE
	JR	Z,L59FC
	LD	H,B
	LD	L,C
	BIT	5,(HL)
	JR	Z,L59E6
	BIT	1,D
	JR	NZ,L59FC
L59E6:	SET	6,(HL)
	POP	HL
	POP	HL
	LD	DE,MMULDEF	; "MULTIPLE DEFINITION" 
L59ED:	JP	EASSEM		; Assembler error without pause on WE

L59F0:	BIT	3,(HL)
	JR	NZ,EMACFWD	; "MACRO FWD REF" error 
	SET	7,(HL)
	BIT	1,D
	JR	Z,L59FC
	SET	5,(HL)
L59FC:	POP	HL
	POP	DE
	LD	(HL),E
	INC	HL
	LD	(HL),D
	RET

EMACFWD:	; "MACRO FWD REF" error
	LD	DE,MMACFWD	; "MACRO FWD REF"       
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

FET816:	; Fetch 8/16 bits opnd; ret if 16 bits or assem 8 bits
	CALL	FETCHA		; Fetch operand type (A)
	PUSH	AF
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	2CH		; ','                   
	JR	NZ,L5A1A
	POP	AF
	CP	03H
	RET	NZ
	LD	A,B
	CP	07H
L5A1A:	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	POP	HL
ASMAND:	; Assemble AND... single-opnd 8bit instr
	CALL	FETCHA		; Fetch operand type (A)
L5A21:	CP	03H
	JR	Z,A8BOPN	; Assemble 8-bit operand into opcode
	CALL	CHKOPAR		; Check opening parenthesis
	JR	Z,A8BOPN	; Assemble 8-bit operand into opcode
	PUSH	AF
	LD	HL,OPCODE0	; Opcode byte 0         
	LD	A,(HL)
	XOR	46H
	LD	(HL),A
	POP	AF
L5A33:	CALL	UNFPARS		; Unfetch and parse expr
	INC	HL
	LD	(HL),E
	CALL	ADD2OPC		; Add 2 opcodes to length
CHK8BS:	; Check value is signed 8 bits
	LD	A,D
	INC	A
	RET	Z
CHK8B:	; Check value is unsigned 8 bits
	LD	A,D
	OR	A
CHKZFLG:	; Check that Z flag is set
	PUSH	DE
	LD	DE,MFLDOVF	; "FIELD OVERFLOW"      
	CALL	NZ,EASSEM	; Assembler error without pause on WE
	POP	DE
	RET

ASMBIT:	; Assemble BIT... CB-instr 2-opnd
	RST	30H
	LD	A,E
	CP	08H
	JR	C,L5A51
	LD	D,01H
L5A51:	RLCA
	RLCA
	RLCA
	AND	38H
	LD	HL,OPCODE0	; Opcode byte 0         
	OR	(HL)
	LD	(HL),A
	CALL	CHK8B		; Check value is unsigned 8 bits
	CALL	CHKCOMA		; Check comma           
ASMRLC:	; Assemble RLC... CB-instr 1-opnd
	LD	HL,OPCODE0	; Opcode byte 0         
	LD	A,(HL)
	LD	(HL),0CBH
	INC	HL
	LD	(HL),A
	INC	HL
	INC	HL
	INC	(HL)
	CALL	FETCHA		; Fetch operand type (A)
A8BOPN:	; Assemble 8-bit operand into opcode
	OR	A
L5A70:	PUSH	AF
	CP	03H
	JR	Z,L5A77
	LD	B,06H
L5A77:	POP	AF
	PUSH	AF
	JR	NC,L5A80
	LD	A,B
	RLCA
	RLCA
	RLCA
	LD	B,A
L5A80:	LD	HL,OPCODES	; Opcodes length - ZBUG targ jump/call address
	INC	(HL)
	LD	A,04H
	SUB	(HL)
L5A87:	DEC	HL
	DEC	A
	JR	NZ,L5A87
	LD	A,B
	OR	(HL)
	LD	(HL),A
	POP	AF
	CP	03H
	RET	Z
	CALL	CHKOPAR		; Check opening parenthesis
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	CALL	FETCHA		; Fetch operand type (A)
	CP	05H
	JR	Z,ASMIXYO	; Assemble (IX/IY+offset)
L5A9E:	CP	04H
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	LD	A,B
	CP	02H
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
CHKCPAR:	; Check closing parenthesis, error if none
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	29H		; ')'                   
	RET	Z
EBADADM:	; "BAD ADDRESSING MODE" error
	LD	DE,MBADADM	; "BAD ADDRESSING MODE" 
	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

ASMIXYO:	; Assemble (IX/IY+offset)
	CALL	ASMIXIY		; Assemble IX/IY        
	INC	HL
	INC	HL
	CP	04H
	JR	NZ,L5AC0
	LD	B,(HL)
	INC	HL
	LD	(HL),B
	DEC	HL
L5AC0:	LD	(HL),00H
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	29H		; ')'                   
	RET	Z
	CALL	UNFETCH		; Unfetch one char      
	RST	30H
	LD	(HL),E
	LD	A,E
	RLA
	SBC	A,A
	SUB	D
	CALL	CHKZFLG		; Check that Z flag is set
	JR	CHKCPAR		; Check closing parenthesis, error if none

ASMIXIY:	; Assemble IX/IY
	LD	HL,OPCODEP	; Opcode prefix (0 if none)
	LD	(HL),0DDH
	DEC	B
	INC	B
	LD	B,02H
	JR	Z,ADD2OPC	; Add 2 opcodes to length
	LD	(HL),0FDH
ADD2OPC:	; Add 2 opcodes to length
	LD	A,(OPCODES)	; Opcodes length - ZBUG targ jump/call address
	ADD	A,02H
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	RET

ASMADC:	; Assemble ADC, SBC 8/16 bits
	CALL	FET816		; Fetch 8/16 bits opnd; ret if 16 bits or assem 8 bits
	CP	04H
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	LD	A,B
	CP	02H
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	LD	HL,OPCODE0	; Opcode byte 0         
	LD	A,(HL)
	RRCA
	AND	08H
	XOR	4AH
	LD	(HL),A
	CALL	A16BREG		; Assemble 16-bit reg pair into opcode
	LD	(HL),0EDH
	INC	HL
	LD	(HL),A
	RET

ASMADD:	; Assemble ADD 8/16 bits
	CALL	FET816		; Fetch 8/16 bits opnd; ret if 16 bits or assem 8 bits
	LD	HL,OPCODE0	; Opcode byte 0         
	LD	(HL),09H
	CP	05H
	JR	Z,L5B35
	CP	04H
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	LD	A,B
	CP	02H
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	CALL	ASMCCF		; Assemble CCF... single-byte
A16BREG:	; Assemble 16-bit reg pair into opcode
	CALL	FETCH4		; Fetch operand type 4 (16bit regs)
	JR	NZ,EBADADM	; "BAD ADDRESSING MODE" error
A16BB74:	; Assemble reg pair id [B.7-B.4] into opcode 0
	LD	A,B
A16BA74:	; Assemble reg pair id [A.7-A.4] into opcode 0
	RRCA
	RRCA
	RRCA
	RRCA
	LD	HL,OPCODE0	; Opcode byte 0         
	OR	(HL)
	LD	(HL),A
	RET

L5B35:	LD	C,B
	CALL	ASMIXIY		; Assemble IX/IY        
	LD	L,C
	CALL	FETCH4		; Fetch operand type 4 (16bit regs)
	JR	NZ,L5B46
	LD	A,B
	CP	02H
	JR	Z,L5B50
	JR	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0

L5B46:	CP	05H
	JR	NZ,L5B50
	LD	A,B
	CP	L
	LD	B,02H
	JR	Z,A16BB74	; Assemble reg pair id [B.7-B.4] into opcode 0
L5B50:	JP	EBADADM		; "BAD ADDRESSING MODE" error

ASMDEC:	; Assemble DEC/INC 8/16 bits
	CALL	FETCH4		; Fetch operand type 4 (16bit regs)
	JR	NZ,L5B5D
	CALL	ASMCCF		; Assemble CCF... single-byte
	JR	L5B66

L5B5D:	CP	05H
	SCF
	JP	NZ,L5A70
	CALL	ASMIXIY		; Assemble IX/IY        
L5B66:	LD	HL,OPCODE0	; Opcode byte 0         
	LD	A,(HL)
	RLCA
	RLCA
	RLCA
	AND	08H
	OR	03H
	LD	(HL),A
	JR	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0

ASMIM:	; Assemble IM 0/1/2
	RST	30H
	LD	A,E
	CP	03H
	JR	NC,L5B50
	OR	A
	JR	Z,L5B81
	INC	A
	RLCA
	RLCA
	RLCA
L5B81:	OR	46H
AOPCOD1:	; Assembler: put opcode1 and set len=2
	LD	HL,OPCODE1	; Opcode byte 0         
	LD	(HL),A
	JP	ADD2OPC		; Add 2 opcodes to length

ASMCPD:	; Assemble CPD/CPDR...
	LD	HL,OPCODE0	; Opcode byte 0         
	LD	A,(HL)
	LD	(HL),0EDH
	JR	AOPCOD1		; Assembler: put opcode1 and set len=2

ASMCALL:	; Assemble CALL [flg,]addr
	CALL	FETOPFL		; Fetch operand or flag 
ASMCLJP:	; Assemble CALL & JP common code
	PUSH	AF
	JR	NZ,L5B9C
	CALL	CHKCOMA		; Check comma           
	RST	30H
L5B9C:	POP	AF
ASMUP16:	; Assembler unfetch and put 16-bit addr or value
	CALL	NZ,UNFPARS	; Unfetch and parse expr
ASMP16:	; Assembler put 16-bit addr or value
	INC	HL
	LD	(HL),E
	INC	HL
	LD	(HL),D
	INC	HL
	LD	(HL),03H
	RET

FETOPFL:	; Fetch operand or flag
	CALL	FETCHA		; Fetch operand type (A)
FETFLG:	; Fetch flag
	LD	HL,OPCODE0	; Opcode byte 0         
	CP	03H
	JR	NZ,FETFLG1	; Opn type in A is FLAG (6), flag num in B
	LD	A,B
	DEC	A
	RET	NZ
	LD	B,03H
	LD	A,06H
FETFLG1:	; Opn type in A is FLAG (6), flag num in B
	CP	06H
	RET	NZ
	PUSH	AF
	LD	A,B
	RLCA
	RLCA
	RLCA
	LD	C,A
	LD	A,0C6H
	AND	(HL)
	OR	C
	LD	(HL),A
	POP	AF
	RET

CHKCOMA:	; Check comma
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	2CH		; ','                   
	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	RET

FETOPAR:	; Fetch and check opening parenthesis
	CALL	FETCHA		; Fetch operand type (A)
CHKOPAR:	; Check opening parenthesis
	PUSH	BC
	LD	B,A
	LD	A,(DE)
	CP	28H		; '('                   
MOPNPAR:	EQU	$-1
	LD	A,B
	POP	BC
	RET

ASMRET:	; Assemble RET [flg]
	CALL	ASMCCF		; Assemble CCF... single-byte
	CALL	FETOPN		; Fetch operand not ignoring space
	RET	Z
	CALL	FETFLG		; Fetch flag            
	RET	Z
	JP	UNFETCH		; Unfetch one char      

ASMJP:	; Assemble JP [flg,]addr; JP (HL/IX/IY)
	CALL	FETOPFL		; Fetch operand or flag 
	JR	Z,ASMCLJP	; Assemble CALL & JP common code
	PUSH	AF
	LD	A,(DE)
	CP	28H		; '('                   
	JR	NZ,L5B9C
	POP	AF
	LD	(HL),0E9H
	CALL	FETCH5		; Fetch operand type 5 (IX/IY)
	PUSH	AF
	CALL	NZ,ASMCCF	; Assemble CCF... single-byte
	POP	AF
	JP	NZ,L5A9E
	CALL	ASMIXIY		; Assemble IX/IY        
	JP	CHKCPAR		; Check closing parenthesis, error if none

ASMJR:	; Assemble JR [flg,]offset
	CALL	FETOPFL		; Fetch operand or flag 
	PUSH	AF
	CALL	NZ,UNFPARS	; Unfetch and parse expr
	POP	AF
	JR	NZ,ASMJOFF	; Assembler compute jump offset
	LD	A,B
	CP	04H
	JP	NC,EBADADM	; "BAD ADDRESSING MODE" error
	LD	A,(HL)
	OR	20H
	LD	(HL),A
	CALL	CHKCOMA		; Check comma           
ASMDJNZ:	; Assemble DJNZ offset
	RST	30H
ASMJOFF:	; Assembler compute jump offset
	LD	HL,(ASMPC)	; Assembler instruction current PC
	INC	HL
	INC	HL
	XOR	A
	SUB	L
	LD	L,A
	SBC	A,H
	SUB	L
	LD	H,A
	ADD	HL,DE
	LD	A,L
	INC	H
	JR	Z,L5C3D
	DEC	H
	JR	NZ,L5C41
	CPL
	INC	A
	JR	Z,L5C49
	CP	80H
	JR	Z,L5C41
L5C3D:	RLCA
	LD	A,L
	JR	C,L5C49
L5C41:	LD	DE,MJRERR	; "BRANCH OUT OF RANGE" 
	CALL	EASSEM		; Assembler error without pause on WE
	LD	A,0FEH
L5C49:	JP	AOPCOD1		; Assembler: put opcode1 and set len=2

ASMRST:	; Assemble RST nn
	RST	30H
	LD	A,D
	OR	A
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	LD	A,E
	AND	0C7H
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	LD	A,0C7H
	OR	E
	LD	(OPCODE0),A	; Opcode byte 0         
ASMCCF:	; Assemble CCF... single-byte
	LD	A,01H
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	RET

ASMIN:	; Assemble IN A,(nn) | IN R,(C)
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	CALL	CHKCOMA		; Check comma           
	PUSH	BC
	CALL	FETOPAR		; Fetch and check opening parenthesis
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	JR	NZ,L5C89
	DEC	B
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	LD	A,0EDH
	LD	(OPCODE0),A	; Opcode byte 0         
	POP	AF
	RLCA
	RLCA
	RLCA
	OR	40H
L5C83:	CALL	AOPCOD1		; Assembler: put opcode1 and set len=2
	JP	CHKCPAR		; Check closing parenthesis, error if none

L5C89:	LD	H,A
	POP	AF
	CP	07H
	LD	A,H
EBADAD1:	; "BAD ADDRESSING MODE" error shortcut
	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	CALL	UNFPARS		; Unfetch and parse expr
	CALL	CHK8B		; Check value is unsigned 8 bits
	LD	A,E
	JR	L5C83

ASMOUT:	; Assemble OUT (n),A | OUT (C),R|n
	CALL	FETOPAR		; Fetch and check opening parenthesis
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	PUSH	AF
	CALL	NZ,UNFPARS	; Unfetch and parse expr
	POP	AF
	PUSH	AF
	JR	NZ,L5CAD
	DEC	B
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
L5CAD:	CALL	CHKCPAR		; Check closing parenthesis, error if none
	CALL	CHKCOMA		; Check comma           
	PUSH	DE
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	POP	DE
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	POP	AF
	JR	Z,L5CC9
	LD	A,B
	CP	07H
	JR	NZ,EBADAD1	; "BAD ADDRESSING MODE" error shortcut
	CALL	CHK8B		; Check value is unsigned 8 bits
	LD	A,E
	JP	AOPCOD1		; Assembler: put opcode1 and set len=2

L5CC9:	LD	A,0EDH
	LD	(OPCODE0),A	; Opcode byte 0         
	LD	A,B
	RLCA
	RLCA
	RLCA
	OR	41H
	JP	AOPCOD1		; Assembler: put opcode1 and set len=2

ASMEX:	; Assemble EX AF,AF' | EX DE,HL | EX (SP),HL|IX|IY
	CALL	FETOPAR		; Fetch and check opening parenthesis
	JR	NZ,ASMEXNP	; Assemble EX DE,HL | EX AF,AF'
	CALL	FETCH4		; Fetch operand type 4 (16bit regs)
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	LD	A,B
	CP	03H
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	CALL	CHKCPAR		; Check closing parenthesis, error if none
	CALL	CHKCOMA		; Check comma           
	LD	A,0E3H
	LD	(OPCODE0),A	; Opcode byte 0         
	CALL	FETCH5		; Fetch operand type 5 (IX/IY)
	JP	Z,ASMIXIY	; Assemble IX/IY        
ACHKHL:	; Check for HL, if ok assemble sng-byte
	CP	04H
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	LD	A,B
	CP	02H
	JR	ASNGIFZ		; Assemble single-byte if Z

ASMEXNP:	; Assemble EX DE,HL | EX AF,AF'
	CP	04H
	JR	NZ,ASMEXAF	; Assemble EX AF,AF'    
	DEC	B
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	CALL	CHKCOMA		; Check comma           
	CALL	FETCHA		; Fetch operand type (A)
	JR	ACHKHL		; Check for HL, if ok assemble sng-byte

ASMEXAF:	; Assemble EX AF,AF'
	CP	07H
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	CALL	CHKCOMA		; Check comma           
	CALL	FETCHA		; Fetch operand type (A)
	CP	07H
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	LD	A,08H
	LD	(OPCODE0),A	; Opcode byte 0         
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	27H		; '''                   
ASNGIFZ:	; Assemble single-byte if Z
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	JP	ASMCCF		; Assemble CCF... single-byte

ASMPOP:	; Assemble POP|PUSH rr
	LD	BC,A16BB74	; Assemble reg pair id [B.7-B.4] into opcode 0
	PUSH	BC
	CALL	FETCH5		; Fetch operand type 5 (IX/IY)
	JP	Z,ASMIXIY	; Assemble IX/IY        
	CP	07H
	JP	Z,ASMCCF	; Assemble CCF... single-byte
	CP	04H
	JR	NZ,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	LD	A,B
	CP	03H
	JP	NZ,ASMCCF	; Assemble CCF... single-byte
EBADAD2:	; "BAD ADDRESSING MODE" error shortcut
	JP	EBADADM		; "BAD ADDRESSING MODE" error

ASMLD:	; Assemble LD xx,yy
	LD	HL,OPCODE0	; Opcode byte 0         
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	JR	NZ,ALDNOTR	; Assemble LD (HL|XY|mmmm),R|nn or LD RR,nnnn
	PUSH	BC
	LD	C,A
	LD	A,B
	RLCA
	RLCA
	RLCA
	OR	(HL)
	LD	(HL),A
	CALL	CHKCOMA		; Check comma           
	LD	A,B
	CP	07H
	LD	A,C
	POP	BC
	JP	NZ,ASMAND	; Assemble AND... single-opnd 8bit instr
	CALL	FETOPAR		; Fetch and check opening parenthesis
	JR	Z,ALDRXMM	; Assemble LD R|RR,(mem)
	CP	08H
	JP	NZ,L5A21
	LD	A,57H		; 'W'                   
	OR	B
	LD	(HL),A
	JP	ASMCPD		; Assemble CPD/CPDR...  

ALDRXMM:	; Assemble LD R|RR,(mem)
	CALL	FETCH5		; Fetch operand type 5 (IX/IY)
	JP	Z,ALDRXXY	; Assemble LD R,(IX|IY+d)
	CP	04H
	JR	NZ,ALDAMM	; Assemble LD A,(mmmm)  
	PUSH	BC
	DEC	B
	DEC	B
	POP	BC
	JP	NZ,ALDRRMM	; Assemble LD RR,(mmmm) 
ALDRXXY:	; Assemble LD R,(IX|IY+d)
	CALL	UNFETCH		; Unfetch one char      
	CALL	UNFETCH		; Unfetch one char      
	XOR	A
	LD	DE,MOPNPAR	; Points to opening parenthesis (for later CALL CHKOPAR
	JP	A8BOPN		; Assemble 8-bit operand into opcode

ALDRRMM:	; Assemble LD RR,(mmmm)
	LD	A,B
	CP	03H
	JR	Z,EBADAD2	; "BAD ADDRESSING MODE" error shortcut
	LD	(HL),0AH
	CALL	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0
	CALL	ASMCCF		; Assemble CCF... single-byte
	JP	CHKCPAR		; Check closing parenthesis, error if none

ALDAMM:	; Assemble LD A,(mmmm)
	LD	(HL),3AH	; ':'                   
	CALL	ASMUP16		; Assembler unfetch and put 16-bit addr or value
	JP	CHKCPAR		; Check closing parenthesis, error if none

ALDNOTR:	; Assemble LD (HL|XY|mmmm),R|nn or LD RR,nnnn
	CALL	CHKOPAR		; Check opening parenthesis
	JP	NZ,ALDHXNN	; Assemble LD HL|IX|IY,nnnn
	LD	(HL),70H	; 'p'                   
	CALL	FETCH5		; Fetch operand type 5 (IX/IY)
	JR	NZ,ALDMNXY	; Assemble LD (HL|mmmm),R|nn
	CALL	ASMIXYO		; Assemble (IX/IY+offset)
	CALL	CHKCOMA		; Check comma           
	XOR	A
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	CALL	ALDM8B		; Assemble LD (HL),R|nn 
	JP	ADD2OPC		; Add 2 opcodes to length

ALDMNXY:	; Assemble LD (HL|mmmm),R|nn
	CP	04H
	JR	NZ,ALDMMRX	; Assemble LD (mmmm),RR|A|IX|IY
	CALL	CHKCPAR		; Check closing parenthesis, error if none
	CALL	CHKCOMA		; Check comma           
	LD	A,B
	CP	02H
	JR	NZ,ALDMMRR	; Assemble LD (mmmm),RR 
ALDM8B:	; Assemble LD (HL),R|nn
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	JP	Z,A8BOPN	; Assemble 8-bit operand into opcode
	PUSH	AF
	LD	A,36H		; '6'                   
	LD	(OPCODE0),A	; Opcode byte 0         
	POP	AF
	JP	L5A33

ALDMMRR:	; Assemble LD (mmmm),RR
	CP	03H
	JP	Z,EBADADM	; "BAD ADDRESSING MODE" error
	PUSH	BC
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	JR	NZ,SBADADM	; Shortcut to "BAD ADDRESSING MODE" error
	LD	A,B
	CP	07H
	JR	NZ,SBADADM	; Shortcut to "BAD ADDRESSING MODE" error
	LD	(HL),02H
	POP	BC
	CALL	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0
	JP	ASMCCF		; Assemble CCF... single-byte

ALDMMRX:	; Assemble LD (mmmm),RR|A|IX|IY
	LD	(HL),02H
	CALL	ASMUP16		; Assembler unfetch and put 16-bit addr or value
	CALL	CHKCPAR		; Check closing parenthesis, error if none
	CALL	CHKCOMA		; Check comma           
	CALL	FETCH4		; Fetch operand type 4 (16bit regs)
	JR	NZ,ALDMMAX	; Assemble LD (mmmm),A|IX|IY
	LD	A,B
	CP	02H
	JP	Z,A16BB74	; Assemble reg pair id [B.7-B.4] into opcode 0
	INC	(HL)
	LD	HL,OPCODEP	; Opcode prefix (0 if none)
	LD	(HL),0EDH
	INC	HL
	LD	(HL),43H	; 'C'                   
	JP	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0

ALDMMAX:	; Assemble LD (mmmm),A|IX|IY
	CP	03H
	JR	NZ,ALDMMXY	; Assemble LD (mmmm),IX|IY
	LD	A,B
	CP	07H
	JR	NZ,SBADADM	; Shortcut to "BAD ADDRESSING MODE" error
	LD	A,32H		; '2'                   
	LD	(OPCODE0),A	; Opcode byte 0         
	RET

ALDMMXY:	; Assemble LD (mmmm),IX|IY
	CP	05H
SBADADM:	; Shortcut to "BAD ADDRESSING MODE" error
	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	DEC	(HL)
	CALL	ASMIXIY		; Assemble IX/IY        
	JP	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0

ALDHXNN:	; Assemble LD HL|IX|IY,nnnn
	LD	(HL),2AH	; '*'                   
	PUSH	AF
	CALL	CHKCOMA		; Check comma           
	POP	AF
	CP	05H
	JR	NZ,ALDSA	; Assemble LD I|R,A or LD RR,RR
	CALL	ASMIXIY		; Assemble IX/IY        
	INC	HL
	CALL	FETOPAR		; Fetch and check opening parenthesis
	PUSH	AF
	JR	Z,ALDMMMM	; Assembler put 16-bit addr
	LD	(HL),21H	; '!'                   
	CALL	ASMUP16		; Assembler unfetch and put 16-bit addr or value
	JR	ALDNNNN		; Assembler put 16-bit value

ALDMMMM:	; Assembler put 16-bit addr
	RST	30H
	CALL	ASMP16		; Assembler put 16-bit addr or value
ALDNNNN:	; Assembler put 16-bit value
	INC	(HL)
	POP	AF
	JP	Z,CHKCPAR	; Check closing parenthesis, error if none
	RET

ALDSA:	; Assemble LD I|R,A or LD RR,RR
	CP	08H
	JR	NZ,ALDRRRR	; Assemble LD RR,RR     
	LD	A,47H		; 'G'                   
	OR	B
	LD	(HL),A
	CALL	FETCH3		; Fetch operand type 3 (8bit regs)
	JR	NZ,SBADADM	; Shortcut to "BAD ADDRESSING MODE" error
	LD	A,B
	CP	07H
	JR	NZ,SBADADM	; Shortcut to "BAD ADDRESSING MODE" error
	JP	ASMCPD		; Assemble CPD/CPDR...  

ALDRRRR:	; Assemble LD RR,RR
	CP	04H
	JR	NZ,SBADADM	; Shortcut to "BAD ADDRESSING MODE" error
	LD	A,B
	CP	03H
	JR	NZ,ALDNSP	; Assemble LD RR,xx (except SP)
	LD	(HL),0F9H
	CALL	FETCH5		; Fetch operand type 5 (IX/IY)
	JP	Z,ASMIXIY	; Assemble IX/IY        
	CP	04H
	PUSH	HL
	LD	H,03H
	EX	(SP),HL
	JR	NZ,ALDRRXX	; Assemble LD RR,nnnn|(mmmm)
	DEC	B
	DEC	B
	JR	NZ,ALDRRXX	; Assemble LD RR,nnnn|(mmmm)
	POP	BC
	JP	ASMCCF		; Assemble CCF... single-byte

ALDNSP:	; Assemble LD RR,xx (except SP)
	PUSH	BC
	CALL	FETCHA		; Fetch operand type (A)
ALDRRXX:	; Assemble LD RR,nnnn|(mmmm)
	CALL	CHKOPAR		; Check opening parenthesis
	JR	Z,ALDHXMM	; Assemble LD HL|IX|IY,(mmmm)
	LD	(HL),01H
	CALL	ASMUP16		; Assembler unfetch and put 16-bit addr or value
	POP	BC
	JP	A16BB74		; Assemble reg pair id [B.7-B.4] into opcode 0

ALDHXMM:	; Assemble LD HL|IX|IY,(mmmm)
	LD	(HL),2AH	; '*'                   
	RST	30H
	CALL	ASMP16		; Assembler put 16-bit addr or value
	CALL	CHKCPAR		; Check closing parenthesis, error if none
	POP	AF
	CP	02H
	RET	Z
	LD	HL,OPCODEP	; Opcode prefix (0 if none)
	LD	(HL),0EDH
	INC	HL
	LD	(HL),4BH	; 'K'                   
	CALL	A16BA74		; Assemble reg pair id [A.7-A.4] into opcode 0
	LD	A,04H
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	RET

ASMDEFS:	; Assemble DEFS
	RST	30H
	LD	HL,(ASMPC)	; Assembler instruction current PC
	ADD	HL,DE
ASETPC:	; Assembler set PC to HL
	LD	(ASMPC),HL	; Assembler instruction current PC
	RET

ASMDEFM:	; Assemble DEFM
	POP	BC
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	SUB	27H
	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error
	LD	C,A
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	JR	Z,L5EE2
	CP	27H		; '''                   
L5EE2:	JP	Z,EBADADM	; "BAD ADDRESSING MODE" error
L5EE5:	LD	(OPCODE0),A	; Opcode byte 0         
	CALL	ASMCCF		; Assemble CCF... single-byte
	CALL	L61B3
	LD	HL,(LOCADDR)	; Location address ptr  
	LD	DE,(ASMPC)	; Assembler instruction current PC
	RST	18H
	JR	NZ,L5EFC
	INC	HL
	LD	(LOCADDR),HL	; Location address ptr  
L5EFC:	LD	(ASMPC),HL	; Assembler instruction current PC
	XOR	A
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	LD	C,01H
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	RET	Z
	CP	27H		; '''                   
	JR	NZ,L5EE5
	RET

ASMDEFB:	; Assemble DEFB
	RST	30H
	CALL	CHK8BS		; Check value is signed 8 bits
	LD	A,E
	LD	(OPCODE0),A	; Opcode byte 0         
	JP	ASMCCF		; Assemble CCF... single-byte

ASMDEFW:	; Assemble DEFW
	RST	30H
	EX	DE,HL
	LD	(OPCODE0),HL	; Opcode byte 0         
	JP	ADD2OPC		; Add 2 opcodes to length

ASMORG:	; Assemble ORG
	CALL	L5F35
	RST	30H
	LD	HL,(PORGREF)	; ASM org ref = AFLAGIM && !AFLAGA0 ? PUSRORG : 0000H
	ADD	HL,DE
	LD	(LOCADDR),HL	; Location address ptr  
	JR	ASETPC		; Assembler set PC to HL

L5F2E:	POP	HL
	EX	(SP),HL
	LD	HL,LSTLINE	; List line without location
	EX	(SP),HL
	PUSH	HL
L5F35:	INC	C
	DEC	C
	RET	Z
	JP	EBADLBL		; "BAD LABEL" error     

ASMNOES:	; Assembler: no end statement
	LD	DE,MNOENDS	; "NO END STATEMENT"    
	CALL	EASSEM		; Assembler error without pause on WE
	LD	A,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	CP	03H
L5F46:	JP	NZ,L54EB
ASMEND:	; Assemble END
	POP	HL
	CALL	L5F35
	CALL	FETOPN		; Fetch operand not ignoring space
	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	JR	Z,L5F59
	CALL	UNFPARS		; Unfetch and parse expr
	EX	DE,HL
L5F59:	LD	(LOCADDR),HL	; Location address ptr  
	PUSH	HL
	CALL	ENDSTMT		; Check end of stmt and process stmt
	POP	HL
	LD	A,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	CP	03H
	JR	NZ,L5F46
	LD	BC,DOBREAK	; EDTASM do break       
	PUSH	BC
L5F6C:	LD	A,(FCASBLK)	; Flag for pending cassette block
	OR	A
	CALL	NZ,WCASBLK	; Write cassette sys block
	LD	A,78H		; 'x'                   
	CALL	VCSOUT		; Cassette output byte  
	LD	A,L
	CALL	VCSOUT		; Cassette output byte  
	LD	A,H
	CALL	VCSOUT		; Cassette output byte  
	RET

ASMDEFL:	; Assemble DEFL
	ADD	A,02H
ASMEQU:	; Assemble EQU
	LD	B,A
	INC	C
	DEC	C
	JP	Z,EMSINFO	; "MISSING INFORMATION" error
	EX	DE,HL
	RST	30H
	LD	A,B
	EX	DE,HL
	LD	(LOCADDR),HL	; Location address ptr  
L5F90:	JP	PARSSYM		; Parse symbol          

ASMMACR:	; Assemble MACRO
	INC	C
	DEC	C
	JP	Z,EMSINFO	; "MISSING INFORMATION" error
	PUSH	DE
	PUSH	BC
	CALL	FETOPNI		; Fetch operand ignoring space
	JR	Z,L5FAE
	LD	A,(DE)
	CP	3BH		; ';'                   
	JR	Z,L5FAE
	CP	23H		; '#'                   
	JR	Z,L5FAE
ESYNTAX:	; "SYNTAX ERROR" error
	LD	DE,MSYNTAX	; "SYNTAX ERROR"        
L5FAB:	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

L5FAE:	POP	BC
	POP	DE
	LD	(MACRFLG),A	; Skip assembly in macro - ZBUG regs save area
	LD	HL,LSTLINE	; List line without location
	EX	(SP),HL
	LD	HL,(PCURLIN)	; Pointer to current line
	LD	A,11H
	JR	L5F90

ASMENDM:	; Assemble ENDM
	CALL	L5F35
	LD	HL,MACRFLG	; Skip assembly in macro - ZBUG regs save area
	XOR	A
	CP	(HL)
	LD	(HL),A
	JR	NZ,L5FD6
	INC	HL
	CP	(HL)
	LD	DE,MENDMWM	; "ENDM WITHOUT MACRO"  
	JR	Z,L5FAB
	LD	HL,(D42F0)
	LD	(PNXTLIN),HL	; Pointer to next line  
L5FD6:	CALL	CKENDST		; Check end of statement
	LD	DE,MSYNTAX	; "SYNTAX ERROR"        
	CALL	NZ,EASSEM	; Assembler error without pause on WE
	CALL	LSTLINE		; List line without location
	XOR	A
	LD	(FMACRO),A	; Flag macro being processed
	POP	HL
	RET

ASMCOND:	; Assemble COND
	CALL	L5F2E
	RST	30H
	LD	HL,CONDFLG	; Skip assembly if not zero
	LD	A,D
	OR	E
	JR	Z,L5FF8
	LD	A,(HL)
	OR	A
	JR	NZ,L5FF8
	INC	HL
L5FF8:	INC	(HL)
	RET

ASMENDC:	; Assemble ENDC
	CALL	L5F2E
	LD	HL,CONDFLG	; Skip assembly if not zero
	LD	A,(HL)
	OR	A
	JR	NZ,L600C
	INC	HL
	LD	A,(HL)
	OR	A
	LD	DE,MENDCWC	; "ENDC WITHOUT COND"   
	JR	Z,L5FAB
L600C:	DEC	(HL)
	RET

TINSTR:	; Table of instructions
	DB	'CC','F'+80H
	DB	3FH
	DB	'CP','L'+80H
	DB	2FH
	DB	'DA','A'+80H
	DB	27H
	DB	'D','I'+80H
	DB	0F3H
	DB	'E','I'+80H
	DB	0FBH
	DB	'EX','X'+80H
	DB	0D9H
	DB	'HAL','T'+80H
	DB	76H
	DB	'NO','P'+80H
	DB	00H
	DB	'RL','A'+80H
	DB	17H
	DB	'RLC','A'+80H
	DB	07H
	DB	'RR','A'+80H
	DB	1FH
	DB	'RRC','A'+80H
	DB	0FH
	DB	'SC','F'+80H
	DB	37H
	DB	'A'+80H
	DB	'N','D'+80H
	DB	0A0H
	DB	'C','P'+80H
	DB	0B8H
	DB	'O','R'+80H
	DB	0B0H
	DB	'SU','B'+80H
	DB	90H
	DB	'XO','R'+80H
	DB	0A8H
	DB	'R'+80H
	DB	'L','C'+80H
	DB	00H
	DB	'RR','C'+80H
	DB	08H
	DB	'R','L'+80H
	DB	10H
	DB	'R','R'+80H
	DB	18H
	DB	'SL','A'+80H
	DB	20H
	DB	'SR','A'+80H
	DB	28H
	DB	'SR','L'+80H
	DB	38H
	DB	'B'+80H
	DB	'I','T'+80H
	DB	40H
	DB	'RE','S'+80H
	DB	80H
	DB	'SE','T'+80H
	DB	0C0H
	DB	'A'+80H
	DB	'D','C'+80H
	DB	88H
	DB	'SB','C'+80H
	DB	98H
	DB	'A'+80H
	DB	'D','D'+80H
	DB	80H
	DB	'D'+80H
	DB	'E','C'+80H
	DB	05H
	DB	'IN','C'+80H
	DB	04H
	DB	'I'+80H,'M'+80H
	DB	0EDH
	DB	'C'+80H
	DB	'P','D'+80H
	DB	0A9H
	DB	'CPD','R'+80H
	DB	0B9H
	DB	'CP','I'+80H
	DB	0A1H
	DB	'CPI','R'+80H
	DB	0B1H
	DB	'IN','D'+80H
	DB	0AAH
	DB	'IND','R'+80H
	DB	0BAH
	DB	'IN','I'+80H
	DB	0A2H
	DB	'INI','R'+80H
	DB	0B2H
	DB	'LD','D'+80H
	DB	0A8H
	DB	'LDD','R'+80H
	DB	0B8H
	DB	'LD','I'+80H
	DB	0A0H
	DB	'LDI','R'+80H
	DB	0B0H
	DB	'NE','G'+80H
	DB	44H
	DB	'OTD','R'+80H
	DB	0BBH
	DB	'OTI','R'+80H
	DB	0B3H
	DB	'OUT','D'+80H
	DB	0ABH
	DB	'OUT','I'+80H
	DB	0A3H
	DB	'RET','I'+80H
	DB	4DH
	DB	'RET','N'+80H
	DB	45H
	DB	'RL','D'+80H
	DB	6FH
	DB	'RR','D'+80H
	DB	67H
	DB	'C'+80H
	DB	'AL','L'+80H
	DB	0CDH
	DB	'R'+80H
	DB	'E','T'+80H
	DB	0C9H
	DB	'J'+80H,'P'+80H
	DB	0C3H
	DB	'J'+80H,'R'+80H
	DB	18H
	DB	'D'+80H
	DB	'JN','Z'+80H
	DB	10H
	DB	'R'+80H
	DB	'S','T'+80H
	DB	0C7H
	DB	'I'+80H,'N'+80H
	DB	0DBH
	DB	'O'+80H
	DB	'U','T'+80H
	DB	0D3H
	DB	'E'+80H,'X'+80H
	DB	0EBH
	DB	'P'+80H
	DB	'O','P'+80H
	DB	0C1H
	DB	'PUS','H'+80H
	DB	0C5H
	DB	'L'+80H,'D'+80H
	DB	40H
	DB	'D'+80H
	DB	'EF','S'+80H
	DB	00H
	DB	'D'+80H
	DB	'EF','M'+80H
	DB	00H
	DB	'D'+80H
	DB	'EF','B'+80H
	DB	00H
	DB	'D'+80H
	DB	'EF','W'+80H
	DB	00H
	DB	'O'+80H
	DB	'R','G'+80H
	DB	00H
	DB	'E'+80H
	DB	'N','D'+80H
	DB	00H
	DB	'E'+80H
	DB	'Q','U'+80H
	DB	00H
	DB	'D'+80H
	DB	'EF','L'+80H
	DB	00H
	DB	'M'+80H
	DB	'ACR','O'+80H
	DB	00H
	DB	'E'+80H
	DB	'ND','M'+80H
	DB	00H
	DB	'C'+80H
	DB	'ON','D'+80H
	DB	00H
	DB	'E'+80H
	DB	'ND','C'+80H
	DB	00H
	DB	00H
TVECASM:	; Table of assembler vectors
	DW	ASMCCF,ASMAND,ASMRLC,ASMBIT
	DW	ASMADC,ASMADD,ASMDEC,ASMIM
	DW	ASMCPD,ASMCALL,ASMRET,ASMJP
	DW	ASMJR,ASMDJNZ,ASMRST,ASMIN
	DW	ASMOUT,ASMEX,ASMPOP,ASMLD
	DW	ASMDEFS,ASMDEFM,ASMDEFB,ASMDEFW
	DW	ASMORG,ASMEND,ASMEQU,ASMDEFL
	DW	ASMMACR,ASMENDM,ASMCOND,ASMENDC

CKENDST:	; Check end of statement
	CALL	FETCHNI		; Fetch to A not ignoring space: Z if EOL, NC if digit
	CP	20H		; ' '                   
	CALL	Z,FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	CP	0DH
	RET	Z
	CP	3BH		; ';'                   
	RET

ENDSTMT:	; Check end of stmt and process stmt
	CALL	CKENDST		; Check end of statement
	JP	NZ,EBADADM	; "BAD ADDRESSING MODE" error

LSTLIN0:	; List line with location - LD A,0AFH (skip XOR A)
	DB	3EH

LSTLINE:	; List line without location
	XOR	A
	LD	C,00H
L61B3:	LD	B,A
	LD	HL,NPASS	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	LD	A,(HL)
	DEC	A
	RET	Z
	DEC	A
	JP	NZ,ASMGEN	; Assembler generate binary output
	LD	A,(AFLAGIM)	; Assembler flag: IM = assemble to Internal Memory
	OR	A
	JR	Z,L61C8
	LD	DE,ASMGEN	; Assembler generate binary output
	PUSH	DE
L61C8:	DEC	HL
	LD	A,(HL)
	LD	HL,MLISTON	; *MLIST ON flag        
	AND	(HL)
	RET	NZ
	DEC	HL
	LD	A,(AFLAGNL)	; Assembler flag: NL = No Listing
	OR	(HL)
	RET	NZ
	LD	A,(AFLAGLP)	; Assembler flag: LP = Line Printer
	DEC	HL
	LD	(HL),A
	EX	DE,HL
	LD	HL,LOCADD1	; Location address ptr + 1
	INC	B
	DEC	B
	JR	NZ,OUTXHL1	; Out (HL):(HL-1) in hex
	LD	B,05H
L61E4:	RST	28H

	DB	' '

	DJNZ	L61E4
	INC	HL
	LD	A,(HL)
	OR	A
	JR	Z,L61EE
	DEC	HL
L61EE:	LD	B,09H
	PUSH	BC
	LD	A,(OPCODES)	; Opcodes length - ZBUG targ jump/call address
	LD	C,A
L61F5:	INC	HL
	DEC	C
	CALL	M,OUTSPC	; Output white space    
	CALL	P,OUTXHL	; Out (HL) in hex       
	DJNZ	L61F5
	LD	BC,D0001
	LD	HL,(PCURLIN)	; Pointer to current line
	POP	AF
	PUSH	AF
	CALL	NC,OUTSRCL	; Output source line(s) 
	POP	AF
	CALL	C,DISPNL	; Disp <New Line>       
	EX	DE,HL
	LD	(HL),B
	RET

OUTXHL1:	; Out (HL):(HL-1) in hex
	CALL	OUTXHL		; Out (HL) in hex       
	DEC	HL
	CALL	OUTXHL		; Out (HL) in hex       
	INC	HL
	LD	B,01H
	JR	L61E4

OUTXHL:	; Out (HL) in hex
	DEC	B
L621E:	LD	A,(HL)
	RRCA
	RRCA
	RRCA
	RRCA
	CALL	L6227
	LD	A,(HL)
L6227:	CALL	HEXNIBL		; Nibble in A to hex char
	RST	20H
	RET

HEXNIBL:	; Nibble in A to hex char
	AND	0FH
	ADD	A,30H
	CP	3AH		; ':'                   
	RET	C
	ADD	A,07H
	RET

ASMTOIM:	; Assemble to internal memory
	LD	DE,(PORGAUT)	; ASM auto org for IM = pointer to end of symbol table
	RST	18H
	JR	C,L624F
	LD	A,(AFLAGMO)	; Assembler flag: MO = Manual Origin
	INC	A
	JR	NZ,L6254
	LD	A,(AFLAGAO)	; Assembler flag: AO = Absolute Origin
	OR	A
	JR	NZ,L6254
	LD	DE,(PUSRORG)	; Pointer to USRORG (command O)
	RST	18H
	CCF
L624F:	LD	DE,MBADADD	; "BAD ADDRESS"         
	JR	C,L6260
L6254:	LD	A,(BC)
	LD	(HL),A
	CP	(HL)
	INC	HL
	LD	(LOCADDR),HL	; Location address ptr  
	LD	DE,MBADMEM	; "BAD MEMORY"          
	JR	Z,L626E
L6260:	JP	EASMPSE		; Assembler error with pause on WE ====== START ASM COD

ASMGEN:	; Assembler generate binary output
	LD	BC,OPCODEP	; Opcode prefix (0 if none)
	LD	A,(OPCODES)	; Opcodes length - ZBUG targ jump/call address
	PUSH	AF
	LD	A,(BC)
	OR	A
	JR	NZ,L626F
L626E:	INC	BC
L626F:	POP	AF
	DEC	A
	RET	M
	PUSH	AF
	LD	HL,(PLSTLOC)	; Last location address pointer
	INC	HL
	EX	DE,HL
	LD	HL,(LOCADDR)	; Location address ptr  
	LD	A,(AFLAGIM)	; Assembler flag: IM = assemble to Internal Memory
	OR	A
	JR	NZ,ASMTOIM	; Assemble to internal memory
	LD	(PLSTLOC),HL	; Last location address pointer
	LD	A,(FCASBLK)	; Flag for pending cassette block
	OR	A
	JR	Z,L6290
	RST	18H
	JR	Z,L62A7
L628D:	CALL	WCASBLK		; Write cassette sys block
L6290:	EX	DE,HL
	LD	HL,BCASBUF	; Cassette system block buffer; block checksum
	LD	A,E
	ADD	A,D
	LD	(HL),A
	XOR	A
	INC	HL
	LD	(HL),A
	CPL
	LD	(FCASBLK),A	; Flag for pending cassette block
	INC	HL
	LD	(HL),E
	INC	HL
	LD	(HL),D
	INC	HL
	LD	(BCASPTR),HL	; Cassette buffer pointer
	EX	DE,HL
L62A7:	LD	DE,BCASLEN	; Cassette system block length
	LD	A,(DE)
	INC	A
	CP	81H
	JR	Z,L628D
	LD	(DE),A
	INC	HL
	LD	(LOCADDR),HL	; Location address ptr  
	LD	HL,(BCASPTR)	; Cassette buffer pointer
	LD	A,(BC)
	LD	(HL),A
	INC	HL
	LD	(BCASPTR),HL	; Cassette buffer pointer
	INC	BC
	EX	DE,HL
	DEC	HL
	ADD	A,(HL)
	LD	(HL),A
	JR	L626F

WCASBLK:	; Write cassette sys block
	PUSH	HL
	PUSH	BC
	LD	A,(BCASLEN)	; Cassette system block length
	ADD	A,04H
	LD	B,A
	LD	HL,BCASBUF	; Cassette system block buffer; block checksum
	LD	C,(HL)
	LD	A,3CH		; '<'                   
	JR	JWCASBK		; Do write cassette sys block

LWCASBK:	; Write cassette sys block loop
	LD	A,(HL)
JWCASBK:	; Do write cassette sys block
	INC	HL
	CALL	VCSOUT		; Cassette output byte  
	DJNZ	LWCASBK
	LD	A,C
	CALL	VCSOUT		; Cassette output byte  
	XOR	A
	LD	(FCASBLK),A	; Flag for pending cassette block
	POP	BC
	POP	HL
	RET

ECMDO:	; EDTASM cmd O - Manual origin
	LD	HL,(PENDTXT)	; Pointer to end of text
	PUSH	HL
	INC	HL
	INC	HL
	INC	HL
	LD	(PENDTXT),HL	; Pointer to end of text
	EX	(SP),HL
	PUSH	HL
	LD	HL,MFSTLST	; "FIRST?LAST?"         
	LD	DE,PENDTXT	; Pointer to end of text
	LD	B,03H
L62FB:	CALL	DSTRB7		; Disp string terminated with Bit 7
	EX	DE,HL
	INC	HL
	CALL	L621E
	DEC	HL
	CALL	L621E
	INC	HL
	INC	HL
	EX	DE,HL
	DJNZ	L62FB
	POP	HL
	LD	(PENDTXT),HL	; Pointer to end of text
	LD	HL,MUSRORG	; "USRORG?"             
	CALL	DSTRB7		; Disp string terminated with Bit 7
	XOR	A
	LD	(DVDPOS),A	; Current logical position in line
	LD	C,A
	CALL	GETLINE		; Get text line (LD E,1EH: skip next LD E,00H)
	LD	(LINEPTR),HL	; Input line pointer    
	LD	A,(RMNCHRS)	; Remaining chars counter
	LD	C,A
	LD	DE,INPBUF	; Input buffer          
	LD	A,10H
	LD	(NMBASIS),A	; Number basis for constant parsing
	CALL	PARSLIT		; Parse literal value in dec/oct/hex
	JR	NZ,L6343
	POP	DE
	RST	18H
	JR	C,L6343
	EX	DE,HL
	LD	HL,(PLAST)	; Pointer to last RAM address
	INC	HL
	RST	18H
	JR	C,L6343
	LD	(PUSRORG),DE	; Pointer to USRORG (command O)
	RET

L6343:	LD	HL,MBADADD	; "BAD ADDRESS"         
	JP	ERROR		; Disp error message and abort command

MBADLBL:	; "BAD LABEL"
	DB	'BAD LABE','L'+80H
MJRERR:	; "BRANCH OUT OF RANGE"
	DB	'BRANCH OUT OF RANG','E'+80H
MBADADM:	; "BAD ADDRESSING MODE"
	DB	'BAD ADDRESSING MOD','E'+80H
MBADOPC:	; "BAD OPCODE"
	DB	'BAD OPCOD','E'+80H
MNOENDS:	; "NO END STATEMENT"
	DB	'NO END STATEMEN','T'+80H
MFLDOVF:	; "FIELD OVERFLOW"
	DB	'FIELD OVERFLO','W'+80H
MTOTERR:	; "TOTAL ERRORS"
	DB	'TOTAL ERROR','S'+80H
MSYNTAX:	; "SYNTAX ERROR"
	DB	'SYNTAX ERRO','R'+80H
MNESTED:	; "NESTED MACROS"
	DB	'NESTED MACRO','S'+80H
MENDMWM:	; "ENDM WITHOUT MACRO"
	DB	'ENDM WITHOUT MACR','O'+80H
MENDCWC:	; "ENDC WITHOUT COND"
	DB	'ENDC WITHOUT CON','D'+80H
MFSTLST:	; "FIRST?LAST?"
	DB	'FIRST','='+80H
	DB	'  LAST','='+80H
MUSRORG:	; "USRORG?"
	DB	'  USRORG','='+80H
MQUASH:	; "QUASH?"
	DB	'QUASH','?'+80H
MURDMF:	; "U(ndef)/R(edef)/D(efl)/M(acro)/F(wdref)"
	DB	'U'+80H,'R'+80H,'D'+80H,'M'+80H,'F'+80H
MBADADD:	; "BAD ADDRESS"
	DB	'BAD ADDRES','S'+80H
MBADMEM:	; "BAD MEMORY"
	DB	'BAD MEMOR','Y'+80H
MMSINFO:	; "MISSING INFORMATION"
	DB	'MISSING INFORMATIO','N'+80H
MMULDEF:	; "MULTIPLE DEFINITION"
	DB	'MULTIPLE DEFINITIO','N'+80H
MMULSYM:	; "MULTIPLY DEFINED SYMBOL"
	DB	'MULTIPLY DEFINED SYMBO','L'+80H
MUNDSYM:	; "UNDEFINED SYMBOL"
	DB	'UNDEFINED SYMBO','L'+80H
MBADEXP:	; "BAD EXPRESSION"
	DB	'BAD EXPRESSIO','N'+80H
MSYMOVF:	; "SYMBOL TABLE OVERFLOW"
	DB	'SYMBOL TABLE OVERFLO','W'+80H
MSTKOVF:	; "STACK OVERFLOW"
	DB	'STACK OVERFLO','W'+80H
MDIV0:	; "DIVISION BY 0"
	DB	'DIVISION BY ','0'+80H
MMACFWD:	; "MACRO FWD REF"
	DB	'MACRO FWD RE','F'+80H

CQUASH:	; Command 'Q'uash
	CALL	FETCH		; Fetch to A ignoring space: Z if EOL, NC if digit
	SUB	41H
	JR	Z,L64C2
	CP	19H
	JP	NZ,BADCMD	; Disp BAD COMMAND error msg and abort
L64C2:	LD	B,A
	LD	HL,MQUASH	; "QUASH?"              
	CALL	PREADY		; Prompt READY message and wait keypress
	LD	DE,ECMDZ	; EDTASM cmd Z - ZBUG ====== START ZBUG CODE ======
	LD	A,50H		; 'P'                   
	INC	B
	DEC	B
	JR	NZ,L64DE
	LD	(L4693),A
	LD	(L46BA),A
	LD	(L46BD),A
	LD	DE,EASMPSE	; Assembler error with pause on WE ====== START ASM COD
L64DE:	LD	(L46C3),A
	LD	HL,(PFSTLIN)	; Pointer to first line 
	EX	DE,HL
	LD	(PFSTLIN),HL	; Pointer to first line 
	PUSH	HL
	LD	HL,(PENDTXT)	; Pointer to end of text
	OR	A
	SBC	HL,DE
	INC	HL
	INC	HL
	LD	B,H
	LD	C,L
	EX	DE,HL
	POP	DE
	LDIR
	DEC	DE
	DEC	DE
	LD	(PENDTXT),DE	; Pointer to end of text
	RET

ECMDZ:	; EDTASM cmd Z - ZBUG ====== START ZBUG CODE ======
	LD	A,0C3H
	LD	(VRST08),A	; RST 08 jump           
	LD	HL,JRST08	; Handle ZBUG breakpoint
	LD	(VRST08A),HL	; RST 08 address (ZBUG bkpt)
	LD	B,3DH		; '='                   
	XOR	A
	LD	HL,LST2RPL	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
L650F:	LD	(HL),A
	INC	HL
	DJNZ	L650F
	INC	A
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	LD	A,10H
	LD	(NMBASIS),A	; Number basis for constant parsing
	LD	HL,D434E
	LD	(D42E7),HL
RESTZB:	; Restart with edit buffer and Z-bug bkpts preserved
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	CALL	SETVEC		; Install vectors       
	RST	28H

	DB	0EH

	LD	HL,MZBUG	; "ZBUG"                
	CALL	DMSGBT7		; Disp message terminated with Bit 7, with NL
	CALL	ZCLRBPS		; clear all breakpoints 
	CALL	ZCLRSTP		; Clear instr stop points
	XOR	A
	LD	(D4300),A
ZPMTCMD:	; ZBUG Prompt with '#' and get command
	CALL	ZPMTPND		; ZBUG Prompt with '#'  
	CALL	VCSOFF		; Turn off cassette     
ZGETCMD:	; ZBUG get command
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	LD	BC,ZPMTCMD	; ZBUG Prompt with '#' and get command
	PUSH	BC
	CALL	ZIMPCMD		; ZBUG input command    
	PUSH	HL
	LD	HL,(ZCURLOC)	; ZBUG current location 
	LD	DE,STR2RPL	; Str to replace (cmd S) - ZBUG mem mod enable flag
	LD	B,A
	LD	A,(DE)
	OR	A
	RET	Z
	XOR	A
	LD	(DE),A
	INC	C
	DEC	C
	RET	Z
	LD	A,B
	CP	0DH
	JR	Z,L6562
	CP	0AH
	RET	NZ
L6562:	RST	30H
	LD	(HL),E
	LD	A,E
	CP	(HL)
	JR	NZ,ZERRMEM	; disp "BAD MEMORY" error and abort
	LD	A,(ZINPTYP)	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	OR	A
	JR	Z,L6572
	DEC	A
	JR	Z,L6577
	RET

L6572:	LD	A,(ZMBWFLG)	; ZBUG Exam mode (Mnemo=0, Word=1, Byte=2)
	DEC	A
	RET	NZ
L6577:	INC	HL
	LD	(HL),D
	LD	A,D
	CP	(HL)
	RET	Z
ZERRMEM:	; disp "BAD MEMORY" error and abort
	LD	DE,MBADMEM	; "BAD MEMORY"          
	JP	ZERRMSG		; Display error message in DE and abort

ZPMTPND:	; ZBUG Prompt with '#'
	LD	A,23H		; '#'                   

S6584:	; LD BC,203EH (skip next LD A,' ')
	DB	01H

ZPMTSPC:	; ZBUG Prompt with ' '
	LD	A,20H		; ' '                   
	RST	28H

	DB	0DH

	RST	20H
	XOR	A
	LD	(DVDPOS),A	; Current logical position in line
	RET

ZKEYSLH:	; ZBUG '[addr]/' key - open addr / curr loc
	INC	C
	DEC	C
	JR	Z,ZXMHLNL	; ZBUG New Line; exam @HL; tab
	CALL	ZRDADDR		; Read address from command line
ZXMHLTB:	; ZBUG Exam @HL; tab
	LD	(ZCURLOC),HL	; ZBUG current location 
	RST	28H

	DB	09H

	CALL	ZEXAMHL		; ZBUG Exam @HL         
ZTAB:	; ZBUG Display TAB and enable memory modification
	LD	A,09H
	RST	20H
	LD	(STR2RPL),A	; Str to replace (cmd S) - ZBUG mem mod enable flag
	JR	ZGETCMD		; ZBUG get command      

ZKEYUP:	; ZBUG Up key - exam previous byte
	DEC	HL
ZXMHLNL:	; ZBUG New Line; exam @HL; tab
	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	CALL	ZDISLOC		; Display current location @HL
	XOR	A
	LD	(ZINPTYP),A	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	JR	ZXMHLTB		; ZBUG Exam @HL; tab    

ZKEYDN:	; ZBUG Down key - exam next location
	LD	HL,(ZNXTLOC)	; ZBUG next location    
	JR	ZXMHLNL		; ZBUG New Line; exam @HL; tab

ZEXNLHL:	; ZBUG Exam loc @HL with NL
	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	CALL	ZDISLOC		; Display current location @HL
	RST	28H

	DB	09H

ZEXAMHL:	; ZBUG Exam @HL
	EX	DE,HL
	LD	HL,ZINPTYP	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	LD	A,(HL)
	INC	HL
	LD	B,(HL)
	EX	DE,HL
	LD	E,(HL)
	LD	D,00H
	OR	A
	JR	NZ,ZEXARFL	; Exam register or flags
	INC	B
	DEC	B
	JR	NZ,ZEXAREG	; ZBUG Exam reg         
	LD	(ASMPC),HL	; Assembler instruction current PC
	CALL	ZDASM		; ZBUG Disass instr     
	LD	(ZNXTLOC),HL	; ZBUG next location    
	RET

ZEXARFL:	; Exam register or flags
	DEC	A
	JR	Z,ZEXAR16	; Exam 16-b register    
	DEC	A
	LD	A,E
	PUSH	AF
	CALL	ZEXAR8		; Exam 8-bit reg        
	POP	AF
	RET	Z
ZEXFLGS:	; Exam F-flags in A
	PUSH	HL
	PUSH	BC
	LD	C,A
	RST	28H

	DB	'='

	LD	HL,MFLAGS	; F-Flags: S-Z-?-H-?-P/V-N-C
	LD	B,09H
	CALL	DFLAGS		; Display F-Flags or URDMF
	POP	BC
	POP	HL
	LD	A,01H
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	RET

ZKEYCOL:	; ZBUG ':' key - exam curr loc in flags mode
	LD	A,(HL)
	CALL	ZEXFLGS		; Exam F-flags in A     
	JR	ZTAB		; ZBUG Display TAB and enable memory modification

ZEXAREG:	; ZBUG Exam reg
	DJNZ	ZEXAR8
ZEXAR16:	; Exam 16-b register
	INC	HL
	LD	D,(HL)
ZEXAR8:	; Exam 8-bit reg
	INC	HL
	LD	(ZNXTLOC),HL	; ZBUG next location    
	LD	A,(ZNUMFLG)	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	RLCA
	JP	NC,ZDISADD	; Display address in DE 
	LD	A,E
	RST	20H
	RET

ZRDADDR:	; Read address from command line
	XOR	A
	LD	(ZINPTYP),A	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	LD	DE,INPBUF	; Input buffer          
	LD	A,(RMNCHRS)	; Remaining chars counter
	CP	03H
	JR	NC,ZRAEVAL	; Eval address expression
	DEC	A
	LD	HL,FERROR	; Assembler error flag for pause
	JR	Z,ZRAR8		; Try 8-bit reg names   
	LD	HL,ZMREG16	; 16-bit reg names      
	LD	BC,D0700
L662E:	LD	A,(DE)
	CP	(HL)
	INC	HL
	JR	NZ,ZRANR16	; Try next 16-bit reg name
	INC	DE
	LD	A,(DE)
	DEC	DE
	CP	(HL)
	JR	NZ,ZRANR16	; Try next 16-bit reg name
	LD	HL,MACRFLG	; Skip assembly in macro - ZBUG regs save area
	LD	B,00H
	ADD	HL,BC
	ADD	HL,BC
	LD	A,01H
	LD	(ZINPTYP),A	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	RET

ZRANR16:	; Try next 16-bit reg name
	INC	HL
	INC	C
	DJNZ	L662E
	INC	DE
	LD	A,(DE)
	DEC	DE
	CP	27H		; '''                   
	JR	NZ,ZRAEVAL	; Eval address expression
	LD	A,(DE)
	CP	49H		; 'I'                   
	JR	Z,ZRAEVAL	; Eval address expression
	LD	HL,D42EE
ZRAR8:	; Try 8-bit reg names
	LD	A,(DE)
	LD	B,09H
	PUSH	HL
	LD	HL,ZSVRGNM	; ZBUG saved 8-bit reg names index
	LD	DE,D0000	; 0000 or EDTASM cmd B - Basic
L6663:	CP	(HL)
	JR	Z,ZRAR8F	; 8-bit reg name found  
	INC	HL
	INC	DE
	DJNZ	L6663
	POP	HL
ZRAEVAL:	; Eval address expression
	RST	30H
	EX	DE,HL
	RET

ZRAR8F:	; 8-bit reg name found
	LD	B,D
	CP	46H		; 'F'                   
	JR	NZ,L6674
	INC	B
L6674:	POP	HL
	ADD	HL,DE
	LD	A,02H
	OR	B
	LD	(ZINPTYP),A	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	RET

ZKEYSCL:	; ZBUG ';' key - exam current loc in numeric mode
	SCF

S667E:	; LD B,0AFH (skip next XOR A)
	DB	06H

ZKEYEQ:	; ZBUG '[expr]=' key - eval expression/exam current loc
	XOR	A
	LD	E,(HL)
	LD	D,A
	INC	C
	DEC	C
	PUSH	AF
	JR	Z,L668C
	JP	C,ZERR		; Display ZERR and abort cmd
	RST	30H
	OR	A
L668C:	LD	HL,ZNUMFLG	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	LD	A,(HL)
	PUSH	AF
	LD	(HL),01H
	JR	C,L669A
	CALL	ZDISADD		; Display address in DE 
	JR	L66A2

L669A:	RST	28H

	DB	' '

	LD	HL,(ZCURLOC)	; ZBUG current location 
	CALL	ZEXAMHL		; ZBUG Exam @HL         
L66A2:	POP	AF
	LD	(ZNUMFLG),A	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	POP	AF
	JP	Z,ZTAB		; ZBUG Display TAB and enable memory modification
	RET

ZKEYTAB:	; ZBUG Tab/Right key - open new location
	INC	C
	DEC	C
	JP	NZ,ZERR		; Display ZERR and abort cmd
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	LD	(OPCODES),HL	; Opcodes length - ZBUG targ jump/call address
	LD	A,(ZINPTYP)	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	OR	A
	JR	NZ,L66C4
	LD	A,(ZMBWFLG)	; ZBUG Exam mode (Mnemo=0, Word=1, Byte=2)
	OR	A
	CALL	Z,ZDASMNO	; ZBUG Disass instr with no output
L66C4:	LD	HL,(OPCODES)	; Opcodes length - ZBUG targ jump/call address
	JP	ZXMHLNL		; ZBUG New Line; exam @HL; tab

ZSVRGNM:	; ZBUG saved 8-bit reg names index
	DB	'I'
ZSVRGNA:	; ZBUG saved 8-bit reg names index without I
	DB	'FACBEDLH'

L66D3:	LD	HL,DVDPOS	; Current logical position in line
	LD	E,(HL)
	LD	(HL),C
	CALL	CLRLINE		; Clear line            
	LD	A,E
	SUB	C
	LD	(HL),A
ZIMPCMD:	; ZBUG input command
	LD	HL,INPBUF	; Input buffer          
	LD	(LINEPTR),HL	; Input line pointer    
	XOR	A
	LD	(RMNCHRS),A	; Remaining chars counter
	LD	C,A
	EX	DE,HL
L66EA:	LD	HL,VECZBUG	; Z-Bug keystrokes jump Table
	LD	B,0BH
	CALL	ZINKEY		; Get key and process it
	RET	Z
	CP	08H
	JR	Z,L6716
	CP	18H
	JR	Z,L66D3
	LD	(DE),A
	INC	DE
	INC	C
L66FE:	LD	A,C
	LD	(RMNCHRS),A	; Remaining chars counter
	CP	80H
	JR	C,L66EA
ZERR:	; Display ZERR and abort cmd
	LD	DE,MZERR	; "ZERR"                
ZERRMSG:	; Display error message in DE and abort
	EX	DE,HL
	RST	28H

	DB	09H

	CALL	DSTRB7		; Disp string terminated with Bit 7
	XOR	A
	LD	(NMBAS10),A	; Force number basis to 10 for constant parsing
	JP	ZPMTCMD		; ZBUG Prompt with '#' and get command

L6716:	INC	C
	DEC	C
	JR	Z,L66EA
	DEC	DE
	DEC	C
	JR	L66FE

ZINKEY:	; Get key and process it
	CALL	WAITKEY		; Wait keystroke        
	CP	0DH
	JR	Z,L6745
	CP	0AH
	JR	Z,L6745
	CP	08H
	JR	NZ,L6738
	INC	C
	DEC	C
	JR	Z,L6745
	PUSH	HL
	LD	HL,DVDPOS	; Current logical position in line
	DEC	(HL)
	DEC	(HL)
	POP	HL
L6738:	CP	18H
	JR	Z,L6745
	PUSH	AF
	CP	1BH
	JR	NZ,L6743
	LD	A,24H		; '$'                   
L6743:	RST	20H
	POP	AF
L6745:	CP	(HL)
	INC	HL
	JR	NZ,L674E
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	RET

L674E:	INC	HL
	INC	HL
	DJNZ	L6745
	RET

ZKEYESC:	; ZBUG Esc key - get command
	LD	HL,VECZCMD	; ZBUG $commands jump table
	LD	B,14H
	CALL	ZINKEY		; Get key and process it
	JP	NZ,ZERR		; Display ZERR and abort cmd
	LD	B,A
	LD	A,(RMNCHRS)	; Remaining chars counter
	OR	A
	LD	A,B
	JP	(HL)

VECZBUG:	; Z-Bug keystrokes jump Table
	DB	2FH		; '/'
	DW	ZKEYSLH		; ZBUG '[addr]/' key - open addr / curr loc
	DB	5BH		; '['
	DW	ZKEYUP		; ZBUG Up key - exam previous byte
	DB	0AH
	DW	ZKEYDN		; ZBUG Down key - exam next location
	DB	0DH
	DW	ZPMTCMD		; ZBUG Prompt with '#' and get command
	DB	40H		; '@'
	DW	ZKEYAT		; ZBUG '[addr]@' key - single step from addr / curr loc
	DB	3DH		; '='
	DW	ZKEYEQ		; ZBUG '[expr]=' key - eval expression/exam current loc
	DB	3BH		; ';'
	DW	ZKEYSCL		; ZBUG ';' key - exam current loc in numeric mode
	DB	01H
	DW	ZPMTCMD		; ZBUG Prompt with '#' and get command
	DB	1BH
	DW	ZKEYESC		; ZBUG Esc key - get command
	DB	09H
	DW	ZKEYTAB		; ZBUG Tab/Right key - open new location
	DB	3AH		; ':'
	DW	ZKEYCOL		; ZBUG ':' key - exam curr loc in flags mode
VECZCMD:	; ZBUG $commands jump table
	DB	4DH		; 'M'
	DW	ZCMDMBW		; ZBUG '$M'/'$B'/'$W' cmds - Mnemo/Byte/Word exam mode
	DB	42H		; 'B'
	DW	ZCMDMBW		; ZBUG '$M'/'$B'/'$W' cmds - Mnemo/Byte/Word exam mode
	DB	57H		; 'W'
	DW	ZCMDMBW		; ZBUG '$M'/'$B'/'$W' cmds - Mnemo/Byte/Word exam mode
	DB	4EH		; 'N'
	DW	ZCMDNZ		; ZBUG '$N'/'$S' cmds - numeric/symbolic debug mode
	DB	53H		; 'S'
	DW	ZCMDNZ		; ZBUG '$N'/'$S' cmds - numeric/symbolic debug mode
	DB	58H		; 'X'
	DW	ZCMDX		; ZBUG 'addr$X' cmd - set breakpoint at addr
	DB	59H		; 'Y'
	DW	ZCMDY		; ZBUG '[n]$Y' cmd - yank nth/all breakpoint(s)
	DB	44H		; 'D'
	DW	ZCMDD		; ZBUG '$D' cmd - display all breakpoints
	DB	43H		; 'C'
	DW	ZCMDC		; ZBUG '[n]$C' cmd - continue n times / resume exec
	DB	47H		; 'G'
	DW	ZCMDG		; ZBUG '[addr]$G' cmd - go exec at addr / current PC
	DB	49H		; 'I'
	DW	ZCMDIO		; ZBUG 'rdx$I'/'rdx$O' cmds - set radix for input/output
	DB	4FH		; 'O'
	DW	ZCMDIO		; ZBUG 'rdx$I'/'rdx$O' cmds - set radix for input/output
	DB	4CH		; 'L'
	DW	ZCMDL		; ZBUG ' name$L' cmd - load system tape
	DB	50H		; 'P'
	DW	ZCMDP		; ZBUG 'first last exec name$P' cmd - punch sys tape
	DB	52H		; 'R'
	DW	ZCMDR		; ZBUG '$R' cmd - display all regs
	DB	54H		; 'T'
	DW	ZCMDT		; ZBUG 'first last $T' cmd - display block [first,last]
	DB	45H		; 'E'
	DW	ZCMDE		; ZBUG '$E' cmd - exit ZBUG
	DB	01H
	DW	ZPMTCMD		; ZBUG Prompt with '#' and get command
	DB	0DH
	DW	ZPMTCMD		; ZBUG Prompt with '#' and get command
	DB	41H		; 'A'
	DW	ZCMDA		; ZBUG '$A' cmd - set ASCII output mode

L67C2:	LD	L,A
	INC	L
	LD	H,00H
	LD	A,(BC)
	ADD	HL,BC
	LD	B,H
	LD	C,L
	RLCA
	JR	NC,L6802
	AND	20H
	JR	NZ,L6802
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	EX	DE,HL
	RST	18H
	EX	DE,HL
	JR	C,L6802
	EX	DE,HL
	EX	(SP),HL
	EX	DE,HL
	RST	18H
	EX	DE,HL
	EX	(SP),HL
	EX	DE,HL
	JR	C,L6802
	EX	(SP),HL
	LD	HL,(D42FE)
	LD	(ASMERRC),HL	; Assembler error counter
	JR	L6802

ZDISSYM:	; Display DE in symbolic mode
	LD	HL,D0000	; 0000 or EDTASM cmd B - Basic
	LD	(ASMERRC),HL	; Assembler error counter
	PUSH	HL
	LD	L,32H		; '2'                   
	RST	18H
	JR	NC,L67FD
	LD	HL,DFFCD
	ADD	HL,DE
	EX	(SP),HL
L67FD:	LD	BC,(PSYMTBL)	; Pointer to symbols table
	LD	HL,D0303
L6802:	EQU	$-2
	LD	(D42FE),BC
	LD	A,(BC)
	AND	07H
	JR	NZ,L67C2
	LD	HL,(ASMERRC)	; Assembler error counter
	LD	A,H
	OR	L
	POP	BC
	JR	Z,L6824
	PUSH	BC
	CALL	OUTSYMB		; Output symbol         
	POP	HL
	EX	DE,HL
	OR	A
	SBC	HL,DE
	LD	A,H
	OR	L
	RET	Z
	RST	28H

	DB	'+'

	EX	DE,HL
L6824:	LD	HL,ZNUMFLG	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	JR	ZDISNUM		; Display DE in numeric format

ZDISADD:	; Display address in DE
	LD	A,(FZBUGNO)	; ZBUG active (not 0) / No output (bit 7)
	OR	A
	RET	M
	LD	HL,ZNUMFLG	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	LD	B,(HL)
	DJNZ	ZDISSYM
ZDISNUM:	; Display DE in numeric format
	LD	C,00H
	LD	A,D
	OR	E
	JR	Z,L6880
	INC	HL
	LD	B,(HL)
	EX	DE,HL
	DJNZ	ZHEXOCT
	CALL	ZDISDEC		; Display DE in decimal 
	RST	28H

	DB	'T'

	RET

ZHEXOCT:	; Display DE in hex or octal
	DJNZ	ZHEXHL
	LD	B,06H
	XOR	A
L684A:	ADD	HL,HL
	RLA
	AND	07H
	JR	NZ,L6853
	CP	C
	JR	Z,L6857
L6853:	OR	30H
	RST	20H
	INC	C
L6857:	ADD	HL,HL
	RLA
	ADD	HL,HL
	RLA
	DJNZ	L684A
	RST	28H

	DB	'Q'

	RET

ZHEXHL:	; ZBUG disp HL in hex
	LD	A,H
	CALL	L6868
	LD	A,L
	LD	DE,D010E
ZHEXA:	EQU	$-2
L6868:	LD	B,A
	RRCA
	RRCA
	RRCA
	RRCA
	CALL	L6871
	LD	A,B
L6871:	CALL	HEXNIBL		; Nibble in A to hex char
	INC	C
	DEC	C
	JR	NZ,L6882
	CP	30H		; '0'                   
	RET	Z
	INC	C
	CP	41H		; 'A'                   
	JR	C,L6882
L6880:	RST	28H

	DB	'0'

L6882:	RST	20H
	RET

ZDISLOC:	; Display current location @HL
	PUSH	HL
	EX	DE,HL
	LD	HL,ZNUMFLG	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	LD	A,(HL)
	PUSH	AF
	LD	(HL),00H
	PUSH	HL
	CALL	ZDISADD		; Display address in DE 
	POP	HL
	POP	AF
	LD	(HL),A
	POP	HL
	RST	28H

	DB	'/'

	RET

ZDASMNO:	; ZBUG Disass instr with no output
	LD	A,0FFH
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	CALL	ZDASM		; ZBUG Disass instr     
	LD	A,01H
	LD	(FZBUGNO),A	; ZBUG active (not 0) / No output (bit 7)
	RET

ZDASM:	; ZBUG Disass instr
	XOR	A
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	LD	HL,(ASMPC)	; Assembler instruction current PC
	CALL	ZDECINS		; ZBUG: decode instruction
	JR	Z,L68EB
L68B2:	AND	7FH
	LD	B,A
	LD	HL,TINSTR	; Table of instructions 
	LD	DE,D0000	; 0000 or EDTASM cmd B - Basic
L68BB:	LD	A,(HL)
	RLCA
	JR	NC,L68C0
	INC	E
L68C0:	LD	A,B
	CP	D
	JR	Z,L68CE
	INC	HL
L68C5:	LD	A,(HL)
	INC	HL
	RLCA
	JR	NC,L68C5
	INC	HL
	INC	D
	JR	L68BB

L68CE:	LD	A,(HL)
	AND	7FH
	CALL	DSTRB7A		; Display A followed by string terminated with Bit 7
	RST	28H

	DB	' '

	LD	D,00H
	LD	HL,TJZBUG	; ZBUG Jump Table       
	ADD	HL,DE
	ADD	HL,DE
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	PUSH	HL
	LD	HL,(ASMPC)	; Assembler instruction current PC
	LD	A,(HL)
	INC	HL
	CALL	ZTSTIXY		; Test for IX/IY -> NZ if not, C if IY
	RET

L68EB:	LD	A,(HL)
	INC	HL
	CP	0CBH
	JR	Z,ZCBINST	; Process CB-xx instructions
	CP	0EDH
	JR	Z,ZEDINST	; Process ED-xx instructions
	LD	A,(HL)
	CALL	ZDECINS		; ZBUG: decode instruction
	JR	Z,ZXYINST	; Process DD-xx and FD-xx instructions
	BIT	7,A
	JR	NZ,L68B2
L68FF:	LD	A,3FH		; '?'                   
	RST	20H
	RST	20H
	LD	HL,(ASMPC)	; Assembler instruction current PC
	INC	HL
	RET

ZXYINST:	; Process DD-xx and FD-xx instructions
	LD	A,(HL)
	CP	0CBH
	JR	NZ,L68FF
	INC	HL
	INC	HL
ZCBINST:	; Process CB-xx instructions
	LD	A,(HL)
	AND	0C0H
	JR	Z,L691A
	RLCA
	RLCA
	ADD	A,18H
	JR	L68B2

L691A:	LD	A,(HL)
	AND	38H
	RRCA
	RRCA
	RRCA
	CP	06H
	JR	Z,L68FF
	JR	C,L6927
	DEC	A
L6927:	ADD	A,12H
	JP	L68B2

ZEDINST:	; Process ED-xx instructions
	LD	A,(HL)
	LD	HL,TZEDIN1	; Table of ED instr - 1 
L6930:	INC	HL
	INC	(HL)
	DEC	(HL)
	JR	Z,L68FF
	CP	(HL)
	INC	HL
	JR	NZ,L6930
	LD	A,(HL)
	JP	L68B2

ZDECINS:	; ZBUG: decode instruction
	PUSH	HL
	LD	E,(HL)
	LD	D,00H
	LD	C,D
	LD	A,E
	CP	40H		; '@'                   
	JR	C,L6952
	CP	80H
	JR	C,L695D
	CP	0C0H
	JR	C,L6976
	SUB	80H
	LD	E,A
L6952:	LD	HL,TZINSTR	; Table of instr 00-3F & C0-FF
	ADD	HL,DE
	LD	B,(HL)
L6957:	LD	A,B
	OR	C
	CP	0FFH
	POP	HL
	RET

L695D:	CP	76H		; 'v'                   
	LD	B,06H
	JR	Z,L6957
	LD	B,42H		; 'B'                   
	AND	0F8H
	CP	70H		; 'p'                   
	JR	Z,L6972
L696B:	LD	A,E
	AND	07H
	CP	06H
	JR	NZ,L6957
L6972:	LD	C,80H
	JR	L6957

L6976:	AND	38H
	RRCA
	RRCA
	RRCA
	PUSH	DE
	LD	E,A
	LD	HL,L6985
	ADD	HL,DE
	LD	B,(HL)
	POP	DE
	JR	L696B

L6985:	LD	E,1CH
	DJNZ	L69A6
	DEC	C
	LD	DE,D0E0F
ZDCSRCR:	; Disp ',' and 8b source reg
	RST	28H

	DB	','

ZDSRCR:	; Disp 8b source reg
	AND	07H
	JR	ZD8BR		; Disp 8b src/dst reg   

ZDCDSTR:	; Disp ',' and 8b dest reg
	RST	28H

	DB	','

ZDDSTR:	; Disp 8b dest reg
	AND	38H
	RRCA
	RRCA
	RRCA
ZD8BR:	; Disp 8b src/dst reg
	CP	06H
	JR	Z,ZDATHL	; ZBUG disp (HL)        
	PUSH	HL
	LD	HL,ZMREG8	; 8-bit reg names       
	CP	07H
	JR	Z,L69AD
L69A6:	INC	HL
	PUSH	DE
	LD	E,A
	LD	D,00H
	ADD	HL,DE
	POP	DE
L69AD:	LD	A,(HL)
	POP	HL
	RST	20H
	RET

ZDATHL:	; ZBUG disp (HL)
	LD	A,20H		; ' '                   
	JR	ZDAT16R		; ZBUG disp (rr), rr=16b reg pair

ZDCAT16:	; ZBUG disp ,(rr), rr=16b reg pair
	RST	28H

	DB	','

ZDAT16R:	; ZBUG disp (rr), rr=16b reg pair
	RST	28H

	DB	'('

	CALL	ZD16BR		; ZBUG disp 16b reg pair
	JR	ZDCPAR		; ZBUG disp ')'         

ZDCS6BR:	; ZBUG disp ',' and 16b reg pair
	RST	28H

	DB	','

ZD16BR:	; ZBUG disp 16b reg pair
	PUSH	HL
	PUSH	DE
	AND	30H
	RRCA
	RRCA
	RRCA
	LD	HL,ZMREG16	; 16-bit reg names      
	JR	ZD2CNAM		; ZBUG disp 2-char name from table in HL

ZMREG8:	; 8-bit reg names
	DB	'A'
ZMREG16:	; 16-bit reg names
	DB	'BCDEHL'
ZMSRG16:	; 16-bit special reg names
	DB	'SPPCIXIY'

ZDCONDC:	; ZBUG dasm conditional flag and add ','
	CALL	ZDCOND		; ZBUG dasm conditional flag
	RST	28H

	DB	','

	RET

ZDCOND:	; ZBUG dasm conditional flag
	PUSH	HL
	PUSH	DE
	AND	38H
	RRCA
	RRCA
	LD	HL,ZTCOND	; ZBUG Table of conditional flags
ZD2CNAM:	; ZBUG disp 2-char name from table in HL
	LD	E,A
	LD	D,00H
	ADD	HL,DE
	LD	A,(HL)
	RST	20H
	INC	HL
	LD	A,(HL)
	POP	DE
	POP	HL
	RST	20H
	RET

ZTCOND:	; ZBUG Table of conditional flags
	DB	'NZZ',00H
	DB	'NCC',00H
	DB	'POPEP',00H
	DB	'M',00H

ZTSTIXY:	; Test for IX/IY -> NZ if not, C if IY
	CP	0DDH
	RET	Z
	CP	0FDH
	SCF
ZJCCF:	; ZBUG Jump to RET (no operand)
	RET

ZDCIXIY:	; ZBUG Test and display ',IX' | ',IY'
	CALL	ZTSTIXY		; Test for IX/IY -> NZ if not, C if IY
	RET	NZ
	RST	28H

	DB	','

ZDIXIY:	; ZBUG Test and display 'IX' | 'IY'
	CALL	ZTSTIXY		; Test for IX/IY -> NZ if not, C if IY
	RET	NZ
	RST	28H

	DB	'I'

	LD	A,58H		; 'X'                   
	JR	NC,L6A1F
	LD	A,59H		; 'Y'                   
L6A1F:	RST	20H
	RET

ZFDCPOR:	; ZBUG Fetch and disp ',' and port number
	RST	28H

	DB	','

ZFDPORT:	; ZBUG Fetch and disp port number
	RST	28H

	DB	'('

	CALL	ZFD8BV		; ZBUG Fetch and disp 8-bit value
	RST	28H

	DB	')'

	RET

ZFDC8BV:	; ZBUG Fetch and disp ',' and 8-bit value
	RST	28H

	DB	','

ZFD8BV:	; ZBUG Fetch and disp 8-bit value
	LD	E,(HL)
	LD	D,00H
	JR	ZIHLDDE		; Inc HL and disp addr in DE

ZFDCATN:	; ZBUG Fetch and disp ,(nnnn)
	RST	28H

	DB	','

ZFDATNN:	; ZBUG Fetch and disp (nnnn)
	RST	28H

	DB	'('

	CALL	ZFD16BV		; ZBUG Fetch and disp 16-bit value
ZDCPAR:	; ZBUG disp ')'
	RST	28H

	DB	')'

	RET

L6A3C:	RST	28H

	DB	','

ZFD16BV:	; ZBUG Fetch and disp 16-bit value
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	LD	(OPCODES),DE	; Opcodes length - ZBUG targ jump/call address
ZIHLDDE:	; Inc HL and disp addr in DE
	INC	HL
	JP	ZDADDSR		; Disp addr in DE saving BC and HL

ZJRLC:	; ZBUG Jump #03
	INC	HL
	JR	Z,ZJAND		; ZBUG Jump #02         
	DEC	HL
	LD	A,(HL)
	INC	HL
ZJAND:	; ZBUG Jump #02
	JR	NZ,L6A55
L6A51:	INC	HL
	INC	HL
	JR	ZDIXYOF		; Fetch offset & Disp (IXY+off)

L6A55:	BIT	6,A
	JP	Z,ZDSRCR	; Disp 8b source reg    
	JR	ZFD8BV		; ZBUG Fetch and disp 8-bit value

ZJBIT:	; ZBUG Jump #04
	PUSH	AF
	JR	NZ,L6A61
	INC	HL
	INC	HL
L6A61:	CALL	ZDBITN		; disp bit number       
	POP	AF
	LD	A,(HL)
	INC	HL
	JP	NZ,ZDCSRCR	; Disp ',' and 8b source reg
L6A6A:	RST	28H

	DB	','

ZDIXYOF:	; Fetch offset & Disp (IXY+off)
	PUSH	HL
	PUSH	DE
	PUSH	BC
	RST	28H

	DB	'('

	LD	HL,(ASMPC)	; Assembler instruction current PC
	LD	A,(HL)
	CALL	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'
	INC	HL
	INC	HL
	LD	A,(HL)
	RLCA
	LD	A,2BH		; '+'                   
	JR	NC,L6A82
	LD	A,2DH		; '-'                   
L6A82:	RST	20H
	LD	A,(HL)
	JR	NC,L6A88
	CPL
	INC	A
L6A88:	LD	E,A
	LD	D,00H
	CALL	ZDISADD		; Display address in DE 
	POP	BC
	POP	DE
	POP	HL
	JR	ZDCPAR		; ZBUG disp ')'         

ZDBITN:	; disp bit number
	LD	A,(HL)
	AND	38H
	RRCA
	RRCA
	RRCA
L6A99:	ADD	A,30H
	RST	20H
	RET

ZJADC:	; ZBUG Jump #05
	CP	0EDH
	JR	Z,L6AAA
	RST	28H

	DB	'A'

	RST	28H

	DB	','

	CALL	ZTSTIXY		; Test for IX/IY -> NZ if not, C if IY
	JR	ZJAND		; ZBUG Jump #02         

L6AAA:	LD	A,20H		; ' '                   
	CALL	ZD16BR		; ZBUG disp 16b reg pair
	LD	A,(HL)
	INC	HL
	JP	ZDCS6BR		; ZBUG disp ',' and 16b reg pair

ZJADD:	; ZBUG Jump #06
	LD	B,A
	JR	NZ,L6AB8
	LD	A,(HL)
L6AB8:	AND	0CFH
	CP	09H
	LD	A,B
	JR	NZ,ZJADC	; ZBUG Jump #05         
	CALL	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'
	JR	NZ,L6AD0
	LD	A,(HL)
	AND	30H
	CP	20H		; ' '                   
	JR	NZ,L6AD6
	LD	A,B
	INC	HL
	JP	ZDCIXIY		; ZBUG Test and display ',IX' | ',IY'

L6AD0:	LD	A,20H		; ' '                   
	CALL	ZD16BR		; ZBUG disp 16b reg pair
	DEC	HL
L6AD6:	LD	A,(HL)
	INC	HL
	JP	ZDCS6BR		; ZBUG disp ',' and 16b reg pair

ZJDEC:	; ZBUG Jump #07
	PUSH	AF
	JR	NZ,L6ADF
	LD	A,(HL)
L6ADF:	AND	0C7H
	CP	03H
	JR	NZ,L6AED
	POP	AF
	JP	NZ,ZD16BR	; ZBUG disp 16b reg pair
	INC	HL
	JP	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'

L6AED:	POP	AF
	JP	Z,L6A51
	JP	ZDDSTR		; Disp 8b dest reg      

ZJIM:	; ZBUG Jump #08
	LD	A,(HL)
	INC	HL
	AND	38H
	JR	Z,L6AFE
	RRCA
	RRCA
	RRCA
	DEC	A
L6AFE:	JR	L6A99

ZJCPD:	; ZBUG Jump #09
	INC	HL
	RET

ZJRET:	; ZBUG Disass RET [cond]
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	BIT	0,A
	RET	NZ
	JP	ZDCOND		; ZBUG dasm conditional flag

ZJJP:	; ZBUG Disass JP [cond,]nnnn | JP (HL|IXY)
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	JR	NZ,L6B26
	RST	28H

	DB	'('

	CALL	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'
	PUSH	HL
	LD	HL,(D42EB)
	JR	NC,L6B1E
	LD	HL,(D42ED)
L6B1E:	LD	(OPCODES),HL	; Opcodes length - ZBUG targ jump/call address
	POP	HL
	INC	HL
	JP	ZDCPAR		; ZBUG disp ')'         

L6B26:	CP	0E9H
	PUSH	HL
	LD	HL,(D42E5)
	LD	(OPCODES),HL	; Opcodes length - ZBUG targ jump/call address
	POP	HL
	JP	Z,ZDAT16R	; ZBUG disp (rr), rr=16b reg pair
ZJCALL:	; ZBUG Disass CALL [cond,]nnnn
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	BIT	0,A
	CALL	Z,ZDCONDC	; ZBUG dasm conditional flag and add ','
	JP	ZFD16BV		; ZBUG Fetch and disp 16-bit value

ZJJR:	; ZBUG Disass JR [cond,]offs
	BIT	5,A
	RES	5,A
	CALL	NZ,ZDCONDC	; ZBUG dasm conditional flag and add ','
ZJDJNZ:	; ZBUG Disass DJNZ offs
	LD	D,00H
	LD	E,(HL)
	BIT	7,E
	INC	HL
	PUSH	HL
	JR	Z,L6B4F
	DEC	D
L6B4F:	ADD	HL,DE
	LD	(OPCODES),HL	; Opcodes length - ZBUG targ jump/call address
	LD	A,01H
	LD	(LST2RPL),A	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	EX	DE,HL
	POP	HL
	JR	ZDADDSR		; Disp addr in DE saving BC and HL

ZJRST:	; ZBUG Disass RST nn
	AND	38H
	LD	E,A
	LD	D,00H
ZDADDSR:	; Disp addr in DE saving BC and HL
	PUSH	HL
	PUSH	BC
	CALL	ZDISADD		; Display address in DE 
	POP	BC
	POP	HL
	RET

ZJIN:	; ZBUG Disass IN r,(C) | IN A,(nn)
	CP	0EDH
	JR	NZ,ZJINA	; ZBUG Disass IN A,(nn) 
	LD	A,(HL)
	INC	HL
	CALL	ZDDSTR		; Disp 8b dest reg      
	RST	28H

	DB	','

ZDPORTC:	; Disp port number
	RST	28H

	DB	'('

	RST	28H

	DB	'C'

	JP	ZDCPAR		; ZBUG disp ')'         

ZJINA:	; ZBUG Disass IN A,(nn)
	RST	28H

	DB	'A'

	JP	ZFDCPOR		; ZBUG Fetch and disp ',' and port number

ZJOUT:	; ZBUG Disass OUT (C),r | OUT (nn),A
	CP	0EDH
	JR	NZ,ZJOUTA	; ZBUG Disass OUT (nn),A
	CALL	ZDPORTC		; Disp port number      
	LD	A,(HL)
	INC	HL
	JP	ZDCDSTR		; Disp ',' and 8b dest reg

ZJOUTA:	; ZBUG Disass OUT (nn),A
	CALL	ZFDPORT		; ZBUG Fetch and disp port number
ZDCOMA:	; ZBUG disp ',A'
	RST	28H

	DB	','

	RST	28H

	DB	'A'

	RET

ZJEX:	; ZBUG Disass EX AF,AF' | (SP),HL|IXY | DE,HL
	PUSH	AF
	JR	Z,ZJSPHL	; ZBUG disp DE,HL | (SP),HL
	CP	0EBH
	SCF
	JR	Z,ZJDEHL	; ZBUG disp DE,HL | (SP),HL
	CP	08H
	JR	Z,ZJAFAF	; ZBUG disp AF,AF'      
ZJSPHL:	; ZBUG disp DE,HL | (SP),HL
	LD	A,30H		; '0'                   
	CALL	ZDAT16R		; ZBUG disp (rr), rr=16b reg pair
	OR	A
ZJDEHL:	; ZBUG disp DE,HL | (SP),HL
	LD	A,10H
	CALL	C,ZD16BR	; ZBUG disp 16b reg pair
	POP	AF
	JP	NZ,ZDCS6BR	; ZBUG disp ',' and 16b reg pair
	INC	HL
	JP	ZDCIXIY		; ZBUG Test and display ',IX' | ',IY'

ZJAFAF:	; ZBUG disp AF,AF'
	POP	AF
	CALL	ZDAF		; ZBUG disp AF          
	RST	28H

	DB	','

	CALL	ZDAF		; ZBUG disp AF          
	RST	28H

	DB	27H

	RET

ZJPUPOP:	; ZBUG Disass PUSH rr | POP rr
	INC	HL
	CALL	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'
	RET	Z
	DEC	HL
	AND	30H
	CP	30H		; '0'                   
	JP	NZ,ZD16BR	; ZBUG disp 16b reg pair
ZDAF:	; ZBUG disp AF
	RST	28H

	DB	'A'

	RST	28H

	DB	'F'

	RET

ZJLD:	; ZBUG Disass LD xx,xx
	LD	B,A
	CP	0F9H
	JR	Z,ZDSPHL	; ZBUG Disp SP,HL       
	CP	0DDH
	JP	NC,ZDEDIXY	; ZBUG LD with DD/ED/FD 
	AND	0C0H
	CP	40H		; '@'                   
	JR	Z,ZD8B8B	; Disp 8b dest reg, 8b src reg
	LD	A,B
	AND	0C7H
	CP	06H
	JR	Z,ZD8BNN	; Disp 8b dest reg, nn  
	CP	02H
	JR	Z,L6C11
	LD	A,B
	AND	0CFH
	DEC	A
	JP	NZ,L68FF
	LD	A,B
	CALL	ZD16BR		; ZBUG disp 16b reg pair
	JP	L6A3C

ZD8B8B:	; Disp 8b dest reg, 8b src reg
	LD	A,B
	CALL	ZDDSTR		; Disp 8b dest reg      
	LD	A,B
	JP	ZDCSRCR		; Disp ',' and 8b source reg

ZD8BNN:	; Disp 8b dest reg, nn
	LD	A,B
	CALL	ZDDSTR		; Disp 8b dest reg      
	JP	ZFDC8BV		; ZBUG Fetch and disp ',' and 8-bit value

ZDSPHL:	; ZBUG Disp SP,HL
	CALL	ZD16BR		; ZBUG disp 16b reg pair
	LD	A,20H		; ' '                   
	JP	ZDCS6BR		; ZBUG disp ',' and 16b reg pair

L6C11:	LD	A,B
	CP	1BH
	JR	C,L6C39
	CP	2BH		; '+'                   
	JR	C,L6C29
	BIT	3,A
	PUSH	AF
	CALL	Z,ZFDATNN	; ZBUG Fetch and disp (nnnn)
	POP	AF
	JR	Z,L6C40
	RST	28H

	DB	'A'

	JP	ZFDCATN		; ZBUG Fetch and disp ,(nnnn)

L6C28:	LD	A,C
L6C29:	BIT	3,A
	PUSH	AF
	CALL	Z,ZFDATNN	; ZBUG Fetch and disp (nnnn)
	POP	AF
	JP	Z,ZDCS6BR	; ZBUG disp ',' and 16b reg pair
	CALL	ZD16BR		; ZBUG disp 16b reg pair
	JP	ZFDCATN		; ZBUG Fetch and disp ,(nnnn)

L6C39:	BIT	3,A
	PUSH	AF
	CALL	Z,ZDAT16R	; ZBUG disp (rr), rr=16b reg pair
	POP	AF
L6C40:	JP	Z,ZDCOMA	; ZBUG disp ',A'        
	RST	28H

	DB	'A'

	JP	ZDCAT16		; ZBUG disp ,(rr), rr=16b reg pair

ZDEDIXY:	; ZBUG LD with DD/ED/FD
	CP	0EDH
	LD	A,(HL)
	LD	C,A
	INC	HL
	JR	Z,L6CA4
	CP	0F9H
	JR	Z,L6C73
	CP	22H		; '"'                   
	JR	Z,L6C7A
	CP	2AH		; '*'                   
	JR	Z,L6C7F
	CP	21H		; '!'                   
	JR	Z,L6C86
	CP	36H		; '6'                   
	JR	Z,L6C8D
	AND	0C7H
	CP	46H		; 'F'                   
	JR	Z,L6C94
	LD	A,C
	AND	0F8H
	CP	70H		; 'p'                   
	JR	Z,L6C9C
L6C70:	JP	L68FF

L6C73:	CALL	ZD16BR		; ZBUG disp 16b reg pair
L6C76:	LD	A,B
	JP	ZDCIXIY		; ZBUG Test and display ',IX' | ',IY'

L6C7A:	CALL	ZFDATNN		; ZBUG Fetch and disp (nnnn)
	JR	L6C76

L6C7F:	LD	A,B
	CALL	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'
	JP	ZFDCATN		; ZBUG Fetch and disp ,(nnnn)

L6C86:	LD	A,B
	CALL	ZDIXIY		; ZBUG Test and display 'IX' | 'IY'
	JP	L6A3C

L6C8D:	CALL	ZDIXYOF		; Fetch offset & Disp (IXY+off)
	INC	HL
	JP	ZFDC8BV		; ZBUG Fetch and disp ',' and 8-bit value

L6C94:	LD	A,C
	CALL	ZDDSTR		; Disp 8b dest reg      
	INC	HL
	JP	L6A6A

L6C9C:	CALL	ZDIXYOF		; Fetch offset & Disp (IXY+off)
	LD	A,C
	INC	HL
	JP	ZDCSRCR		; Disp ',' and 8b source reg

L6CA4:	AND	0C7H
	CP	43H		; 'C'                   
	JP	Z,L6C28
	CP	47H		; 'G'                   
	JR	NZ,L6C70
	LD	A,C
	AND	38H
	RRCA
	RRCA
	RRCA
	OR	A
	JR	Z,L6CD4
	DEC	A
	JR	Z,L6CCF
	DEC	A
	JR	Z,L6CC8
	DEC	A
	JR	NZ,L6C70
	RST	28H

	DB	'A'

	RST	28H

	DB	','

	RST	28H

	DB	'R'

	RET

L6CC8:	RST	28H

	DB	'A'

	RST	28H

	DB	','

	RST	28H

	DB	'I'

	RET

L6CCF:	RST	28H

	DB	'R'

	JP	ZDCOMA		; ZBUG disp ',A'        

L6CD4:	RST	28H

	DB	'I'

	JP	ZDCOMA		; ZBUG disp ',A'        

TZINSTR:	; Table of instr 00-3F & C0-FF
	DB	07H,42H,42H,20H,20H,1FH,42H,09H
	DB	3FH,9EH,42H,1FH,20H,1FH,42H,0BH
	DB	3BH,42H,42H,20H,20H,1FH,42H,08H
	DB	3AH,9EH,42H,1FH,20H,1FH,42H,0AH
	DB	3AH,0C2H,0C2H,0A0H,20H,1FH,42H,02H
	DB	3AH,9EH,0C2H,9FH,20H,1FH,42H,01H
	DB	3AH,42H,42H,20H,0A0H,9FH,0C2H,0CH
	DB	3AH,9EH,42H,1FH,20H,1FH,42H,00H
	DB	38H,40H,39H,39H,37H,41H,1EH,3CH
	DB	38H,38H,39H,0FFH,37H,37H,1CH,3CH
	DB	38H,40H,39H,3EH,37H,41H,10H,3CH
	DB	38H,05H,39H,3DH,37H,0FFH,1DH,3CH
	DB	38H,0C0H,39H,0BFH,37H,0C1H,0DH,3CH
	DB	38H,0B9H,39H,3FH,37H,0FFH,11H,3CH
	DB	38H,40H,39H,03H,37H,41H,0FH,3CH
	DB	38H,0C2H,39H,04H,37H,0FFH,0EH
TZEDIN1:	; Table of ED instr - 1
	DB	3CH
TZEDINS:	; Table of ED instr
	DB	40H,3DH,41H,3EH,42H,1DH,43H,42H
	DB	44H,2EH,45H,34H,46H,21H,47H,42H
	DB	48H,3DH,49H,3EH,4AH,1CH,4BH,42H
	DB	4DH,33H,4FH,42H,50H,3DH,51H,3EH
	DB	52H,1DH,53H,42H,56H,21H,57H,42H
	DB	58H,3DH,59H,3EH,5AH,1CH,5BH,42H
	DB	5EH,21H,5FH,42H,60H,3DH,61H,3EH
	DB	62H,1DH,67H,36H,68H,3DH,69H,3EH
	DB	6AH,1CH,6FH,35H,72H,1DH,73H,42H
	DB	78H,3DH,79H,3EH,7AH,1CH,7BH,42H
	DB	0A0H,2CH,0A1H,24H,0A2H,28H,0A3H,32H
	DB	0A8H,2AH,0A9H,22H,0AAH,26H,0ABH,31H
	DB	0B0H,2DH,0B1H,25H,0B2H,29H,0B3H,30H
	DB	0B8H,2BH,0B9H,23H,0BAH,27H,0BBH,2FH
	DB	00H
TJZBUG:	; ZBUG Jump Table
	DW	ZJCCF,ZJAND,ZJRLC,ZJBIT
	DW	ZJADC,ZJADD,ZJDEC,ZJIM
	DW	ZJCPD,ZJCALL,ZJRET,ZJJP
	DW	ZJJR,ZJDJNZ,ZJRST,ZJIN
	DW	ZJOUT,ZJEX,ZJPUPOP,ZJLD

JRST08:	; Handle ZBUG breakpoint
	LD	(D42E5),HL
	POP	HL
	DEC	HL
	LD	(D42E9),HL
	PUSH	AF
	EX	DE,HL
	LD	(NPASS),HL	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	LD	(MACRFLG),BC	; Skip assembly in macro - ZBUG regs save area
	POP	HL
	LD	(CONDFLG),HL	; Skip assembly if not zero
	EX	AF,AF'                                  
	EXX
	PUSH	AF
	LD	(Z42F5),HL	; Used by ZBUG          
	EX	DE,HL
	LD	(SMACCNT),HL	; Symbol to macro invocation counter to replace #$YM
	LD	(D42F1),BC
	POP	HL
	LD	(D42EF),HL
	LD	(D42EB),IX
	LD	(D42ED),IY
	LD	A,I
	LD	(FERROR),A	; Assembler error flag for pause
	LD	HL,(D42E9)
	EX	DE,HL
	LD	(D42E7),SP
	LD	SP,VSTART	; Main entry point - restart with new edit buffer
	LD	BC,ZPMTCMD	; ZBUG Prompt with '#' and get command
	PUSH	BC
	LD	B,02H
	LD	A,B
	LD	(D4300),A
	LD	HL,ZTSTOPS	; ZBUG 2 stop + 8 break points (5 bytes each)
	CALL	ZCHKBSP		; check if brk or stop point exists, Z if yes
	JR	Z,L6E9F
	CALL	ZCHKBKP		; check if bkpt exists, Z if yes
	PUSH	AF
	PUSH	HL
	CALL	ZCLRBPS		; clear all breakpoints 
	CALL	ZCLRSTP		; Clear instr stop points
	POP	HL
	POP	AF
	JR	NZ,L6E64
	PUSH	HL
	CALL	ZCLRBPS		; clear all breakpoints 
	POP	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	DEC	DE
	LD	(HL),D
	DEC	HL
	LD	(HL),E
	LD	A,D
	OR	E
	JP	NZ,L6F55
	INC	(HL)
L6E64:	LD	A,C
	ADD	A,30H
	RST	20H
	LD	HL,MBRKAT	; "BRK @ "              
	CALL	DSTRB7		; Disp string terminated with Bit 7
	LD	HL,(D42E9)
	EX	DE,HL
	JP	ZDISADD		; Display address in DE 

ZCHKBKP:	; check if bkpt exists, Z if yes
	LD	HL,ZTBKPTS	; Table of 8 breakpoints (5 bytes each)
	LD	B,08H
ZCHKBSP:	; check if brk or stop point exists, Z if yes
	LD	C,00H
L6E7C:	LD	A,(HL)
	INC	HL
	PUSH	HL
	LD	H,(HL)
	LD	L,A
	RST	18H
	POP	HL
	INC	HL
	INC	HL
	RET	Z
	INC	HL
	INC	HL
	INC	C
	DJNZ	L6E7C
	RET

ZCLRSTP:	; Clear instr stop points
	LD	B,02H
	LD	HL,ZTSTOP0	; ZBUG 2 stop points (5 bytes each)
	CALL	ZCLRPTS		; clear brk/stop points 
	LD	B,0AH
	LD	HL,ZTSTOPS	; ZBUG 2 stop + 8 break points (5 bytes each)
	XOR	A
L6E9A:	LD	(HL),A
	INC	HL
	DJNZ	L6E9A
	RET

L6E9F:	CALL	ZCLRSTP		; Clear instr stop points
	LD	HL,D41F6
	INC	(HL)
	DEC	(HL)
	LD	(HL),00H
	LD	HL,(D42E9)
	JP	NZ,ZEXNLHL	; ZBUG Exam loc @HL with NL
L6EAF:	LD	B,08H
	LD	HL,ZTBKPTS	; Table of 8 breakpoints (5 bytes each)
L6EB4:	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	A,D
	OR	E
	JR	Z,L6EC3
	EX	DE,HL
	LD	A,(HL)
	LD	(DE),A
	LD	A,0CFH
	LD	(HL),A
	EX	DE,HL
L6EC3:	INC	HL
	INC	HL
	INC	HL
	DJNZ	L6EB4
L6EC8:	LD	A,(FERROR)	; Assembler error flag for pause
	LD	I,A
	LD	IX,(D42EB)
	LD	IY,(D42ED)
	LD	HL,(D42EF)
	PUSH	HL
	LD	BC,(D42F1)
	LD	HL,(SMACCNT)	; Symbol to macro invocation counter to replace #$YM
	EX	DE,HL
	LD	HL,(Z42F5)	; Used by ZBUG          
	POP	AF
	EXX
	EX	AF,AF'                                  
	LD	HL,(D42E7)
	LD	SP,HL
	LD	BC,(MACRFLG)	; Skip assembly in macro - ZBUG regs save area
	LD	HL,(NPASS)	; ASM pass# - EDT ECMDC, not ECMDM - ZBUG=??
	EX	DE,HL
	LD	HL,(CONDFLG)	; Skip assembly if not zero
	PUSH	HL
	POP	AF
	LD	HL,(D42E9)
	PUSH	HL
	LD	HL,(D42E5)
	RET

ZCLRBPS:	; clear all breakpoints
	LD	B,08H
	LD	HL,STR2SUB	; Str to substitute (cmd S) - ZBUG 8 Bkpts
ZCLRPTS:	; clear brk/stop points
	INC	HL
	INC	HL
	INC	HL
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	A,D
	OR	E
	JR	Z,L6F14
	EX	DE,HL
	LD	A,(DE)
	LD	(HL),A
	EX	DE,HL
L6F14:	DJNZ	ZCLRPTS
	RET

ZSETSTB:	; Set stop point break
	PUSH	DE
	CALL	ZSETSTP		; Set stop point        
	LD	A,0CFH
	EX	DE,HL
	LD	(HL),A
	CP	(HL)
	JR	NZ,ZSTPFLD	; Set stop point failed 
	EX	DE,HL
	POP	DE
	LD	(HL),D
	DEC	HL
	LD	(HL),E
	RET

ZSETBKP:	; set breakpoint
	LD	A,B
	ADD	A,02H
	LD	B,A
ZSETSTP:	; Set stop point
	PUSH	HL
	LD	A,B
	ADD	A,A
	ADD	A,A
	ADD	A,B
	LD	E,A
	LD	D,00H
	LD	HL,ZTSTOPS	; ZBUG 2 stop + 8 break points (5 bytes each)
	ADD	HL,DE
	LD	A,(HL)
	INC	HL
	OR	(HL)
	POP	DE
	JP	NZ,ZERR		; Display ZERR and abort cmd
	DEC	HL
	LD	(HL),E
	INC	HL
	LD	(HL),D
	INC	HL
	EX	DE,HL
	LD	A,(HL)
	EX	DE,HL
	LD	(HL),A
	INC	HL
	LD	(HL),01H
	INC	HL
	LD	(HL),00H
	RET

ZSTPFLD:	; Set stop point failed
	CALL	ZCLRSTP		; Clear instr stop points
	JP	ZERR		; Display ZERR and abort cmd

L6F55:	LD	HL,(D42E9)
	LD	(ASMPC),HL	; Assembler instruction current PC
	PUSH	HL
	CALL	ZDASMNO		; ZBUG Disass instr with no output
	POP	DE
	LD	B,00H
	CALL	ZSETSTB		; Set stop point break  
	LD	A,(LST2RPL)	; Len of str to rpl (cmd S) flwd by str - ZBUG bnch ins
	OR	A
	JR	Z,L6F88
	CP	0C9H
	JR	Z,L6F75
	AND	0C7H
	CP	0C0H
	JR	NZ,L6F80
L6F75:	PUSH	DE
	LD	HL,(D42E7)
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	EX	DE,HL
	POP	DE
	JR	L6F83

L6F80:	LD	HL,(OPCODES)	; Opcodes length - ZBUG targ jump/call address
L6F83:	LD	B,01H
	CALL	ZSETSTB		; Set stop point break  
L6F88:	EX	DE,HL
	JP	L6EC8

ZCMDA:	; ZBUG '$A' cmd - set ASCII output mode
	LD	HL,ZNUMFLG	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	SET	7,(HL)
	LD	B,02H
	JR	ZSETMBW		; Set Mnemo/Byte/Word exam mode

ZCMDMBW:	; ZBUG '$M'/'$B'/'$W' cmds - Mnemo/Byte/Word exam mode
	LD	HL,(ZCURLOC)	; ZBUG current location 
	INC	HL
	LD	B,00H
	CP	4DH		; 'M'                   
	JR	Z,L6FAA
	INC	B
	CP	57H		; 'W'                   
	INC	HL
	JR	Z,L6FA7
	INC	B
	DEC	HL
L6FA7:	LD	(ZNXTLOC),HL	; ZBUG next location    
L6FAA:	LD	HL,ZNUMFLG	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	RES	7,(HL)
ZSETMBW:	; Set Mnemo/Byte/Word exam mode
	DEC	HL
	LD	(HL),B
	RET

ZCMDNZ:	; ZBUG '$N'/'$S' cmds - numeric/symbolic debug mode
	SUB	53H
	JR	Z,L6FB8
	LD	A,01H
L6FB8:	LD	(ZNUMFLG),A	; ZBUG Num dbg flg (Symb=0, ASCII if bit 7)
	RET

ZCMDIO:	; ZBUG 'rdx$I'/'rdx$O' cmds - set radix for input/output
	PUSH	AF
	CALL	L7095
	LD	DE,D0011
	RST	18H
	JR	NC,L6FCA
	EX	DE,HL
	LD	L,01H
	RST	18H
L6FCA:	JP	NC,ZERR		; Display ZERR and abort cmd
	POP	AF
	CP	4FH		; 'O'                   
	LD	A,E
	JR	Z,L6FD7
	LD	(NMBASIS),A	; Number basis for constant parsing
	RET

L6FD7:	LD	B,H
	CP	10H
	JR	Z,L6FE7
	INC	B
	CP	0AH
	JR	Z,L6FE7
	INC	B
	CP	08H
	JP	NZ,ZERR		; Display ZERR and abort cmd
L6FE7:	LD	A,B
	LD	(ZOUTRDX),A	; ZBUG Output radix     
	RET

ZCMDX:	; ZBUG 'addr$X' cmd - set breakpoint at addr
	LD	HL,(ZCURLOC)	; ZBUG current location 
	JR	Z,L6FF4
	CALL	ZRDADDR		; Read address from command line
L6FF4:	LD	B,(HL)
	LD	(HL),A
	CP	(HL)
	JR	NZ,L6FFC
	INC	A
	LD	(HL),A
	CP	(HL)
L6FFC:	JP	NZ,ZERRMEM	; disp "BAD MEMORY" error and abort
	LD	(HL),B
	LD	A,0CFH
	CP	(HL)
	JR	Z,L700F
	EX	DE,HL
	LD	A,(ZINPTYP)	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	OR	A
	JR	NZ,L701A
	CALL	ZCHKBKP		; check if bkpt exists, Z if yes
L700F:	JP	Z,ZERR		; Display ZERR and abort cmd
	PUSH	DE
	LD	DE,D0000	; 0000 or EDTASM cmd B - Basic
	CALL	ZCHKBKP		; check if bkpt exists, Z if yes
	POP	HL
L701A:	JP	NZ,ZERR		; Display ZERR and abort cmd
	LD	B,C
	CALL	ZSETBKP		; set breakpoint        
	RET

ZCMDY:	; ZBUG '[n]$Y' cmd - yank nth/all breakpoint(s)
	JR	Z,L703C
	CALL	L7095
	LD	DE,RST08	; ZBUG breakpoint       
	RST	18H
	JR	NC,L6FCA
L702D:	LD	A,L
	ADD	A,A
	ADD	A,A
	ADD	A,L
	LD	E,A
	LD	D,00H
	LD	HL,ZTBKPTS	; Table of 8 breakpoints (5 bytes each)
	ADD	HL,DE
	LD	(HL),D
	INC	HL
	LD	(HL),D
	RET

L703C:	LD	B,08H
L703E:	LD	L,B
	DEC	L
	CALL	L702D
	DJNZ	L703E
	RET

ZCMDD:	; ZBUG '$D' cmd - display all breakpoints
	LD	BC,D0800
	LD	HL,ZTBKPTS	; Table of 8 breakpoints (5 bytes each)
L704C:	LD	E,(HL)
	LD	A,(HL)
	INC	HL
	OR	(HL)
	JR	Z,L7067
	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	LD	A,C
	ADD	A,30H
	RST	20H
	LD	D,(HL)
	PUSH	HL
	LD	HL,MAT		; " @ "                 
	CALL	DSTRB7		; Disp string terminated with Bit 7
	PUSH	BC
	CALL	ZDISADD		; Display address in DE 
	POP	BC
	POP	HL
L7067:	INC	C
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	DJNZ	L704C
	RET

ZCMDC:	; ZBUG '[n]$C' cmd - continue n times / resume exec
	LD	HL,D0001
	JR	Z,L707B
	CALL	L7095
	LD	A,H
	OR	L
	JR	Z,L700F
L707B:	PUSH	HL
	LD	HL,(D42E9)
	EX	DE,HL
	CALL	ZCHKBKP		; check if bkpt exists, Z if yes
	POP	DE
	JR	NZ,L7089
	LD	(HL),E
	INC	HL
	LD	(HL),D
L7089:	LD	A,(D4300)
	OR	A
	JR	Z,L700F
	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	JP	L6F55

L7095:	LD	HL,NMBAS10	; Force number basis to 10 for constant parsing
	LD	(HL),01H
	RST	30H
	LD	(HL),00H
	EX	DE,HL
	RET

ZCMDG:	; ZBUG '[addr]$G' cmd - go exec at addr / current PC
	JR	Z,L70A6
	RST	30H
	EX	DE,HL
	LD	(D42E9),HL
L70A6:	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	JP	L6EAF

ZKEYAT:	; ZBUG '[addr]@' key - single step from addr / curr loc
	XOR	A
	LD	(ZINPTYP),A	; ZBUG address input type 0:mem 1:16b 2:8b 3:flgs
	INC	C
	DEC	C
	JR	NZ,L70BD
	LD	A,(D4300)
	OR	A
	JR	NZ,L70C2
	JP	ZERR		; Display ZERR and abort cmd

L70BD:	RST	30H
	EX	DE,HL
	LD	(D42E9),HL
L70C2:	LD	A,01H
	LD	(D41F6),A
	JP	L6F55

ZCMDR:	; ZBUG '$R' cmd - display all regs
	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	LD	C,02H
	LD	HL,CONDFLG	; Skip assembly if not zero
L70D2:	LD	DE,ZSVRGNA	; ZBUG saved 8-bit reg names index without I
	LD	B,04H
L70D7:	INC	HL
	INC	DE
	CALL	L7120
	DEC	HL
	DEC	DE
	CALL	L7120
	INC	HL
	INC	HL
	INC	DE
	INC	DE
	DJNZ	L70D7
	CALL	ZPMTSPC		; ZBUG Prompt with ' '  
	LD	HL,D42EF
	DEC	C
	JR	NZ,L70D2
	LD	HL,D42E7
	LD	DE,ZMSRG16	; 16-bit special reg names
	LD	B,04H
L70F8:	LD	C,02H
L70FA:	LD	A,(DE)
	INC	DE
	RST	20H
	DEC	C
	JR	NZ,L70FA
	RST	28H

	DB	'='

	INC	HL
	LD	A,(HL)
	PUSH	BC
	CALL	ZHEXA		; LD C,1 = ZBUG disp A in hex
	DEC	HL
	LD	A,(HL)
	CALL	ZHEXA		; LD C,1 = ZBUG disp A in hex
	INC	HL
	INC	HL
	POP	BC
	CALL	L713B
	DJNZ	L70F8
	RST	28H

	DB	'I'

	RST	28H

	DB	'='

	LD	A,(FERROR)	; Assembler error flag for pause
	CALL	ZHEXA		; LD C,1 = ZBUG disp A in hex
	RET

L7120:	PUSH	BC
	LD	A,(DE)
	RST	20H
	DEC	C
	LD	A,20H		; ' '                   
	JR	NZ,L712B
	RST	28H

	DB	27H

	XOR	A
L712B:	RST	20H
	RST	28H

	DB	'='

	LD	A,(HL)
	CALL	ZHEXA		; LD C,1 = ZBUG disp A in hex
	POP	BC
	LD	A,(DE)
	CP	46H		; 'F'                   
	JR	Z,L7140
	CP	4CH		; 'L'                   
	RET	Z
L713B:	RST	28H

	DB	' '

	RST	28H

	DB	' '

	RET

L7140:	LD	A,(HL)
	CALL	ZEXFLGS		; Exam F-flags in A     
L7144:	RST	28H

	DB	' '

	LD	A,(DVDPOS)	; Current logical position in line
	CP	16H
	JR	NZ,L7144
	RET

ZCMDT:	; ZBUG 'first last $T' cmd - display block [first,last]
	RST	30H
	EX	DE,HL
	RST	30H
L7151:	PUSH	DE
	CALL	ZEXNLHL		; ZBUG Exam loc @HL with NL
	CALL	CKPAUSE		; Check for pause (Shift-@)
	LD	HL,(ZNXTLOC)	; ZBUG next location    
	POP	DE
	EX	DE,HL
	RST	18H
	EX	DE,HL
	RET	C
	JR	L7151

ZCMDP:	; ZBUG 'first last exec name$P' cmd - punch sys tape
	RST	28H

	DB	0DH

	LD	B,03H
L7166:	RST	30H
	PUSH	DE
	DJNZ	L7166
	POP	HL
	POP	DE
	EX	(SP),HL
	PUSH	DE
	PUSH	HL
	CALL	GETPNAM		; Get program name (dft: NONAME)
L7172:	LD	DE,MBADPAR	; "BAD PARAMETER(S)"    
	JP	C,ZERRMSG	; Display error message in DE and abort
	LD	C,55H		; 'U'                   
	CALL	WCSFNM		; Write cass filename with RDY CASS
	POP	HL
	LD	(LOCADDR),HL	; Location address ptr  
	XOR	A
	LD	(FCASBLK),A	; Flag for pending cassette block
	LD	(AFLAGIM),A	; Assembler flag: IM = assemble to Internal Memory
L7188:	LD	A,01H
	LD	(OPCODES),A	; Opcodes length - ZBUG targ jump/call address
	LD	A,(HL)
	LD	(OPCODEP),A	; Opcode prefix (0 if none)
	LD	(OPCODE0),A	; Opcode byte 0         
	CALL	ASMGEN		; Assembler generate binary output
	LD	HL,(LOCADDR)	; Location address ptr  
	EX	DE,HL
	POP	HL
	PUSH	HL
	RST	18H
	EX	DE,HL
	JR	NC,L7188
	POP	HL
	POP	HL
	JP	L5F6C

ZCMDL:	; ZBUG ' name$L' cmd - load system tape
	RST	28H

	DB	0DH

	CALL	GETFNAM		; Get filename          
	JR	C,L7172
	LD	E,55H		; 'U'                   
	CALL	RCSFNM		; Read and chk cass filename with RDY CASS
L71B2:	PUSH	AF
	JR	L71BB

L71B5:	CALL	CBLINK		; Blink asterisk in upper right corner
L71B8:	CALL	VCSIN		; Cassette input byte   
L71BB:	CP	78H		; 'x'                   
	JR	Z,L71F4
	CP	3CH		; '<'                   
	JR	NZ,L71B8
	CALL	VCSIN		; Cassette input byte   
	LD	B,A
	CALL	CSINW		; Cassette input word HL
	ADD	A,L
	LD	C,A
L71CC:	CALL	VCSIN		; Cassette input byte   
	LD	D,A
	ADD	A,C
	LD	C,A
	POP	AF
	PUSH	AF
	JR	Z,L71E0
	LD	(HL),D
	LD	A,(HL)
	CP	D
	JR	Z,L71E0
	LD	A,4DH		; 'M'                   
	LD	(CSTATM),A	; Cassette status 'M'emory write fault
L71E0:	INC	HL
	DJNZ	L71CC
	CALL	VCSIN		; Cassette input byte   
	CP	C
	JR	Z,L71B5
	POP	AF
	PUSH	AF
	JR	Z,L71B5
	LD	A,43H		; 'C'                   
	LD	(CSTATC),A	; Cassette status 'C'hecksum error
	JR	L71B8

L71F4:	CALL	CSINW		; Cassette input word HL
	LD	(ZCURLOC),HL	; ZBUG current location 
	LD	(D42E9),HL
	POP	AF
	RET	NZ
	CALL	VCSOFF		; Turn off cassette     
	CALL	RCSFNM1		; Read and chk cass filename w/o RDY CASS
	JR	L71B2

MFLAGS:	; F-Flags: S-Z-?-H-?-P/V-N-C
	DB	0D3H,0DAH,80H,0C8H,80H,50H,2FH,0D6H
	DB	0CEH,0C3H
MZBUG:	; "ZBUG"
	DB	'Z-BU','G'+80H
MZERR:	; "ZERR"
	DB	'ZER','R'+80H
MBRKAT:	; "BRK @ "
	DB	' BRK'
MAT:	; " @ "
	DB	' @',' '+80H
EBUFFER:	; Editor buffer start
	DB	0FFH,0FFH
MTITLE:	; EDTASM PLUS TITLE
	DB	'MICROSOFT EDITOR/ASSEMBLER-PLUS',0DH
	DB	'COPYRIGHT (C) 1981 BY MICROSOFT',0DH
	DB	'VERSION 1.08  CREATED 24-Feb-81',80H

TSTOLD1:	; Test old M1 ROM
	LD	DE,L72AC
	LD	HL,DELAYBC	; Delay BC              
	CALL	L72A1
	RET	NZ
	LD	HL,D03FB
	CALL	L72A1
	RET	NZ
	LD	HL,D05DC
	CALL	L72A1
	RET	NZ
	LD	A,01H
	LD	(MOLDM1),A	; Old M1 ROM flag       
	RET

L72A1:	LD	C,05H
L72A3:	LD	A,(DE)
	CP	(HL)
	INC	DE
	INC	HL
	RET	NZ
	DEC	C
	JR	NZ,L72A3
	RET

L72AC:	DEC	BC
	LD	A,B
	OR	C
	JR	NZ,L72AC
	LD	A,D
	RLCA
	RLCA
	RLCA
	LD	D,A
	CALL	VDCHAR		; Disp char in A        
	LD	C,B
	CALL	D0000		; 0000 or EDTASM cmd B - Basic


	END	VSTART

