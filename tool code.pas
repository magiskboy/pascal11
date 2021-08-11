PROGRAM mahoa;
USES crt;
VAR output, st: STRING;
    code: TEXT;
    x:INTEGER;
    key,c: CHAR;
    i: BYTE;
    choice:BYTE;
FUNCTION mahoa(st:STRING; key: CHAR):STRING;
VAR code: STRING;
BEGIN
    FOR i:=1 TO length(st) DO
    BEGIN
        x:= ord(st[i])+ord(key);
        IF x>127 THEN x:=x-127;
        write(chr(x));
        code[i]:=chr(x);
    END;
    mahoa:=code;
END;
FUNCTION giaima(st:STRING; key: CHAR):STRING;
BEGIN
    FOR i:=1 TO length(st) DO
    BEGIN
        x:= ord(st[i])-ord(key);
        IF x<127 THEN x:=x+127;
        st[i]:=chr(x);
    END;
    giaima:=st;
END;
PROCEDURE menu;
BEGIN
    clrscr;
    gotoxy(30,2);
    textcolor(14);
    write('CHUONG TRINH MA HOA, GIAI MA XAU KI TU');
    GOTOXY(3,3);
    textcolor(12);
    write('MENU');
    gotoxy(20,5);
    textcolor(15);
    write('1.MA HOA');
    GOTOXY(20,7);
    WRITE('2.GIAI MA');
    gotoxy(10,9);
    textcolor(9);
    write('Ban con che do nao?'); read(choice);
END;
BEGIN
    assign(code,'code.dta');
    rewrite(code);
    c:='e'; 
    REPEAT   
    menu;
    readln;
    CASE choice OF 
    1: BEGIN
        clrscr;
        gotoxy(30,2);
        textcolor(14);
        write('CHUONG TRINH MA HOA, GIAI MA XAU KI TU');
        gotoxy(3,3);
        textcolor(12);
        write('MA HOA');
        gotoxy(1,5);
        textcolor(15);
        writeln('Nhap sau st');
        read(st);
        write(code,'Xau ban dau la: '+st);
        readln;
        gotoxy(1,7);
        writeln('Nhap key');
        read(key);
        writeln(code);
        write(code,'key: '+key);
        readln;
        output:=mahoa(st,key);
        gotoxy(1,9);
        write(output);
        writeln(code);
        write(code,'Ket qua: ');
        write(code,output);
        writeln('Nhan phim e de thoat');read(c);
      END;
    2:BEGIN
        clrscr;
        gotoxy(30,2);
        textcolor(14);
        write('CHUONG TRINH MA HOA, GIAI MA XAU KI TU');
        gotoxy(3,3);
        textcolor(12);
        write('MA HOA');
        gotoxy(1,5);
        textcolor(15);
        writeln('Nhap sau da bi ma hoa st');
        read(st);
        writeln(code);
        write(code,'Sau da bi ma hoa la: '+st); 
        readln;
        gotoxy(1,7);
        writeln('Nhap key');
        read(key);
        writeln(code);
        write(code,'key: '+key);
        readln;
        output:=giaima(st,key);
        gotoxy(1,9);
        write(output);
        writeln(code);
        write(code,' Sau giai ma la '+output);
        readln;
        writeln('Nhan phim e de thoat');read(c);
    END; 
END;
   UNTIL c='e';
   close(code);
END.