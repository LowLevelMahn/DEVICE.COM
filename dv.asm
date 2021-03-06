BINARY_EQUAL = 1
; ---------------------------------------------------------------------------

ptr16_t		struc ;	(sizeof=0x4)	; XREF:	seg000:stru_10204r
					; seg000:stru_1020Br ...
ofs		dw ?
segm		dw ?
ptr16_t		ends

; ---------------------------------------------------------------------------
exec_param_block_t struc ; (sizeof=0x4)	; XREF:	seg000:exec_paramr
load_seg	dw ?			; XREF:	start_0+2Cw
relocation_factor dw ?			; XREF:	start_0+2Ew ; only if EXE
exec_param_block_t ends
;
; +-------------------------------------------------------------------------+
; |   This file	has been generated by The Interactive Disassembler (IDA)    |
; |	      Copyright	(c) 2013 Hex-Rays, <support@hex-rays.com>	    |
; +-------------------------------------------------------------------------+
;
; Input	MD5   :	40EE2A00BDCCFCBB0D43FCE59AEF6859
; Input	CRC32 :	F92F7BA3

; File Name   :	C:\temp\device_com\DEVICE.COM
; Format      :	MS-DOS COM-file
; Base Address:	1000h Range: 10100h-10748h Loaded length: 648h

		.286
		.model tiny

; ===========================================================================

; Segment type:	Pure code
seg000		segment	byte public 'CODE'
		assume cs:seg000
		org 100h
		assume es:nothing, ss:nothing, ds:seg000

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

		public start
start		proc near
		jmp	start_0
start		endp

; ---------------------------------------------------------------------------
driver_file_name db 41h	dup(0)		 ; 0 ; DATA XREF: print_file_name_sub_10221+2o
					; parse_command_line_sub_106DB+1o ...
exec_param	exec_param_block_t <0>	; DATA XREF: start_0+29o
byte_10148	db 17h,	0Dh dup(0)	; DATA XREF: start_0-468o
word_10156	dw 0			; DATA XREF: start_0-434r
word_10158	dw 0			; DATA XREF: start_0-429r start_0+19w
word_1015A	dw 0			; DATA XREF: parse_command_line_sub_106DB+21w
word_1015C	dw 0			; DATA XREF: start_0+12w
		db    0
aDevice		db 'DEVICE: $'          ; DATA XREF: start_0-4CEo
aCouldNotLoad	db 'Could not load $'   ; DATA XREF: start_0-474o
aPressAnyKeyToE	db 0Dh,0Ah		; DATA XREF: start_0:loc_1025Eo
		db 'Press any key to exit ... $'
aIsABlockDevice	db ' is a block device.',0Dh,0Ah ; DATA XREF: start_0-3DCo
		db 'It must be loaded in CONFIG.SYS.$'
aItMayBeDangero	db 0Dh,0Ah		; DATA XREF: start_0-4B2o
		db 'It may be dangerous to continue running this session.$'
string_end	db  24h	; $		; DATA XREF: start_0-471o
					; start_0:loc_1032Ao
stru_10204	ptr16_t	<0>		; DATA XREF: start_0-456w start_0-450r ...
byte_10208	db 0			; DATA XREF: start_0-4B9r start_0-4A0r ...
word_10209	dw 0			; DATA XREF: start_0-496r start_0-407w
stru_1020B	ptr16_t	<0>		; DATA XREF: sub_10375+Br sub_103AF+9r ...
stru_1020F	ptr16_t	<0>		; DATA XREF: sub_103AF+2r
					; sub_1058F+37w ...
stru_10213	ptr16_t	<0>		; DATA XREF: sub_10375+27w
					; sub_103A6+2r	...
old_interrupt_2F ptr16_t <0>		; DATA XREF: restore_interrupt_F2_sub_10410+Br
					; set_interrupt_2F_sub_10529+14w ...
stru_1021B	ptr16_t	<0>		; DATA XREF: seg000:03CEr
					; sub_105DA:loc_105F1w	...
