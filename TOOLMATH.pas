{}
PROGRAM toolmath;
USES crt;
VAR chon:BYTE;
PROCEDURE menu;
BEGIN
    gotoxy(25,2);
    textcolor(14);
    write('BO CONG CU HOC TOAN TOOLMATH');
    gotoxy(3,3);
    textcolor(9);
    write('MENU');
    gotoxy(50,4);
    textcolor(12);
    write('Tac gia: Nguyen Khac Thanh');
    gotoxy(50,6);
    write('Lien he: 01822341998');
    textcolor(15);
    gotoxy(16,4);
    write('1. Phep cong');
    gotoxy(16,6);
    write('2.Phep tru');
    gotoxy(16,8);
    write('3.Phep nhan');
    gotoxy(16,10);
    write('4.Phep toan chia lay thuong nguyen div');
    gotoxy(16,12);
    write('5.Phep toan chia lay du');
    gotoxy(16,14);
    write('6.Tinh so Fibonacci thu n');
    gotoxy(16,16);
    write('7.Tinh so Catalan.');
    gotoxy(16,18);
    write('8.Thoat.');
    gotoxy(4,20);
    textcolor(9);
    write('Chon so may?');
    gotoxy(13,20);
END;
FUNCTION cmp(a,b:STRING):INTEGER;
BEGIN
    WHILE length(a)> length(b) DO a:='0'+a;
    WHILE length(a)< length(b) DO b:='0'+b;
    IF a=b THEN exit(0);
    IF a<>b THEN exit(1);
    exit(-1);
END;
FUNCTION add(a,b:STRING):STRING;
VAR sum,carry,i,x,y:INTEGER;
    c:STRING;
BEGIN
     carry:=0; c:='';
     WHILE length(a)<>length(b) DO
         BEGIN
             IF length(a)<length(b) THEN a:= '0'+a;{cho 2 so co ki tu bang nhau}
             IF length(a)>length(b) THEN b:='0'+b;
         END;
         FOR i:=length(a) DOWNTO 1 DO
         BEGIN
            x:= ord(a[i])-48;
            y:= ord(b[i])-48;
            sum:=x+y+carry;
            carry:= sum DIV 10;
            c:=CHAR(sum MOD 10 +48)+c;
         END;
         IF carry>0 THEN c:='1'+c;
         add:=c;
END;
FUNCTION sub(a,b:STRING):STRING;
VAR c:STRING;
    s,borrow,i:INTEGER;
BEGIN
    borrow:=0; c:='';
    WHILE length(a)<>length(b) DO
         BEGIN
             IF length(a)<length(b) THEN a:= '0'+a;{cho 2 so co ki tu bang nhau}
             IF length(a)>length(b) THEN b:='0'+b;
         END;
         FOR i:= length(a) DOWNTO 1 DO
         BEGIN
            s:= ord(a[i])-ord(b[i])-borrow;
            IF s<0 THEN
            BEGIN
                s:=s+10;
                borrow:=1;
            END ELSE borrow:=0;
            c:=CHAR(s+48)+c;
         END;
         WHILE (length(c)>1) AND (c[1]='0') DO delete(c,1,1);
         sub:=c;
END;
FUNCTION multiply(a,b:STRING):STRING;
VAR sum,tmp:STRING;
    m,i,j:INTEGER;
BEGIN
     m:=-1; sum:='';
     FOR i:= length(a) DOWNTO 1 DO
     BEGIN
        m:=m+1;
        tmp:='';
        FOR j:= 1 TO (ord(a[i])-48)DO tmp:=add(tmp,b);
        FOR j:= 1 TO m DO tmp:=tmp+'0';
        sum:=add(tmp,sum);
     END;
     multiply:=sum;
END;
FUNCTION div1(a,b:STRING):STRING;
VAR c, hold:STRING;
    kb:ARRAY [0..10] OF STRING;
    i,k: LONGINT;
BEGIN
    kb[0]:='0';
    FOR i:= 1 TO 10 DO
    kb[i]:=add(kb[i-1],b);
    hold:='';
    c:='';
    FOR i:=1 TO length(a) DO
    BEGIN
        hold:= hold+a[i];
        k:=1;
        WHILE cmp(hold,kb[k])<>-1 DO
        inc(k);
        c:=c+CHAR(k-1+48);
        hold:=sub(hold,kb[k-1]);
    END;
    WHILE ((length(c)>1) AND (c[1]='0')) DO delete(c,1,1);
    div1:=c;
