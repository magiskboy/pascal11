PROGRAM he2_16;
VAR he_2: STRING;
    he_16: STRING;
    f: TEXT;
    i,j,s,temp: BYTE;
    st: ARRAY[1..1000] OF STRING; 
FUNCTION luythua(a,b:BYTE):BYTE;
VAR tich: BYTE;
k: INTEGER;
BEGIN
    FOR k:= 0 TO a-1 DO
    tich:=tich*b;
    luythua:=tich;
END;
BEGIN
    j:= 1;
    writeln('nhap gia tri he co so 2: ');
    readln(he_2);
    s:= length(he_2);
    FOR i:= 1 TO s DIV 4 DO
    BEGIN
        st[i]:= copy(he_2,j,4);
        j:=j+4;
    END;
    writeln(st[1]);
    FOR i:= 1 TO s DIV 4 DO
    BEGIN
        FOR j:= 2 TO 3 DO
        BEGIN
            temp:=temp+2*luythua(j,ord(st[i,j])-48);
        END;
        
        writeln('',temp);
    END;
    readln;
END.