byte_1021F	db 0			; DATA XREF: seg000:loc_103C7r
					; sub_105DA+27r ...
byte_10220	db 0Dh			; DATA XREF: sub_10333+12r
					; sub_10333:loc_1035Ar	...

; =============== S U B	R O U T	I N E =======================================


print_file_name_sub_10221 proc near	; CODE XREF: start_0-4C1p
		push	ds
		pop	es
		assume es:seg000
		mov	di, offset driver_file_name
		mov	dx, di
		xor	al, al
		mov	cx, 41h		; max size of filename
		repne scasb		; search for 0
		mov	byte ptr [di-1], '$' ; set DOS print end char at end
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		retn
print_file_name_sub_10221 endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start_0

loc_10238:				; CODE XREF: start_0-46Ej start_0-3D9j
		push	cs
		pop	ds
		push	dx
		mov	dx, offset aDevice ; "DEVICE: $"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		pop	dx
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		push	di
		call	print_file_name_sub_10221
		pop	dx
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		cmp	byte_10208, 0
		jz	short loc_1025E
		mov	dx, offset aItMayBeDangero ; "\r\nIt may be dangerous to continue run"...
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"

loc_1025E:				; CODE XREF: start_0-4B4j
		mov	dx, offset aPressAnyKeyToE ; "\r\nPress	any key	to exit	... $"
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		mov	ah, 0
		int	16h		; KEYBOARD - READ CHAR FROM BUFFER, WAIT IF EMPTY
					; Return: AH = scan code, AL = character
		cmp	byte_10208, 0
		jz	short loc_1027C
		call	close_filehandles_0_to_4_sub_10284
		mov	dx, word_10209
		mov	ax, 3101h
		int	21h		; DOS -	DOS 2+ - TERMINATE BUT STAY RESIDENT
					; AL = exit code, DX = program size, in	paragraphs
; ---------------------------------------------------------------------------

loc_1027C:				; CODE XREF: start_0-49Bj
		call	restore_interrupt_F2_sub_10410
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
; END OF FUNCTION CHUNK	FOR start_0	; AL = exit code

; =============== S U B	R O U T	I N E =======================================


close_filehandles_0_to_4_sub_10284 proc	near ; CODE XREF: start_0-499p
					; start_0-3EFp
		xor	bx, bx		; file handle =	0?

loc_10286:				; CODE XREF: close_filehandles_0_to_4_sub_10284+Aj
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		inc	bx
		cmp	bx, 5		; closes handle	0,1,2,3,4
		jb	short loc_10286
		retn
close_filehandles_0_to_4_sub_10284 endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR start_0

loc_10291:				; CODE XREF: start_0+3Cj
		int	21h		; DOS -	2+ - LOAD OR EXECUTE (EXEC)
					; DS:DX	-> ASCIZ filename
					; ES:BX	-> parameter block
					; AL = subfunc:	called by MSC spawn(P_NOWAIT,...) when running DOS 4.x.
		jnb	short loc_1029D
		mov	dx, offset aCouldNotLoad ; "Could not load $"
		mov	di, offset string_end
		jmp	short loc_10238
; ---------------------------------------------------------------------------

loc_1029D:				; CODE XREF: start_0-476j
		xor	si, si

loc_1029F:				; CODE XREF: start_0-40Dj
		push	cs
		pop	es
		mov	bx, offset byte_10148
		mov	ds, stru_10204.segm
		test	byte ptr [si+5], 80h
		jnz	short loc_102B0
		jmp	short loc_1032A
; ---------------------------------------------------------------------------

