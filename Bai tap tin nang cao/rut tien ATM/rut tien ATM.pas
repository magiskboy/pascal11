CONST max= 20;
      fi= 'ATM.inp';
      fo= 'ATM.out';
TYPE vector= ARRAY[1..max] OF LONGINT;
VAR t: ARRAY[1..max] OF LONGINT;
    x, xs: vector;
    n, s, sum: LONGINT;
    ok: BOOLEAN;
PROCEDURE input;
VAR f: TEXT;
    i: LONGINT;
BEGIN
    assign(f,fi);
    reset(f);
    readln(f,n,s);
    FOR i:= 1 TO n DO
    read(f,t[i]);
    close(f);
END;
PROCEDURE check(x: vector);
VAR f: TEXT;
    i: LONGINT;
BEGIN
    IF sum= s THEN 
    BEGIN
        xs:=x;
        ok:= TRUE;
    END;
END;
PROCEDURE printResult;
VAR f: TEXT;
    i: LONGINT;
BEGIN
    assign(f, fo);
    rewrite(f);
    IF ok THEN 
    BEGIN
        FOR i:=1 TO n DO
        IF xs[i]=1 THEN write(f,t[i],' ');
    END ELSE write(f,'-1');
    close(f);
END;        
PROCEDURE backtrack(i: LONGINT);
VAR j: LONGINT;
BEGIN
    FOR j:= 0 TO 1 DO
    BEGIN
        x[i]:= j;
        sum:=sum+x[i]*t[i];
        IF i=n THEN check(x) 
        ELSE IF sum<= s THEN backtrack(i+1);
        IF ok THEN exit;
        sum:=sum-x[i]*t[i];
    END;
END;
BEGIN
    input;
    ok:= FALSE;
    sum:= 0;
    backtrack(1);
    printResult;
    readln;
END.
        
