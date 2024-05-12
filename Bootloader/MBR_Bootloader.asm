#Read in <al> sectors into memory at <es:bx> and jump there manually

MOV ah, 02h     # read command
MOV al, 01h     # number of sectors to read
MOV ch, 00h     # cylinder (low 8 bits of cylinder number)
MOV cl, 02h     # sector (and high 2 bits of cylinder) ccss_ssss
MOV dh, 00h     # head

                # (note DL contains current drive number from BIOS)

MOV bx, 1000h   #set ES
MOV es, bx
MOV bx, 0000h   #set BX

INT 13h         # call BIOS disk access interrupt
JMP 1000:0000h  # Start executing program read from disk 

