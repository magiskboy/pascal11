USES crt;
VAR c: CHAR;
BEGIN
    WHILE TRUE DO
    BEGIN
        clrscr; 
        c:= readkey;
        writeln('Ki tu ma no the hien la '+ c);
        writeln('ma ASCII ma no the hien la ',ord(c));
        delay(2000);
    END;
END.