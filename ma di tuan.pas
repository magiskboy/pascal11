TYPE vector = ARRAY[0..100] OF BYTE;
VAR x: vector; 
    y: vector;
    k: LONGINT;
    f: TEXT;
PROCEDURE ghinghiem(x,y: vector);
VAR i: BYTE;
BEGIN
    FOR i:= 1 TO k DO
    write(f,'(',x[i],',',y[i],')');
    k:=0;
    writeln(f);
END;
PROCEDURE backtrack(i: LONGINT);
VAR m,n,k: LONGINT;
BEGIN
    FOR m:= -2 TO 2 DO
    FOR n:= m+1 TO 3 DO
    BEGIN
        x[i]:=x[i-1]+m;
        y[i]:=y[i-1]+n; 
        inc(k);
        IF ((x[i]>8) AND (y[i]>9) )THEN ghinghiem(x,y)
        ELSE backtrack(i+1);
        x[i]:=x[i-1];
        y[i]:=y[i-1]
    END;
END;
BEGIN
    assign(f, 'text.txt');
    rewrite(f);
    x[0]:=0;
    y[0]:=0;
    backtrack(1);
    close(f);
    readln;
END.