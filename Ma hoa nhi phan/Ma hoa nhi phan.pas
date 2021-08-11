PROGRAM encode;
VAR input,output:TEXT;
    i:STRING;
    kitu:CHAR;
    x: BYTE;
FUNCTION xuli(ch:CHAR):STRING;
VAR temp:STRING;
    y:BYTE;
BEGIN
    temp:='';
    x:=ord(ch);
    WHILE x<> 0 DO
    BEGIN
    y:=0;
    y:=x MOD 2;
    y:=y+48;
    temp:=chr(y)+temp;
    x:=x DIV 2; 
    END;
    xuli:=temp;
END;
BEGIN
    write('Bat dau');      
    assign(input,'in.dta');
    reset(input);
    assign(output,'out.dta');
    rewrite(output);
    WHILE NOT eof(input) DO
        BEGIN
            read(input,kitu);
            i:=xuli(kitu);
            write(output,i);
            write(output,'_');
        END;
        writeln;
    writeln('OK.Ket thuc');
    readln;
    close(input);
    close(output);
END.

    
    
        

    