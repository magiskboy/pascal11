USES crt;
VAR a: BYTE;
    i:BYTE;
    b: LONGINT;
FUNCTION giaithua(n: BYTE):LONGINT;
BEGIN
    giaithua:=1;
    FOR i:= 1 TO
     n DO
    giaithua:=giaithua*i;
END; 
BEGIN
    REPEAT
    clrscr;
    writeln('Nhap N:=');
    read(a);
    b:=giaithua(a);
    writeln('',b);
    readln;
    readln;
    UNTIL keypressed=TRUE;
END.
    
