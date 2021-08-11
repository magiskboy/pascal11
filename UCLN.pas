PROGRAM UCLN;
VAR A,B,BC,M,N: integer;
BEGIN
 write('NHAP_SO_A');READLN(A);M:=A;
 write('NHAP_SO_B');READLN(B);N:=B;
 WHILE A<>B DO
 BEGIN
    IF A<B THEN B:=B-A;
    IF A>B THEN A:=A-B;
 END;
 BC:=((M*N)/A);
 WRITELN('UCLN_LA',A);
 WRITELN('BCNN_LA_',BC);
 readln;
END.
