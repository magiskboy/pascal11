PROGRAM ALTP;
USES crt;
VAR data:TEXT;
    cauhoi,ten:STRING;
    pa:ARRAY[1..4] OF STRING; 
    da:CHAR;
    i,j,cau,tuoi,x:BYTE;
    g,traloi,choice:CHAR;
    diem:WORD;
    check:BOOLEAN;
    que,namsinh,name, tit_1, tit_2, hoiten, lvs, hoitraloi,help, help_1,help_2, h501, h502:STRING;   
    me: ARRAY[1..5] OF STRING;
    tt:ARRAY[1..6] OF STRING;
    tt_2: ARRAY [1..5] OF STRING;
    h: ARRAY[1..3] OF STRING;
    call:ARRAY[1..9] OF STRING;
    adddata: ARRAY[1..7] OF STRING;
    khen:ARRAY[1..7] OF STRING;    
PROCEDURE loadlang;
VAR lang:TEXT;
BEGIN
    assign(lang,'lang.dta');
    reset(lang);
    read(lang,name); {1}
    readln(lang);
    read(lang,tit_1); {2}
    readln(lang);
    FOR i:=1 TO 5 DO    {3-7}
    BEGIN
        read(lang,me[i]);
        readln(lang);
    END;
    read(lang,tit_2);   {8}
    readln(lang);
    FOR i:=1 TO 6 DO     {9-14}
    BEGIN
        read(lang,tt[i]);
        readln(lang);
    END;
    read(lang,lvs);   {15}
    readln(lang);
    read(lang,hoiten);{16}
    readln(lang);
    FOR i:=1 TO 5 DO   {17-21}
    BEGIN
        read(lang,tt_2[i]);
        readln(lang);
    END;
    readln(lang);
    read(lang,hoitraloi);   {22}
    readln(lang);
    read(lang,help);   {23}
    readln(lang);
    FOR i:=1 TO 3 DO    {24-26}
    BEGIN
       read(lang,h[i]);
       readln(lang);
    END;
    readln(lang);
    read(lang,help_2);  {27}
    readln(lang);
    FOR i:= 1 TO 9 DO     {25}
    BEGIN
       read(lang,call[i]);
       readln(lang);
    END;
    readln(lang);
    read(lang,h501);    {36}
    readln(lang);
    read(lang,h502);     {37}
    FOR i:= 1 TO 7 DO       {38-44}
    BEGIN
        read(lang,adddata[i]);
        readln(lang);
    END;
    readln(lang);
    FOR i:= 1 TO 7 DO  {45-51}
    BEGIN
        read(lang,khen[i]);
        readln(lang);
    END;
    close(lang);
END;
PROCEDURE doc;
BEGIN
    read(data,cauhoi);
    readln(data);
    FOR i:= 1 TO 4 DO
    BEGIN
        read(data,pa[i]);
        readln(data);
    END;
    read(data,da);
END;
PROCEDURE thongtin;
VAR tt:TEXT;
    kitu,key:CHAR;
BEGIN
     assign(tt,'thongtin.dta');
     reset(tt);
     textcolor(5);
     WHILE NOT eoln(tt) DO
     BEGIN
        read(tt,kitu);
        write(kitu);
        delay(200);
     END;
     readln(tt);
     i:=2;
     WHILE NOT eof(tt) DO
     BEGIN
        IF eoln(tt) THEN 
        BEGIN
            inc(i);
            writeln();
            gotoxy(20,i);
            readln(tt);
        END;
        read(tt,kitu);
        write(kitu);
        delay(200);
     END;
     close(tt);
     gotoxy(1,i+1);
     key:=readkey;
     IF key=#27 THEN exit;
END;
PROCEDURE clear(a,b,s:BYTE);
BEGIN
    gotoxy(a,b);
    FOR i:= 1 TO s DO
    write(' ');
END;
PROCEDURE goidien;
VAR chon:CHAR;
    chon1:BYTE;
