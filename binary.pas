PROGRAM binnary;
VAR binary: STRING;
    s,x,y:LONGINT;
    k:BYTE;
    co: CHAR;
FUNCTION cmp(a,b:STRING):INTEGER;
BEGIN
    WHILE length(a)> length(b) DO a:='0'+a;
    WHILE length(a)< length(b) DO b:='0'+b;
    IF a=b THEN exit(0);
    IF a<>b THEN exit(1);
    exit(-1);
END;
FUNCTION add(a,b:STRING):STRING;
VAR sum,carry,i,x,y:INTEGER;
    c:STRING;
BEGIN
     carry:=0; c:='';
     WHILE length(a)<>length(b) DO
         BEGIN
             IF length(a)<length(b) THEN a:= '0'+a;{cho 2 so co ki tu bang nhau}
             IF length(a)>length(b) THEN b:='0'+b;
         END;
         FOR i:=length(a) DOWNTO 1 DO
         BEGIN
            x:= ord(a[i])-48;
            y:= ord(b[i])-48;
            sum:=x+y+carry;
            carry:= sum DIV 10;
            c:=CHAR(sum MOD 10 +48)+c;
         END;
         IF carry>0 THEN c:='1'+c;
         add:=c;
END;
FUNCTION multiply(a,b:STRING):STRING;
VAR sum,tmp:STRING;
    m,i,j:INTEGER;
BEGIN
     m:=-1; sum:='';
     FOR i:= length(a) DOWNTO 1 DO
     BEGIN
        m:=m+1;
        tmp:='';
        FOR j:= 1 TO (ord(a[i])-48)DO tmp:=add(tmp,b);
        FOR j:= 1 TO m DO tmp:=tmp+'0';
        sum:=add(tmp,sum);
     END;
     multiply:=sum;
END;
FUNCTION mu(n: WORD):LONGINT;
VAR i: WORD;
    s:BYTE;                
BEGIN
    s:=1;
    IF n<> 0 THEN
    FOR i:= 1 TO n DO
    s:=s*2;
    mu:= s;
END;
BEGIN
    co:='n';    
    WHILE co='n' DO
    BEGIN
    s:=0;
    readln;
    writeln('Nhap he co so 2 ');
    readln(binary);
    FOR k:= 0 TO length(binary) DO
    BEGIN
        x:= ord(binary[length(binary)-k])-48;
        y:= x*mu(k);
        s:= s+y;
    END;
    writeln('Gia tri co so 10 la:',s);
    writeln('Ki tu the hien la:',chr(s));
    readln;
    writeln('Muon thoat thi an y');read(co);
    END;
END.

    
