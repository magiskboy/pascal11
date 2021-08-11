PROGRAM thuattoansapxep;
VAR i,j,m: BYTE;
    temp:WORD;
    x:ARRAY [1..10000] OF WORD;
BEGIN
    writeln('can_bao_nhieu_so');read(m);
    FOR i:= 1 TO m DO
    BEGIN
        writeln('nhap_so_thu',i); read(x[i]);
    END;
    FOR i:= 2 TO m DO
    FOR j:= 1 TO m-1 DO
    BEGIN
        IF x[i]<x[j] THEN
        BEGIN
            temp:= x[i];
            x[i]:= x[j];
            x[j]:= temp;
        END;
    END;
    FOR i:= 1 TO m DO
    BEGIN
        writeln('so_thu_',i);
        writeln('la',x[i]);
        readln;
    END;
END.

    