loc_102B0:				; CODE XREF: start_0-45Dj
		mov	ax, [si+6]
		mov	cs:stru_10204.ofs, ax
		push	si
		push	ds
		call	dword ptr cs:stru_10204.ofs
		pop	ds
		pop	si
		mov	ax, [si+8]
		mov	cs:stru_10204.ofs, ax
		push	si
		call	dword ptr cs:stru_10204.ofs
		pop	si
		push	cs
		pop	ds
		mov	byte_10208, 1
		mov	bx, word_10156
		add	bx, 0Fh
		mov	cl, 4
		shr	bx, cl
		add	bx, word_10158
		mov	ax, stru_10204.segm
		mov	dx, bx
		sub	bx, ax
		jbe	short loc_10322
		call	sub_10333
		mov	es, ax
		assume es:nothing
		push	word ptr es:[si]
		call	sub_10375
		pop	si
		cmp	si, 0FFFFh
		jnz	short loc_1029F
		mov	ax, cs
		sub	dx, ax
		mov	word_10209, dx
		mov	es, word ptr ds:2Ch
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		mov	es, stru_10204.segm
		test	byte ptr es:5, 80h
		jz	short loc_1032A
		call	close_filehandles_0_to_4_sub_10284
		mov	ax, 3100h
		int	21h		; DOS -	DOS 2+ - TERMINATE BUT STAY RESIDENT
					; AL = exit code, DX = program size, in	paragraphs
; ---------------------------------------------------------------------------

loc_10322:				; CODE XREF: start_0-41Ej
		call	restore_interrupt_F2_sub_10410
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_1032A:				; CODE XREF: start_0-45Bj start_0-3F1j
		mov	dx, offset string_end
		mov	di, offset aIsABlockDevice ; " is a block device.\r\nIt	must be	loade"...
		jmp	loc_10238
; END OF FUNCTION CHUNK	FOR start_0

; =============== S U B	R O U T	I N E =======================================


sub_10333	proc near		; CODE XREF: start_0-41Cp
		push	ax
		push	bx
		push	ds
		push	es
		mov	ds, ax
		assume ds:nothing
		mov	ah, 52h
		int	21h		; DOS -	2+ internal - GET LIST OF LISTS
					; Return: ES:BX	-> DOS list of lists
		mov	ax, [si+4]
		test	ah, 80h
		jz	short loc_10370
		test	cs:byte_10220, 4
		jz	short loc_1035A
		test	al, 1
		jz	short loc_1035A
		cli
		mov	es:[bx+0Ch], si
		mov	word ptr es:[bx+0Eh], ds

loc_1035A:				; CODE XREF: sub_10333+18j
					; sub_10333+1Cj
		test	cs:byte_10220, 8
		jz	short loc_1036F
		test	al, 8
		jz	short loc_1036F
		cli
		mov	es:[bx+8], si
		mov	word ptr es:[bx+0Ah], ds

loc_1036F:				; CODE XREF: sub_10333+2Dj
					; sub_10333+31j
		sti

loc_10370:				; CODE XREF: sub_10333+10j
		pop	es
		pop	ds
		assume ds:seg000
		pop	bx
		pop	ax
		retn
sub_10333	endp


; =============== S U B	R O U T	I N E =======================================


sub_10375	proc near		; CODE XREF: start_0-414p
		test	cs:byte_10220, 1
		jz	short locret_103A5
		push	ax
		push	bx
		push	ds
		lds	bx, dword ptr cs:stru_1020B.ofs
		cli
		mov	ax, [bx]
		mov	es:[si], ax
		mov	ax, [bx+2]
		mov	es:[si+2], ax
		mov	word ptr [bx+2], es
		mov	[bx], si
		mov	cs:stru_10213.segm, es
		mov	cs:stru_10213.ofs, si
		sti
		pop	ds
		pop	bx
		pop	ax

locret_103A5:				; CODE XREF: sub_10375+6j
		retn
sub_10375	endp


; =============== S U B	R O U T	I N E =======================================


sub_103A6	proc near		; CODE XREF: seg000:040Cp
		push	si
		push	es
		les	si, dword ptr cs:stru_10213.ofs
		jmp	short loc_103B6
sub_103A6	endp


; =============== S U B	R O U T	I N E =======================================


