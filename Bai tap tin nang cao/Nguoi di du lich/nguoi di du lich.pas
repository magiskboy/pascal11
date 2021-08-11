CONST max= 20;
      oo= 1000000;
      fi= 'TSP.INP';
      fo= 'TSP.OUT';
VAR c: ARRAY[1..max, 1..max] OF LONGINT;
    x, bestsolution: ARRAY[1..max] OF LONGINT;
    d: ARRAY[1..max] OF LONGINT;
    n: LONGINT;
    sum, best: LONGINT;
PROCEDURE input;
VAR f: TEXT;
    i, j, k: LONGINT;
BEGIN
    assign(f,fi);
    reset(f);
    read(f,n);
    FOR i:= 1 TO n DO
    FOR j:= 1 TO n DO read(f,c[i,j]);
    close(f);
END;
PROCEDURE update;
BEGIN
    IF sum+ c[x[n],x[1]]<best THEN 
    BEGIN
        best:=sum+ c[x[n],x[1]];
        bestsolution:= x;
    END;
END;
PROCEDURE brandbound(i: LONGINT);
VAR j: LONGINT;
BEGIN
    IF sum>= best THEN exit;
    FOR j:= 1 TO n DO
    IF d[j]=0 THEN
    BEGIN
        x[i]:= j;
        d[j]:= 1; 
        sum:= sum+c[x[i-1], j];
        IF i= n THEN update ELSE brandbound(i+1);
        sum:= sum-c[x[i-1], j];
        d[j]:=0;
    END;
END;
PROCEDURE init;
BEGIN
    d[1]:= 1;
    x[1]:= 1;
    best:=oo;
END;
PROCEDURE output;
VAR f: TEXT;
    i: LONGINT;
BEGIN
    assign(f,fo);
    rewrite(f);
    writeln(f,best);
    FOR i:= 1 TO n DO write(f,bestsolution[i],'-->');
    write(f, bestsolution[1]);
    close(f);
END;
BEGIN
    input;
    init;
    brandbound(2);
    output;
    readln;
END.
    
    
        