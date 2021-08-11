PROGRAM he16;
VAR input, output: TEXT;
    kitu: CHAR;
    i,j: WORD;
    xau: STRING[50];
FUNCTION xuli(a: CHAR):STRING; { Ham xu li ki tung ki tu, nhap vao la mot ki tu trong ma ASCII, tra ve ham la mot xau ma hexa}
VAR y: WORD;
    c: CHAR;
    x: WORD;
BEGIN
    xau:='';
    x:= ord(a);
    WHILE x<> 0 DO
    BEGIN { Chia lay du giua so thu tu cua ki tu cho 16}
    y:= x MOD 16;
    IF (y<>10) AND (y<> 11) AND (y<>12) AND (y<>13) AND (y<>14) AND (y<>15) THEN c:=chr(y+48);
    IF y=10 THEN c:='A';
    IF y=11 THEN c:='B';
    IF y=12 THEN c:='C';
    IF y=13 THEN c:='D';
    IF y=14 THEN c:='E';
    IF y=15 THEN c:='F';    
    xau:=c+ xau;
    x:=x DIV 16;
    END;
    xuli:=xau;
END;        
BEGIN
    assign(input,'in.dta');
    reset(input);         
    assign(output,'out.dta');
    rewrite(output);
    write('BAT DAU');
    WHILE NOT eof(input) DO
    BEGIN { Nhap va xu li du lieu bang ham "xuli"}
        read(input,kitu);
        write(kitu);
        xau:=xuli(kitu);
        write(output,xau);
        write(output,'_');
    END;
    writeln(' Ket thuc');
    close(input);
    close(output);
    readln;
END.
    
            

    