sub_103AF	proc near		; CODE XREF: seg000:03E0p
		push	si
		push	es
		les	si, dword ptr cs:stru_1020F.ofs

loc_103B6::				; CODE XREF: sub_103A6+7j
		push	bx
		push	ds
		lds	bx, dword ptr cs:stru_1020B.ofs
		mov	word ptr [bx+2], es
		mov	[bx], si
		pop	ds
		pop	bx
		pop	es
		pop	si
		retn
sub_103AF	endp

; ---------------------------------------------------------------------------

loc_103C7:				; DATA XREF: set_interrupt_2F_sub_10529+1Co
		cmp	ah, cs:byte_1021F
		jz	short loc_103D3
		jmp	dword ptr cs:stru_1021B.ofs
; ---------------------------------------------------------------------------

loc_103D3:				; CODE XREF: seg000:03CCj
		sti
		cmp	al, 0
		jz	short loc_103E8
		cmp	al, 9
		jz	short loc_10406
		cmp	al, 8
		jnz	short near ptr byte_103E3
		call	sub_103AF
; ---------------------------------------------------------------------------
byte_103E3	db 0EAh			; CODE XREF: seg000:03DEj
stru_103E4	ptr16_t	<0>		; DATA XREF: seg000:0407r
					; sub_105DA+1Fw ...
; ---------------------------------------------------------------------------

loc_103E8:				; CODE XREF: seg000:03D6j
		mov	al, 0FFh
		cmp	bx, 4456h
		jnz	short do_iret
		cmp	cx, 5844h
		jnz	short do_iret
		cmp	dx, 4931h
		jnz	short do_iret
		mov	bx, 4845h
		mov	cx, 5245h
		mov	dx, 4456h

do_iret:				; CODE XREF: seg000:03EEj seg000:03F4j ...
		iret
; ---------------------------------------------------------------------------

loc_10406:				; CODE XREF: seg000:03DAj
		pushf
		call	dword ptr cs:stru_103E4.ofs
		call	sub_103A6
		iret

; =============== S U B	R O U T	I N E =======================================


restore_interrupt_F2_sub_10410 proc near ; CODE	XREF: start_0:loc_1027Cp
					; start_0:loc_10322p
		test	cs:byte_10220, 2
		jz	short exit
		push	ax
		push	dx
		push	ds
		lds	dx, dword ptr cs:old_interrupt_2F.ofs
		mov	ax, 252Fh
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		pop	dx
		pop	ax

exit:					; CODE XREF: restore_interrupt_F2_sub_10410+6j
		retn
restore_interrupt_F2_sub_10410 endp

; ---------------------------------------------------------------------------
		db 100h	dup(0)		; 0 ; stack data

; =============== S U B	R O U T	I N E =======================================


set_interrupt_2F_sub_10529 proc	near	; CODE XREF: start_0+Cp
					; DATA XREF: start_0o
		test	cs:byte_10220, 2
		jz	short exit
		push	ax
		push	bx
		push	dx
		push	ds
		push	es
		push	cs
		pop	ds
		mov	ax, 352Fh
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	old_interrupt_2F.ofs, bx
		mov	old_interrupt_2F.segm, es
		mov	dx, offset loc_103C7
		mov	ax, 252Fh
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	es
		pop	ds
		pop	dx
		pop	bx
		pop	ax

exit:					; CODE XREF: set_interrupt_2F_sub_10529+6j
		retn
set_interrupt_2F_sub_10529 endp


; =============== S U B	R O U T	I N E =======================================


