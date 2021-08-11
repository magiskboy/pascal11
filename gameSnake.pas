PROGRAM gameSnake;
USES crt;
VAR x: ARRAY[1..3000] OF BYTE;
    y: ARRAY[1..3000] OF BYTE;
    i,sodot: 1..3000;
    j: WORD;
    xmoi, ymoi,huong: BYTE;
    key: CHAR;
PROCEDURE tuong;
BEGIN
    textcolor(4);
    FOR i:= 2 TO 78 DO
    BEGIN{ve 2 truc ngang} 
        gotoxy(i,3);
        write('+');
        gotoxy(i,24);
        write('+');
    END;           
    FOR i:= 3 TO 24 DO
    BEGIN{ve 2 truc doc}
        gotoxy(2,i);
        write('+');
        gotoxy(78,i);
        write('+');
    END;
END;
FUNCTION checkdie(a,b:BYTE; sodot:WORD):BOOLEAN;{a,b la toa do dau ran}
VAR check: BOOLEAN;
BEGIN                  
    FOR j:= 2 TO sodot DO
    IF (a=x[j]) OR (b=y[j]) OR (a=2) OR (a=78) OR (b=3) OR (b=24) THEN check:= TRUE;
    checkdie:=check;
END;
FUNCTION checkmoi(a,b,c,d: WORD): BOOLEAN;{a,b la toa do dau ran. c,d la toa do moi}
VAR check: BOOLEAN;
BEGIN
    IF (a=c) AND (b=d) THEN check:= TRUE;
    checkmoi:= check;
END;
PROCEDURE khoitao;{khoi tao con ran khi bat dau choi}
BEGIN
    textcolor(9);
    FOR i:= 1 TO 5 DO
    BEGIN
        x[i]:=i;
        y[i]:=10;
        gotoxy(x[i],y[i]);
        write('o');
    END;
END;
PROCEDURE ranchay;
BEGIN
    IF keypressed THEN
    BEGIN
    key:=readkey;
    huong:= ord(key);    
    CASE huong OF
      80:inc(y[i]); {di xuong}
      72:dec(y[i]); {di len}
      77:inc(x[i]); {qua phai}
      75:dec(x[i]);  
    END;
END;
BEGIN
    clrscr;
    sodot:=5;
    checkdie(x[1], y[1], sodot);
    tuong;
    khoitao;
    WHILE checkdie(x[1], y[1], sodot)= FALSE DO
    ranchay;
    delay(200);
    readln;
END.