BEGIN
    clear(22,8,56);
    clear(22,9,56);
    clear(22,10,56);
    clear(22,11,56);
    textcolor(12);
    gotoxy(22,8);
    write(call[1]);
    gotoxy(22,9);
    write(call[2]);
    gotoxy(22,10);
    write(call[3]);
    gotoxy(22,11);
    write(call[4]);
    gotoxy(22,12);
    write(call[5]);
    chon:=readkey;
    clear(22,8,length(call[1])); 
    clear(22,9,length(call[2]));
    clear(22,10,length(call[3]));
    clear(22,11,length(call[4]));
    clear(22,12,length(call[5]));
    IF (chon='1') OR (chon='l') OR (chon='L') THEN 
    BEGIN
        gotoxy(22,8);
        write(call[6]); write(' ',da);
    END;
    IF (chon='2') OR (chon='n') OR (chon='N') THEN
    BEGIN
        gotoxy(22,8);
        write(call[7]); write(' ',da);
    END; 
    IF (chon='3') OR (chon='b') OR (chon='B') THEN
    BEGIN
        gotoxy(22,8);
        write(call[8]); write(' ',da);
    END;
    IF (chon='4') OR (chon='r') OR (chon='R') THEN
    BEGIN
        gotoxy(22,8);
        write(call[9]); write(' ',da);
    END;
END;
PROCEDURE h50_50;
VAR h50_1, h50_2: CHAR;
BEGIN
    clear(22,8,56);
    clear(22,9,56);
    clear(22,10,56);
    clear(22,11,56);
    textcolor(140);
    randomize;
    IF da='a' THEN
    BEGIN 
        h50_1:=chr(ord(da)+random(1)+1);
        h50_2:='d';
    END;
    IF da='b' THEN
    BEGIN 
        h50_1:=chr(ord(da)+random(1)+1);
        h50_2:='a';
    END;
    IF da='c' THEN
    BEGIN 
        h50_1:=chr(ord(da)-random(1)-1);
        h50_2:='d';
    END;
    IF da='d' THEN
    BEGIN 
        h50_1:=chr(ord(da)-random(1)-1);
        h50_2:='c';
    END;
    IF h50_1='a' THEN
    clear(26,17,length(pa[1]));
    IF h50_2='a' THEN
    clear(26,17,length(pa[1]));
    IF h50_1='b' THEN
    clear(58,17,length(pa[2]));
    IF h50_2='b' THEN
    clear(58,17,length(pa[2]));
    IF h50_1='c' THEN
    clear(26,19,length(pa[3]));
    IF h50_2='c' THEN
    clear(26,19,length(pa[3]));
    IF h50_1='d' THEN
    clear(58,19,length(pa[4]));
    IF h50_1='d' THEN
    clear(58,19,length(pa[1]));
    gotoxy(22,8);
    write(h501);
    gotoxy(22,9);
    write(h502+' '+h50_1+' '+h50_2);
END;
PROCEDURE dung;
BEGIN
    gotoxy(22,8);
    write('Ban da dung cuoc choi voi so diem la ',diem);
    gotoxy(22,9);
    write('Chuc ban thanh cong trong cuoc song');
    readln;
    check:=FALSE;
END;
PROCEDURE ghidiemcao;
VAR fdiemcao:TEXT;
BEGIN
    assign(fdiemcao,'$highscore.dat');
    append(fdiemcao);
    writeln(fdiemcao);
    write(fdiemcao,ten);
    writeln(fdiemcao);
    write(fdiemcao,'Dung o cau so '); 
    write(fdiemcao,cau);
    writeln(fdiemcao);
    write(fdiemcao,'Voi so diem la ');
    write(fdiemcao,diem);
    close(fdiemcao);
END;
PROCEDURE xuatdiemcao;
VAR fdiemcao: TEXT;
    kitu,key:CHAR;
BEGIN
    assign(fdiemcao,'highscore.dat');
    reset(fdiemcao);
    WHILE NOT eof(fdiemcao) DO
    BEGIN
        IF eoln(fdiemcao) THEN
        BEGIN
            writeln(fdiemcao);
            writeln;
        END;
        read(fdiemcao,kitu);
        write(kitu);
    END;
    close(fdiemcao);
    key:=readkey;
    IF key=#27 THEN exit;
