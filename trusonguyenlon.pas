PROGRAM trusonguyenlon;
VAR a,b,s:STRING;
    x,y:BYTE;
    nho,i:BYTE;
    key:STRING[4];
BEGIN
WHILE key<>'exit' DO
BEGIN
    readln;
    writeln('Nhap_so_nguyen_lon_a='); readln(a);
    writeln('Nhap_so_nguyen_lon_b='); readln(b);
    nho:=0;
    WHILE length(a)<>length(b) DO
    BEGIN
        IF length(a)<length(b) THEN a:= '0'+a;
        IF length(a)>length(b) THEN b:='0'+b;
    END;
    writeln(a);
    writeln(b);
    readln;
    FOR i:= length(a) DOWNTO 1 DO
    BEGIN
        x:= ord(a[i])-ord(b[i])-nho;
        IF x< 0 THEN
        BEGIN
            x:= x+10;
            nho:=1;
        END;
        IF x>= 0 THEN
        nho:=0;
        s:=CHAR(x+48)+s;
    END;
    write(s);
    readln;
    delete(s,1,length(s));
    writeln('Go_exit_de_thoat'); read(key);
    END;
END.

