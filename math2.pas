PROGRAM Math;
USES crt;
VAR key, key2: CHAR;
    key1: INTEGER;
PROCEDURE giaiptbac1;
VAR a,b,x: COMP;
BEGIN
    REPEAT
    clrscr;
    textcolor(15);
    gotoxy(3,3);
    write('Nhap he so a: ');
    read(a);
    gotoxy(3,4);
    write('Nhap he so b: ');
    read(b);
    x:=-b/a;
    textcolor(12);
    gotoxy(3,6);
    write('Nghiem cua pt la: ',x);
    key:=readkey;
    UNTIL key=chr(27);
END;
PROCEDURE giaiptbac2;
VAR a,b,c,x1,x2,delta: COMP;
BEGIN
    REPEAT
    clrscr;
    textcolor(15);
    gotoxy(3,3);
    write('Nhap he so a: ');
    read(a);
    gotoxy(3,4);
    write('Nhap he so b: ');
    read(b);
    gotoxy(3,5);
    write('Nhap he so c: ');
    read(c);
    delta:=sqr(b)-4*a*c;
    IF delta<0 THEN 
    BEGIN
        textcolor(14); 
        gotoxy(3,7);
        write('PT VO NGHIEM DO DELTA <0 ',DELTA);
        exit;
    END;
    IF delta=0 THEN
    BEGIN
        x1:=-b/(2*a);
        textcolor(12);
        gotoxy(3,7);
        write(' PT co nghiem kep x1= x2= ',x1);
    END;
    IF delta>0 THEN
    BEGIN
        x1:=(-b-sqrt(delta))/(2*a);
        x2:=(-b+sqrt(delta))/(2*a);
        textcolor(12);
        gotoxy(3,7);
        write(' PT co 2 nghiem phan biet x1= ',x1);
        gotoxy(3,8);
        write('x2= ',x2);
    END;
    key:=readkey;
    UNTIL key=chr(27);
END;
PROCEDURE giaihe2;
VAR a1,b1,c1,a2,b2,c2,x,y,d,dx,dy:COMP;
BEGIN
    REPEAT
    clrscr;
    textcolor(15);
    gotoxy(3,3);
    write('Nhap he so a1: ');
    read(a1);
    gotoxy(3,4);
    write('Nhap he so b1: ');
    read(b1);
    gotoxy(3,5);
    write('Nhap he so c1: ');
    read(c1); 
    gotoxy(3,6);
    write('Nhap he so a2: ');
    read(a2);
    gotoxy(3,7);
    write('Nhap he so b2: ');
    read(b2);
    gotoxy(3,8);
    write('Nhap he so c2: ');
    read(c2);
    d:=a1*b2-a2*b1; 
    dx:=c1*b2-c2*b1;
    dy:=a1*c2-a2*c1;
    IF d=0 THEN 
    BEGIN 
        textcolor(14);
        gotoxy(3,10);
        write('HE PT VO NGHIEM');
        delay(3000);
        exit;
    END;
    IF (dx=0) AND (dy=0) THEN
    BEGIN
        textcolor(14);
        gotoxy(3,10);
        write('HE PT CO VO SO NGHIEM');
        delay(3000);
        exit;
    END
    ELSE
    BEGIN
        x:=dx/d;
        y:=dy/d;
        textcolor(14);
        gotoxy(3,10);
        write('Phuong trinh co nghiem la (',x,',',y,')');
    END;
    key:= readkey;
    UNTIL key= chr(27);
END;
BEGIN
    REPEAT
    clrscr;
    textcolor(15);
    gotoxy(3,3);
    write('Giai pt bac 1');
    gotoxy(3,4);
    write('Giai pt bac 2');
    gotoxy(3,5);
    write('Giai he pt 2 an');
    key2:=readkey;
    key1:=ord(key2)-48;
    CASE key1 OF
    1: giaiptbac1;
    2: giaiptbac2;
    3: giaihe2;
    -21: halt;
END;
    UNTIL key2=chr(27);

END.
