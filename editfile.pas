PROGRAM textedit;
USES crt, dos;
VAR f, temp: TEXT;
    ch: CHAR;
    key: CHAR;
    filename: STRING[254];
    x, y, n: WORD;
BEGIN
    clrscr;
    assign(f,'temp.txt');
    rewrite(f);
    x:=2;
    y:=2; 
    gotoxy(x,y);
    WHILE ord(ch)<>27 DO { thoat khi an Esc}
    BEGIN
        ch:= readkey;
        IF ch= chr(13) THEN
        BEGIN{ xuong dong khi an Enter}
            writeln;
            writeln(f);
        END; 
        IF ch= chr(8) THEN
        BEGIN { xoa ki tu khi an nut xoa}
            ClrEol;
            writeln(f);
        END;
        IF ch=chr(80) THEN { dua con tro xuong}
        BEGIN
            inc(y);
            gotoxy(x,y);
        END;
        IF ch=chr(72) THEN  {dua con tro len}
        BEGIN
            dec(y);
            gotoxy(x,y);
        END;
        IF ch= chr(77) THEN { dua con tro sang phai}
        BEGIN
            inc(x);
            gotoxy(x,y);
        END;
        IF ch= chr(75) THEN  { dua con tro sang trai}
        BEGIN
            dec(x);
            gotoxy(x,y);
        END;
        IF (ch<>chr(80)) OR (ch<>chr(77)) OR (ch<>chr(75)) OR (ch<>chr(72)) THEN
        BEGIN
        write(ch);
        inc(n);
        END;
        write(f,ch);
    END;
    close(f);
    textcolor(12);
    writeln('Enter File Name...');{ luu File khi xoa}
    readln;
    readln(filename);
    assign(f,'temp.txt');
    reset(f);
    rename(f,filename+'.txt');
    close(f);
END.
