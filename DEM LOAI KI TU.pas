USES crt;
VAR f: TEXT;
    ch: CHAR;
    i: BYTE;
    a: ARRAY[1..63] OF WORD;
    k:BYTE;
BEGIN
    assign(f, 'Text.txt');
    reset(f);
    k:=48;
    WHILE NOT eof(f) DO 
    BEGIN
        IF eoln THEN readln(f)
        ELSE
        BEGIN
            ch:= read(f); 
            IF ch='a' THEN inc(a[1]);
            IF ch='b' THEN inc(a[2]);
            IF ch='c' THEN inc(a[3]);
            IF ch='d' THEN inc(a[4]);
            IF ch='e' THEN inc(a[5]);
            IF ch='f' THEN inc(a[6]);
            IF ch=' ' THEN inc(a[7]);
            IF ch='g' THEN inc(a[8]);
            IF ch='h' THEN inc(a[9]);
            IF ch='i' THEN inc(a[10]);
            IF ch='j' THEN inc(a[11]);
            IF ch='k' THEN inc(a[12]);
            IF ch='l' THEN inc(a[13]);
            IF ch='m' THEN inc(a[14]);
            IF ch='n' THEN inc(a[15]);
            IF ch='o' THEN inc(a[16]);
            IF ch='p' THEN inc(a[17]);
            IF ch='u' THEN inc(a[18]);
            IF ch='r' THEN inc(a[19]);
            IF ch='s' THEN inc(a[20]);
            IF ch='t' THEN inc(a[21]);
            IF ch='u' THEN inc(a[22]);
            IF ch='v' THEN inc(a[23]);
            IF ch='w' THEN inc(a[24]);
            IF ch='x' THEN inc(a[25]);
            IF ch='y' THEN inc(a[26]);
            IF ch='z' THEN inc(a[27]); 
            IF ch='A' THEN inc(a[28]);
            IF ch='B' THEN inc(a[29]);
            IF ch='C' THEN inc(a[30]);
            IF ch='D' THEN inc(a[31]);
            IF ch='E' THEN inc(a[32]);
            IF ch='F' THEN inc(a[33]);
            IF ch='G' THEN inc(a[34]);
            IF ch='H' THEN inc(a[35]);
            IF ch='I' THEN inc(a[36]);
            IF ch='J' THEN inc(a[37]);
            IF ch='K' THEN inc(a[38]);
            IF ch='L' THEN inc(a[39]);
            IF ch='M' THEN inc(a[40]);
            IF ch='N' THEN inc(a[41]);
            IF ch='O' THEN inc(a[42]);
            IF ch='P' THEN inc(a[43]);
            IF ch='U' THEN inc(a[44]);
            IF ch='R' THEN inc(a[45]);
            IF ch='S' THEN inc(a[46]);
            IF ch='T' THEN inc(a[47]);
            IF ch='U' THEN inc(a[48]);
            IF ch='V' THEN inc(a[49]);
            IF ch='W' THEN inc(a[50]);
            IF ch='X' THEN inc(a[51]);
            IF ch='Y' THEN inc(a[52]);
            IF ch='Z' THEN inc(a[53]);
            IF ch='1' THEN inc(a[54]);
            IF ch='2' THEN inc(a[55]);
            IF ch='3' THEN inc(a[56]);
            IF ch='4' THEN inc(a[57]);
            IF ch='5' THEN inc(a[58]);
            IF ch='6' THEN inc(a[59]);
            IF ch='7' THEN inc(a[60]);
            IF ch='8' THEN inc(a[61]);
            IF ch='9' THEN inc(a[62]);
            IF ch='0' THEN inc(a[63]);
        END;
    END;
    FOR i:=1 TO 63 DO
    BEGIN
        writeln('So ki tu '+ chr(inc(k)), a[i]);
    END;
    readln;
END.
            
            
            
            