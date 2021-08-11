USES crt , dos;
VAR f:FILE;
    SRec:searchrec;
    k:CHAR;
BEGIN
    REPEAT
    findfirst('*.EXE', anyfile, SRec);
    WHILE doserror=0 DO
    BEGIN
        WITH SRec DO
        BEGIN
            writeln('TEN FILE '+name);
            writeln('KICH THUOC(byte) ',size,' BYTE');
            writeln('THUOC TINH ',attr);
            writeln('DUONG DAN '+fexpand(Name));
            writeln(FSearch(Name, '.exe'));
        END;
        WRITELN;
        findnext(SRec);
    END;
    k:=readkey;
    UNTIL k=#27;
END.
