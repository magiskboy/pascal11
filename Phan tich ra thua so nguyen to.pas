{$M 16384, 0, 655360} {$F+} {$O+} {$G+} {$R+} {$S+} {$I+} {$Q+} {$V+} {$B+} {$X+} {$T+} {$P+} {$N+} {$E+} 
PROGRAM phantichrathuasonguyento; 
VAR s,i:LONGINT;
FUNCTION bigdiv(a:STRING; b:LONGINT):STRING;
VAR s,i,hold:LONGINT;
    c:STRING;
BEGIN      
    hold:=0; s:=0; c:='';
    FOR i:=1 TO length(a) DO
    BEGIN
        hold:=hold *10+ord(a[i])-48;
        s:=hold DIV b;
        hold:=hold MOD b;
        c:= c+chr(s+48);
    END;
    WHILE (length(c)>1) AND (c[1]='0') DO
    bigdiv:=c;
END;        
BEGIN    
    writeln('Nhap so nguyen duong S: ');
    readln(s);
    writeln('s=');
    i:=2;
    WHILE s<>1 DO
    BEGIN
        WHILE s MOD i=0 DO
        BEGIN
        write('',i,'*');
        s:=s DIV i;
        END;
        inc(i);
    END;
    readln;
END.