PROGRAM xephau;
CONST n=8;
TYPE vector= ARRAY[1..n] OF LONGINT;
VAR cot:ARRAY[1..n] OF LONGINT;
    cheochinh: ARRAY[1-n..n-1] OF LONGINT;
    cheophu: ARRAY[1+1..n+n] OF LONGINT;
    x: vector;
PROCEDURE ghinghiem(x: vector);
VAR i: LONGINT;
BEGIN
    FOR i:= 1 TO n DO write(' ',i);
    writeln;
END;
PROCEDURE xepHau(k: LONGINT);
VAR i: LONGINT;
BEGIN
    FOR i:= 1 TO n DO
    IF (cot[i]=0) AND (cheochinh[k-i]= 0) AND (cheophu[k+i]= 0) THEN
    BEGIN
        x[k]:= i;
        cot[i]:=1;
        cheochinh[k-i]:= 1;
        cheophu[k+i]:= 1;
        IF k=n THEN ghinghiem(x) ELSE xepHau(k+1);
        cot[i]:= 0;
        cheochinh[k-i]:= 0;
        cheophu[k+i]:= 0;
    END;
END;
BEGIN
    fillchar(cot, sizeof(cot), 0);
    fillchar(cheochinh, sizeof(cheochinh), 0);
    fillchar(cheophu, sizeof(cheophu), 0);
    xepHau(1);
    readln;
END.
