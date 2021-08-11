USES crt;
VAR ch: CHAR;
    x, y: BYTE;
    xmoi, ymoi: BYTE;
    diem: WORD;
BEGIN
    textcolor(12); 
    x:=40;
    y:=12;
    WHILE ch<>chr(27) DO
    BEGIN
    xmoi:= random(79);
    ymoi:= random(24);
    inc(xmoi);
    inc(ymoi);
    gotoxy(xmoi, ymoi);
    write('x');
    gotoxy(x,y);
    write('O');
    ch:=readkey;
    gotoxy(x,y);
    write(' ');
    IF ch=chr(72) THEN dec(y);
    IF ch= chr(80) THEN inc(y);
    IF ch=chr(75) THEN dec(x);
    IF ch=chr(77) THEN inc(x);
    IF x=80 THEN x:=1; 
    IF x=1 THEN x:=80;
    IF y=1 THEN y:=25;
    IF y=25 THEN y:=1;
    IF (x=xmoi) AND (y= ymoi) THEN 
    BEGIN 
        clrscr;
    inc(diem);
    gotoxy(xmoi, ymoi);
    write(' ');
    END;
    gotoxy(3,1);
    write('DIEM: ',diem);
    END;
END.