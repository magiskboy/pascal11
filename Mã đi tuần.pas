TYPE vector = ARRAY[0..100] OF BYTE;
VAR x: vector; 
    y: vector;
    f: TEXT; 
    d: ARRAY[0..3,0..3] OF BOOLEAN; 
    k: LONGINT;
PROCEDURE ghinghiem(x,y: vector);
VAR i: BYTE;
BEGIN
    FOR i:= 0 TO k DO
    write(f,'(',x[i],',',y[i],')');
    k:=0;
    writeln(f);
END;
PROCEDURE backtrack(i: LONGINT);{Quay lui}
VAR m,n: LONGINT;
BEGIN
    FOR m:= 0 TO 3 DO {Cac gia tri x[i] co the nhan}
    FOR n:= 0 TO 3 DO {Cac gia tri y[i] co the nhan}
    IF ((abs(m-x[i-1])*abs(n-y[i-1])=2) AND (d[m,n]=FALSE)) THEN {Dieu kien de 2 vi tri dung cheo 2 o}
    BEGIN
        x[i]:=m; {x[i] nhan gia tri thoa man}
        y[i]:=n; {y[i] nhan gia tri thoa man}
        d[m,n]:=TRUE; {ham kiem tra de tranh chung lap vi tri cu}
        inc(k); {Dem so phan tu cua 1 nghiem}
        IF y[i]=3 THEN ghinghiem(x,y) {Neu den cuoi ban co thi ghi nghiem}
        ELSE backtrack(i+1); {Xet gia tri tiep theo}
        d[m,n]:= FALSE; {Go bo ham kiem tra}
    END;
END;
BEGIN
    assign(f, 'text.txt');
    rewrite(f);
    x[0]:=0;
    y[0]:=0;
    d[0,0]:=TRUE;
    backtrack(1);
    close(f);
    writeln('OK. DUOC ROI DAY');
    readln;
END.