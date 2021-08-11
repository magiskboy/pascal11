PROGRAM xephau2;
TYPE vector = ARRAY[1..100] OF LONGINT;
VAR x: vector;
    j: LONGINT;
    f: TEXT;
    s: LONGINT;
PROCEDURE ghinghiem(x: vector);
VAR i: LONGINT;
BEGIN
    write(f,' ',j,', ');
    FOR i:= 1 TO s DO write(f,' ',x[i]);
    inc(j);
    writeln(f);
END;
PROCEDURE xephau(k: LONGINT);
VAR sk: ARRAY[1..100] OF LONGINT;
    xk, i,nsk: LONGINT;
    ok: BOOLEAN;
BEGIN
    nsk:=0;
    FOR xk:= 1 TO s DO
    BEGIN
    ok:= TRUE;
    FOR i:= 1 TO k-1 DO
    IF NOT((xk<>x[i]) AND (k-xk<>i-x[i]) AND (k+xk<>i+x[i])) THEN
    BEGIN
        ok:= FALSE;
        break;
    END;
    IF ok THEN 
    BEGIN
        inc(nsk);
        sk[nsk]:= xk;
    END;
    END;
    FOR i:= 1 TO nsk DO
    BEGIN
        x[k]:=sk[i];
        IF k=s THEN ghinghiem(x) ELSE xephau(k+1);
        x[k]:=0;
    END;
END;
BEGIN
    assign(f,'f.txt');
    rewrite(f);
    writeln(' Nhap so cot ban co');
    readln(s); 
    j:=1;
    xephau(1);
    close(f);
    writeln(' OK. Xong roi day');
    readln;
END.

    