check_for_desq_view_sub_10553 proc near	; CODE XREF: start_0+3p
		push	ax
		push	bx
		push	bx
		push	cx
		push	dx
		mov	ax, 2B01h
		xor	bx, bx
		mov	cx, 'DE'
		mov	dx, 'SQ'
		int	21h		; DOS -	SET CURRENT DATE
					; DL = day, DH = month,	CX = year
					; Return: AL = 00h if no error /= FFh if bad value sent	to routine
					;
					; RBIL:	INTERRUP.F, line: 4703
					;
					; INT 21 - DESQview - INSTALLATION CHECK
					;     AH = 2Bh
					;     CX = 4445h ('DE')
					;     DX = 5351h ('SQ')
					;     AL = subfunction (DV v2.00+)
					;	  01h get version
					;	  Return: BX = version (BH = major, BL = minor)
					;	  Note:	early copies of	v2.00 return 0002h
					; Return: AL = FFh if DESQview not installed
					; Notes:  in DESQview v1.x, there were no subfunctions;	this call only identified
					;	whether	or not DESQview	was loaded.  DESQview v2.52 performs function
					;	01h for	all subfunction	requests 0Ch and higher	and appears to ignore
					;	all lower-numbered functions not listed	here.
					;     DESQview versions	2.50-2.52 are part of DESQview/X v1.0x;	version	2.53
					;	is part	of DESQview/X v1.10; and version 2.63 is part of DESQview/X
					;	v2.00.
		mov	ax, bx
		
IFDEF BINARY_EQUAL
    db 3Dh, 02h, 00h
ELSE
    cmp	ax, 2		; DESQview Version=2?
ENDIF
    
		jnz	short loc_1056E
		xchg	ah, al

loc_1056E:				; CODE XREF: check_for_desq_view_sub_10553+17j
		pop	dx
		pop	cx
		pop	bx
		test	ax, ax
		jz	short loc_1058C
		mov	bl, 0
		cmp	ax, 21Ah
		jb	short loc_10587
		or	bl, 5
		cmp	ax, 232h
		jnb	short loc_10587
		or	bl, 2

loc_10587:				; CODE XREF: check_for_desq_view_sub_10553+27j
					; check_for_desq_view_sub_10553+2Fj
		mov	cs:byte_10220, bl

loc_1058C:				; CODE XREF: check_for_desq_view_sub_10553+20j
		pop	bx
		pop	ax
		retn
check_for_desq_view_sub_10553 endp


; =============== S U B	R O U T	I N E =======================================


sub_1058F	proc near		; CODE XREF: start_0+6p
		push	ax
		push	bx
		push	di
		push	es
		mov	ah, 52h
		int	21h		; DOS -	2+ internal - GET LIST OF LISTS
					; Return: ES:BX	-> DOS list of lists
		sub	bx, 2
		push	bx
		mov	di, 19h
		mov	ah, 30h
		int	21h		; DOS -	GET DOS	VERSION
					; Return: AL = major version number (00h for DOS 1.x)
		cmp	al, 2
		jz	short loc_105B1
		mov	di, 24h
		
IFDEF BINARY_EQUAL
    db 3Dh, 03h, 00h
ELSE
    cmp	ax, 3
ENDIF    
    
		jnz	short loc_105B1
		mov	di, 2Ah

loc_105B1:				; CODE XREF: sub_1058F+15j
					; sub_1058F+1Dj
		pop	bx
		add	bx, di
		mov	cs:stru_1020B.segm, es
		mov	cs:stru_1020B.ofs, bx
		les	bx, es:[bx]
		mov	cs:stru_1020F.segm, es
		mov	cs:stru_1020F.ofs, bx
		mov	cs:stru_10213.segm, es
		mov	cs:stru_10213.ofs, bx
		pop	es
		pop	di
		pop	bx
		pop	ax
		retn
sub_1058F	endp


; =============== S U B	R O U T	I N E =======================================


sub_105DA	proc near		; CODE XREF: sub_10696+Ap
		push	ax
		push	bx
		push	cx
		push	dx
		push	di
		push	si
		push	es
		mov	ax, 352Fh
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	cx, es
		test	cx, cx
		jnz	short loc_105F1
		mov	bx, offset do_iret
		mov	cx, ds

