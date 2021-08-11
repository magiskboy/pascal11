PROGRAM xulisonguyenlon;
USES crt;
VAR a,b,s:STRING[254];
    x,i,j:BYTE;
    key:STRING[4];
BEGIN
WHILE key<>'exit' DO
BEGIN
    ClrScr;
    textcolor(14);
    gotoxy(30,3);
    writeln('CONG 2 SO NGUYEN LON');
    readln;
    textcolor(9);
    gotoxy(24,5);
    writeln('Nhap so nguyen a=');
    textcolor(12);
    read(a);
    readln;
    textcolor(9);
    gotoxy(24,8);
    writeln('Nhap so nguyen b=');
    textcolor(12);
    read(b);
    readln;
    j:=0;
    WHILE length(a)<>length(b) DO
    BEGIN
        IF length(a)<length(b) THEN a:= '0'+a;{cho 2 so co ki tu bang nhau}
        IF length(a)>length(b) THEN b:='0'+b;
    END;
    gotoxy(2,12);
    textcolor(8);
    write(a);
    gotoxy(1,14);
    write('+');
    gotoxy(2,16);
    write(b);
    gotoxy(2,18);
    textcolor(7);
    FOR i:= 1 TO length(a) DO
    write('_');
    FOR i:= length(a) DOWNTO 1 DO
    BEGIN
        x:=ord(a[i])+ ord(b[i])+ j - 96; {cong gia tri cua 2 xau}
        j:=0;{xu li phan ngo}
        IF x>9 THEN
        BEGIN
            x:=x-10;
            j:=j+1;

        END;
        s:=chr(x+48)+s;
    END;
    readln;
    IF j=1 THEN s:='1'+s;
    gotoxy(2,20);
    textcolor(15);
    write(s);
    readln;
    delete(s,1,length(s));
    gotoxy(20,22);
    textcolor(2);
    writeln('Ban muon thoat thi go exit ');
    gotoxy(50,22);
    textcolor(12);
    read(key);
END;
END.