END;
PROCEDURE trogiup;
VAR key:CHAR;
    key1: BYTE;
BEGIN
    textcolor(12);
    gotoxy(23,9);
    write(help);
    gotoxy(23,10);
    write(h[1]);
    gotoxy(23,11);
    write(h[2]);
    gotoxy(23,12);
    write(h[3]);
    key:=readkey;
    key1:=ord(key);
    clear(22,12,56);
    clear(22,9,56);
    clear(22,10,56);
    clear(22,11,56);
    CASE key1 OF
    49:goidien;
    50:h50_50;
    51:dung;
    END;
END;
PROCEDURE play;
BEGIN
    check:=TRUE;
    FOR j:= 1 TO 15 DO
    WHILE check= TRUE DO
    BEGIN
    clrscr;
    textcolor(12);
    gotoxy(30,1);
    write('AI LA TRIEU PHU');
    textcolor(9);
    FOR i:= 1 TO 25 DO
    BEGIN
        gotoxy(20,i);
        write('*');
    END;
    textcolor(10);
    gotoxy(1,2);
    write(tt_2[1]);
    writeln(ten);
    writeln('Tuoi: ',tuoi);
    writeln(namsinh);
    writeln('Que quan:');
    writeln(que);
    writeln;
    writeln(tt_2[3]);
    writeln(tt_2[4]);
    write(' ',cau);
    writeln(tt_2[2]);
    writeln(' ',diem);
    textcolor(15);
    gotoxy(22,4);
    write(lvs);
    gotoxy(22,15);
    write(cauhoi);
    gotoxy(23,17);
    write('A.'+pa[1]);
    gotoxy(55,17);
    write('B.'+pa[2]);
    gotoxy(23,19);
    write('C.'+pa[3]);
    gotoxy(55,19);
    write('D.',pa[4]);
    gotoxy(23,14);
    write(hoitraloi);
    g:=readkey;
    IF g='g' THEN trogiup;
    gotoxy(24+length(hoitraloi),14);
    readln(traloi);
    IF traloi=da THEN
    BEGIN
        inc(diem,cau*10);
        check:= TRUE;
        gotoxy(23,9);
        x:=random(7)+1;
        write(khen[x]);
        delay(500);
    END;
    IF traloi<>da THEN dung;
    END;
END;
BEGIN
    assign(data,'data.dta');
    reset(data);
    doc;
    loadlang;
    textcolor(9);
    FOR i:= 1 TO 80 DO
    BEGIN
        gotoxy(i,1);
        write('*');
        gotoxy(i,25);
        write('*');
    END;
    FOR i:= 1 TO 25 DO
    BEGIN
        gotoxy(1,i);
        write('*');
        gotoxy(80,i);
        write('*');
        gotoxy(35,i);
        write('*');
    END;         
    textcolor(4);
    gotoxy(4,2);
    write(tit_1);
    gotoxy(37,2);
    write(tit_2);
    textcolor(15);
    gotoxy(2,4);
    FOR i:= 1 TO 5 DO
    BEGIN
        gotoxy(2,i+3);
        write(me[i]);
    END;
    textcolor(10);
    gotoxy(37,4);
    write('TEN CHUONG TRINH: AI LA TRIEU PHU');
    gotoxy(37,5);
    write('PHIEN BAN: 1.00 BETA');
    gotoxy(37,6);
    write('NGON NGU: TIENG VIET');
    gotoxy(37,7);
    write('CHAY TREN NEN: MICROSOFT-DOS');
    gotoxy(37,8);
    write('THOI GIAN HOAN THANH: 12-7-2014');
    gotoxy(37,9);
    write('WEBSITE: HTTP://HOAIDUCA.VN.HN');
    gotoxy(2,10);
    choice:=readkey;
    CASE choice OF
    #49:play;
    #51:xuatdiemcao;
    #53:thongtin;
    #54:BEGIN
        FOR i:= 3 DOWNTO 0 DO
        BEGIN
            gotoxy(40,12);
            write('',i);
            delay(1000);
        END;
        halt;
    END;
END;
close(data);
END.