loc_105F1:				; CODE XREF: sub_105DA+10j
		mov	stru_1021B.ofs,	bx
		mov	stru_1021B.segm, cx
		mov	stru_103E4.ofs,	bx
		mov	stru_103E4.segm, cx
		mov	ah, byte_1021F
		test	ah, ah
		jnz	short loc_1060B
		mov	ah, 0DEh	; ax = 0xDE00 -	for DESQview check

loc_1060B:				; CODE XREF: sub_105DA+2Dj
		mov	cx, es
		jcxz	short loc_10660
		mov	al, 0

loc_10611:				; CODE XREF: sub_105DA+78j
		mov	bx, 'DV'
		mov	cx, 'XD'
		mov	dx, 'I1'
		push	ax
		push	ds
		int	2Fh		; RBIL:	DVINT.LST, line: 4459
					;
					; INT 2F - DESQview v2.26+ External Device Interface - INSTALLATION CHECK
					;     AX = DE00h
					;     BX = 4456h ("DV")
					;     CX = 5844h ("XD")
					;     DX = 4931h ("I1")
					; Return: AL = FFh if installed	(even if other registers do not	match)
					;     if BX,CX,	and DX were as specified on entry,
					;	  BX = 4845h ("HE")
					;	  CX = 5245h ("RE")
					;	  DX = 4456h ("DV")
					; Range:  AH=C0h to AH=FFh, selected by	scanning AH=DEh-FFh, then AH=C0h-DDh
					; Note:	  the XDI handler should not issue any DOS or BIOS calls, nor should it
					;	issue DESQview API calls other than those allowed from hardware	ints
		mov	di, ax
		and	di, 0FFh
		pop	ds
		pop	ax
		jz	short loc_10656
		cmp	di, 0FFh
		jnz	short loc_10642
		cmp	bx, 'HE'
		jnz	short loc_10642
		cmp	cx, 'RE'
		jnz	short loc_10642
		cmp	dx, 'DV'
		jnz	short loc_10642
		jmp	short loc_10660
; ---------------------------------------------------------------------------

loc_10642:				; CODE XREF: sub_105DA+52j
					; sub_105DA+58j ...
		cmp	byte_1021F, 0
		jnz	short loc_10656
		inc	ah
		jnz	short loc_1064F
		mov	ah, 0C0h

loc_1064F:				; CODE XREF: sub_105DA+71j
		cmp	ah, 0DEh
		jnz	short loc_10611
		xor	ah, ah

loc_10656:				; CODE XREF: sub_105DA+4Cj
					; sub_105DA+6Dj
		mov	stru_103E4.ofs,	offset do_iret
		mov	stru_103E4.segm, ds

loc_10660:				; CODE XREF: sub_105DA+33j
					; sub_105DA+66j
		mov	byte_1021F, ah
		pop	es
		pop	si
		pop	di
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_105DA	endp

; ---------------------------------------------------------------------------
aErrorAccessing	db 'Error accessing XDI.  Terminating . . .',0Dh,0Ah,'$'
					; DATA XREF: sub_10696+14o

; =============== S U B	R O U T	I N E =======================================


sub_10696	proc near		; CODE XREF: start_0+9p
		push	ds
		push	cs
		pop	ds
		test	byte_10220, 2
		jz	short loc_106B6
		call	sub_105DA
		cmp	byte_1021F, 0
		jnz	short loc_106B6
		mov	dx, offset aErrorAccessing ; "Error accessing XDI.  Terminating	. . ."...
		mov	ah, 9
		int	21h		; DOS -	PRINT STRING
					; DS:DX	-> string terminated by	"$"
		mov	ax, 4C01h
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
					; AL = exit code
; ---------------------------------------------------------------------------

loc_106B6:				; CODE XREF: sub_10696+8j
					; sub_10696+12j
		pop	ds
		retn
sub_10696	endp


; =============== S U B	R O U T	I N E =======================================


sub_106B8	proc near		; CODE XREF: parse_command_line_sub_106DB:loc_106F9p
		push	ax
		push	si
		push	di
		push	es
		push	ds
		pop	es
		assume es:seg000
		cld
		lea	di, [si-1]

