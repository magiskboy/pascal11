{$IFDEF NORMAL}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF NORMAL}
{$IFDEF DEBUG}
  {$H-,I+,OBJECTCHECKS+,Q+,R+,S-}
{$ENDIF DEBUG}
{$IFDEF RELEASE}
  {$H-,I-,OBJECTCHECKS-,Q-,R-,S-}
{$ENDIF RELEASE}
TYPE vector= ARRAY[1..20] OF LONGINT;
VAR x: vector;
    n,k: LONGINT;
PROCEDURE ghinghiem(x: vector);
VAR i: LONGINT;
BEGIN
    FOR i:= 1 TO k DO
        write(x[i],' ');
        writeln;
END;
PROCEDURE tohop(i: LONGINT);
VAR j:LONGINT;
BEGIN
    FOR j:= 1 TO n DO
    BEGIN
        x[i]:=j;
        IF i=k THEN ghinghiem(x)
        ELSE tohop(i+1);
    END;
END;
BEGIN
    write('nhap so n ');
    read(n);
    writeln('Nhap so k');
    read(k);
    tohop(1);
    readln;
    readln;
END.
