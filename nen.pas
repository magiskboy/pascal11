PROGRAM nenfile;
VAR input,output,temp: TEXT;
    s,i,j:1..10000;
    kitu:CHAR;
    a: ARRAY [1..10000] OF CHAR;    
BEGIN
    assign(input,'C:\Users\KhacThanh\Desktop\input.txt');
    reset(input);
    assign(output,'C:\Users\KhacThanh\Desktop\output.txt');
    rewrite(output); 
    assign(temp,'C:\Users\KhacThanh\Desktop\temp.txt');
    rewrite(temp);
    i:=1;
    WHILE NOT eof(input) DO
    WHILE NOT eoln(input) DO
    BEGIN
         read(a[i]);
         inc(i);
    END;
    FOR j:= 1 TO i DO
    BEGIN
        IF a[j]=a[j+1] THEN inc(ord(a[j]));
        write(temp,a[j]);write(temp,'_');
        write(temp,
    
    
    
         
    
    
    
    
        