loc_106C2:				; CODE XREF: sub_106B8+18j
		lodsb
		cmp	al, 20h
		jz	short loc_106D2
		cmp	al, 0Dh
		jz	short loc_106D2
		cmp	al, 0Ah
		jz	short loc_106D2
		stosb
		jmp	short loc_106C2
; ---------------------------------------------------------------------------

loc_106D2:				; CODE XREF: sub_106B8+Dj
					; sub_106B8+11j ...
		mov	al, 20h
		stosb
		pop	es
		assume es:nothing
		pop	di
		pop	si
		pop	ax
		dec	si
		retn
sub_106B8	endp


; =============== S U B	R O U T	I N E =======================================


parse_command_line_sub_106DB proc near	; CODE XREF: start_0+Fp
		cld
		mov	di, offset driver_file_name

loc_106DF:				; Command-line tail (terminated	by a 0Dh)
		mov	si, 81h
		mov	cl, ds:80h	; Number of bytes on command-line
		xor	ch, ch
		jcxz	short locret_106F8
		mov	bx, cx
		mov	byte ptr [bx+si+1], 0Ah	; newline?

loc_106F0:				; CODE XREF: parse_command_line_sub_106DB+1Bj
		cmp	byte ptr [si], 20h ; blank
		jnz	short loc_106F9
		inc	si
		loop	loc_106F0

locret_106F8:				; CODE XREF: parse_command_line_sub_106DB+Dj
		retn
; ---------------------------------------------------------------------------

loc_106F9:				; CODE XREF: parse_command_line_sub_106DB+18j
		call	sub_106B8
		mov	word_1015A, si

loc_10700:				; CODE XREF: parse_command_line_sub_106DB+2Bj
		cmp	byte ptr [si], 20h ; blank
		jz	short locret_10708
		movsb
		loop	loc_10700

locret_10708:				; CODE XREF: parse_command_line_sub_106DB+28j
		retn
parse_command_line_sub_106DB endp


; =============== S U B	R O U T	I N E =======================================


start_0		proc near		; CODE XREF: startj

; FUNCTION CHUNK AT 0238 SIZE 0000004C BYTES
; FUNCTION CHUNK AT 0291 SIZE 000000A2 BYTES

		mov	sp, offset set_interrupt_2F_sub_10529 ;	start of stack data: db	100 dup(0)
		call	check_for_desq_view_sub_10553
		call	sub_1058F
		call	sub_10696
		call	set_interrupt_2F_sub_10529
		call	parse_command_line_sub_106DB
		mov	word_1015C, cs
		mov	ax, ds:2	; ?? PSP: Segment of the first byte beyond the memory allocated	to the program // https://github.com/open-watcom/open-watcom-v2/blob/master/bld/clib/process/h/psp.h
		mov	word_10158, ax
		mov	bx, sp
		add	bx, 0Fh
		mov	cl, 4
		shr	bx, cl
		mov	ax, cs
		add	ax, bx
		mov	bx, offset exec_param
		mov	[bx+exec_param_block_t.load_seg], ax
		mov	[bx+exec_param_block_t.relocation_factor], ax ;	only needed for	exe
		mov	stru_10204.segm, ax
		mov	dx, offset driver_file_name
		push	ds
		pop	es
		assume es:seg000
		mov	ax, 4B03h	; DOS: LOAD OR EXECUTE (EXEC) --> 03h =	load overlay
					;
					; Format of EXEC parameter block for AL=03h:
					; Offset  Size	  Description (Table 01591)
					;  00h	  WORD	  segment at which to load overlay
					;  02h	  WORD	  relocation factor to apply to	overlay	if in .EXE format
		jmp	loc_10291	; DS:DX	-> ASCIZ filename
start_0		endp			; ES:BX	-> parameter block
					; AL = subfunc:	called by MSC spawn(P_NOWAIT,...) when running DOS 4.x.
seg000		ends


		end start
