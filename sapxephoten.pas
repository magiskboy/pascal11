PROGRAM sapxephoten;
VAR ten:ARRAY [1..20] OF STRING[30];
    i,j:BYTE;
    temp:STRING[30];
    s: BYTE;
    key:STRING[4];
BEGIN
WHILE key<>'exit' DO
BEGIN
    readln;    
    writeln('SAP_XEP_HO_TEN_THEO_BANG_CHU_CAI');
    writeln('Nhap_tong_so_nguoi=_'); read(s);
    FOR i:=1 TO s DO
    BEGIN
        writeln('Nhap_ho_ten_nguoi_thu_',i); readln(ten[i]);
    END;
    FOR i:=2 TO s DO 
    FOR j:=1 TO length(ten[i]) DO
    WHILE ten[i,j]=ten[i+1,j+1] DO
    IF ord(ten[i,j])>ord(ten[i+1,j+1]) THEN  
    BEGIN
        temp:= ten[i];
        ten[i]:=ten[i+1];
        ten[i+1]:=temp;
    END;      
    FOR i:=2 TO s DO
        writeln(ten[i]);
    writeln('Go_exit_de_thoat'); read(key);
    END;    
END.


