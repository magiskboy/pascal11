PROGRAM thuattoanquaylui;
TYPE vector= ARRAY[1..26] OF CHAR;
VAR x: vector; 
    d: ARRAY[1..32] OF BYTE;
    f: TEXT;
PROCEDURE ghinghiem(x: vector);
VAR i: BYTE;
BEGIN
    FOR i:= 1 TO 10 DO
        write(f,x[i]+' ');
        writeln(f);
END;
PROCEDURE backtrack(i: BYTE);
VAR j: BYTE;
BEGIN
    FOR j:= 1 TO 10 DO 
    IF d[j]= 0 THEN       
    BEGIN 
        x[i]:=chr(j+96); 
        d[j]:=1;
    IF i= 10 THEN ghinghiem(x)
    ELSE backtrack(i+1);
    d[j]:=0; 
    END;
END;
BEGIN 
    assign(f, 'text.txt');
    rewrite(f);
backtrack(1);
close(f);
readln;    
END.