END;
FUNCTION mod1(a,b:STRING):STRING;
VAR hold:STRING;
    kb:ARRAY [0..10] OF STRING;
    i,k: LONGINT;
BEGIN
    kb[0]:='0';
    FOR i:=1 TO 10 DO
    kb[i]:=add(kb[i-1],b);
    hold:='';
    FOR i:= 1 TO length(a)DO
    BEGIN
        hold:=hold+a[i];
        k:=1;
        WHILE cmp(hold,kb[k])<>-1 DO
        inc(k);
        hold:=sub(hold,kb[k-1]);
    END;
    mod1:=hold;
END;
PROCEDURE cong;
VAR tong,p,q: STRING;
    key:STRING;
    l:INTEGER;
BEGIN
    key:='c';
    textbackground(0);
    WHILE key<>'m' DO
    BEGIN
    clrscr;
    gotoxy(25,2);
    textcolor(14);
    write('BO CONG CU HOC TOAN TOOLMATH');
    gotoxy(3,3);
    textcolor(9);
    write('MENU');
    gotoxy(50,4);
    textcolor(12);
    write('Tac gia: Nguyen Khac Thanh');
    gotoxy(50,6);
    write('Lien he: 01822341998');
    gotoxy(3,4);
    textcolor(14);
    write('Phep cong');
    gotoxy(3,6);
    textcolor(15);
    write('Nhap so hang thu 1 ');
    gotoxy(3,8);
    write('Nhap so hang thu 2 ');
    textcolor(10);
    gotoxy(22,6);readln;;read(p);
    gotoxy(22,8);readln;;read(q);
    WHILE length(p)> length(q) DO q:='0'+q;
    WHILE length(p)< length(q) DO p:='0'+p;
    textcolor(14);
    gotoxy(2,10);
    write(p);
    gotoxy(2,12);
    write(q);
    textcolor(12);
    gotoxy(1,11);
    write('+');
    gotoxy(2,13);
    FOR l:= 1 TO length(p) DO write('_');
    tong:=add(p,q);
    gotoxy(2,14);
    write(tong);
    textcolor(14);
    gotoxy(3,16);
    readln;
    write('Ban muon thoat thi nhan phim m');
    gotoxy(46,16);
    read(key);
    END;
    readln;
    menu;
END;
PROCEDURE tru;
VAR hieu,p,q: STRING;
    key:STRING;
    l:INTEGER;
BEGIN
    key:='c';
    textbackground(0);
    WHILE key<>'m' DO
    BEGIN
    clrscr;
    gotoxy(25,2);
    textcolor(14);
    write('BO CONG CU HOC TOAN TOOLMATH');
    gotoxy(3,3);
    textcolor(9);
    write('MENU');
    gotoxy(50,4);
    textcolor(12);
    write('Tac gia: Nguyen Khac Thanh');
    gotoxy(50,6);
    write('Lien he: 01822341998');
    gotoxy(16,4);
    textcolor(14);
    write('Phep tru');
    gotoxy(3,6);
    textcolor(15);
    write('Nhap so bi tru ');
    gotoxy(3,8);
    write('Nhap so tru ');
    textcolor(10);
    gotoxy(22,6);readln; read(p);
    gotoxy(22,8);readln;; read(q);
    WHILE length(p)> length(q) DO q:='0'+q;
    WHILE length(p)< length(q) DO p:='0'+p;
    textcolor(14);
    gotoxy(2,10);
    write(p);
    gotoxy(2,12);
    write(q);
    textcolor(12);
    gotoxy(1,11);
    write('+');
    gotoxy(2,13);
    FOR l:= 1 TO length(p) DO write('_');
    hieu:=sub(p,q);
    gotoxy(2,14);
    write(hieu);
    textcolor(14);
    gotoxy(3,16);
    readln;
    write('Ban muon thoat thi nhan phim m');
    gotoxy(46,16);
    read(key);
    menu;
    END;
    readln;
    menu;
END;
PROCEDURE nhan;
VAR tich,p,q: STRING;
    key:STRING;
    l:INTEGER;
