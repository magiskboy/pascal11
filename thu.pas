PROGRAM nenfile;
VAR input,output: TEXT;
    s,i,j:1..10000;
    kitu,temp:CHAR;
    a: ARRAY [0..10000] OF CHAR;    
BEGIN
    assign(input,'C:\Users\KhacThanh\Desktop\input.txt');
    reset(input);
    assign(output,'C:\Users\KhacThanh\Desktop\output.txt');
    rewrite(output);
    write('thanh');
    i:=0;
    write('',i);
    FOR i:= 1 TO 5 DO
    BEGIN
         write('thanh');
         read(a[i]);;
         write(a[i]);
    END;
    FOR j:= 1 TO i DO
    BEGIN
        IF ord(a[j])<ord(a[j+1]) THEN 
        BEGIN
            temp:= a[i];
            a[i]:=a[i+1];
            a[i+1]:=temp;
        END;
    END;
    FOR j:=1 TO i do
    begin
    write(a[j]);
    write(output,a[j]);
    END;
    close(input);
    close(output);
END.


            
    
    
    
         
    
    
    
    
        