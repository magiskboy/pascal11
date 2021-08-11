PROGRAM hethongdenmau;
CONST max=10000; 
VAR den:ARRAY [1..max] OF INTEGER;
    k,i,n,j,m,z,blue,red:BYTE;
    key:STRING[4];
BEGIN
WHILE key<>'exit' DO
BEGIN
    readln;
    blue:=0;
    red:=0;    
    writeln('Nhap_vao_so_bong_den'); read(n);
    writeln('Nhap_vao_so_chuong_trinh'); read(k);
    FOR i:= 1 TO n DO
    den[i]:=0;
    FOR i:= 2 TO k DO
    FOR j:= 2 TO n DO
    BEGIN
        m:=j MOD i;
        IF m= 0 THEN
        BEGIN
            IF den[j]=0 THEN den[j]:=1;
            IF den[j]=1 THEN den[j]:=0;
        END;
    END;
    FOR i:= 1 TO n DO
    BEGIN
        IF den[i]=0 THEN blue:=blue+1;
        IF den[i]=1 THEN red:=red+1;
    END;
    writeln('Co_tong_so_den_xanh_la_',blue);
    writeln('Co_tong_so_den_do_la_',red);
    readln;
    readln;
    writeln('Go_exit_de_thoat'); read(key);
    END;    
END.

    
    
         
        
    