BEGIN
    key:='c';
    textbackground(0);
    WHILE key<>'m' DO
    BEGIN
    clrscr;
    clrscr;
    gotoxy(25,2);
    textcolor(14);
    write('BO CONG CU HOC TOAN TOOLMATH');
    gotoxy(3,3);
    textcolor(9);
    write('MENU');
    gotoxy(50,4);
    textcolor(12);
    write('Tac gia: Nguyen Khac Thanh');
    gotoxy(50,6);
    write('Lien he: 01822341998');
    gotoxy(16,4);
    textcolor(14);
    write('Phep nhan');
    gotoxy(3,6);
    textcolor(15);
    write('Nhap thua so thu 1 ');
    gotoxy(3,8);
    write('Nhap thua so thu 2 ');
    textcolor(10);
    gotoxy(18,6);readln; read(p);
    gotoxy(18,8);readln; read(q);
    textcolor(14);
    gotoxy(2,10);
    write(p);
    gotoxy(2,12);
    write(q);
    textcolor(12);
    gotoxy(1,11);
    write('x');
    tich:=multiply(p,q);
    gotoxy(2,13);
    FOR l:= 1 TO length(tich) DO write('_');
    gotoxy(2,14);
    write(tich);
    textcolor(14);
    gotoxy(3,16);
    readln;
    write('Ban muon thoat thi nhan phim m');
    gotoxy(46,16);
    read(key);
    END;
    readln;
    menu;
END;
PROCEDURE div1;
VAR thuong,p,q: STRING;
    key:STRING;
    l:INTEGER;
BEGIN
    key:='c';
    textbackground(0);
    WHILE key<>'m' DO
    BEGIN
    clrscr;
    gotoxy(25,2);
    textcolor(14);
    write('BO CONG CU HOC TOAN TOOLMATH');
    gotoxy(3,3);
    textcolor(9);
    write('MENU');
    gotoxy(50,4);
    textcolor(12);
    write('Tac gia: Nguyen Khac Thanh');
    gotoxy(50,6);
    write('Lien he: 01822341998');
    gotoxy(16,4);
    textcolor(14);
    write('Phep chia lay nguyen');
    gotoxy(3,6);
    textcolor(15);
    write('Nhap so bi chia ');
    gotoxy(3,8);
    write('Nhap so chia ');
    textcolor(10);
    gotoxy(18,6);readln; read(p);
    gotoxy(18,8);readln; read(q);
    textcolor(14);
    gotoxy(2,10);
    write(p);
    gotoxy(2,12);
    write(q);
    textcolor(12);
    gotoxy(1,11);
    write('/');
    thuong:=div1(p,q);
    gotoxy(2,13);
    FOR l:= 1 TO length(p) DO write('_');
    gotoxy(2,14);
    write(thuong);
    textcolor(14);
    gotoxy(3,16);
    readln;
    write('Ban muon thoat thi nhan phim m');
    gotoxy(46,16);
    read(key);
    END;
    readln;
    menu;
END;
PROCEDURE mod1;
VAR du,p,q: STRING;
    key:STRING;
    l:INTEGER;
BEGIN
    key:='c';
    textbackground(0);
    WHILE key<>'m' DO
    BEGIN
    clrscr;
    gotoxy(25,2);
    textcolor(14);
    write('BO CONG CU HOC TOAN TOOLMATH');
    gotoxy(3,3);
    textcolor(9);
    write('MENU');
    gotoxy(50,4);
    textcolor(12);
    write('Tac gia: Nguyen Khac Thanh');
    gotoxy(50,6);
    write('Lien he: 01822341998');
    gotoxy(16,4);
    textcolor(14);
    write('Phep chia lay du');
    gotoxy(3,6);
    textcolor(15);
    write('Nhap so bi chia ');
    gotoxy(3,8);
    write('Nhap so chia ');
    textcolor(10);
    gotoxy(18,6);readln; read(p);
    gotoxy(18,8);readln; read(q);
    textcolor(14);
    gotoxy(2,10);
    write(p);
    gotoxy(2,12);
    write(q);
    textcolor(12);
    gotoxy(1,11);
    write('/');
    du:=mod1(p,q);
    gotoxy(2,13);
    FOR l:= 1 TO length(p) DO write('_');
    gotoxy(2,14);
    write(du);
    textcolor(14);
    gotoxy(3,16);
    readln;
    write('Ban muon thoat thi nhan phim m');
    gotoxy(46,16);
    read(key);
    END;
    readln;
    menu;
END;
BEGIN
    clrscr;
    gotoxy(30,12);
    textcolor(12);
    write('LOADING...');
    delay(3000);
    clrscr;
    menu;
    gotoxy(27,20);
    textcolor(4);
    read(chon);
    CASE chon OF
    1: BEGIN
        cong;
       END;
    2: BEGIN
        tru;
       END;
    3: BEGIN
        nhan;
       END;
    4: BEGIN
        div1;
       END;
    5: BEGIN
        mod1;
       END;
    6: BEGIN
        halt;
        END;
END;
END.