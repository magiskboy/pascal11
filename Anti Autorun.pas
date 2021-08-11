PROGRAM find_autorun;
USES  DOS;
VAR dsk:ARRAY[1..26] OF CHAR;  {Ten cac' dia~ }
Au :ARRAY[1..maxint] OF CHAR; {Au: mang chua ki tu la noi dung autorun.inf}
Text1,Stringtest :STRING;
dem_auto : INTEGER;  {Slg. file autorun.inf}
luu_auto : ARRAY[1..26] OF STRING;  {mang? luu danh sach autorun}
key : CHAR; {khoa' tl muon' xoa' ko?}
PROCEDURE      read_autorun; {doc. no^j. dung file autorun.inf}
VAR              i,j,n:INTEGER;
f:TEXT;
BEGIN
Assign(f,Stringtest);
Reset(f);
i:=0; j:=0; n:=0;
WHILE NOT eof(f) DO
BEGIN
i:=0; n:=0;
WHILE NOT eoln(f) DO
BEGIN
i:=i+1;
Read(f,au[i]);
END;
n:= i;
FOR j:=1 TO n DO
Write(Au[j]);
Readln(f);
Writeln;
END;
Writeln;
END;
PROCEDURE    Dsk_autorun;
VAR          ii:INTEGER;
      f:TEXT;
BEGIN
dem_auto := 0;
FOR ii:=1 TO 24 DO
BEGIN
dsk[ii] := chr(64 + ii); {Danh sach dja~ A..Z}
Stringtest := dsk[ii] + ':/autorun.inf';
Assign(f,Stringtest);
{$I-} Reset(f); {$I+}
IF Ioresult = 0  THEN
BEGIN
inc(dem_auto);
Writeln('[-] ',Stringtest);
Read_autorun;
Luu_auto[dem_auto] := Stringtest;
END;
END;
END;
PROCEDURE          del_autorun;
VAR          f1:TEXT;
tt:INTEGER;
BEGIN
IF dem_auto > 0 THEN
FOR tt:=1 TO dem_auto DO
BEGIN
Assign(f1,luu_auto[tt]);
SetFattr(f1,0);  {Loai bo? thuoc tinh'' }
Erase(f1);  {Xoa' F1 >> autorun.inf}
END;
END;
BEGIN
Text1 :='==== Chuong trinh phat hien Autorun.inf [by Zzghostdragon94zZ] ====';
Write(text1);      Writeln;
Dsk_autorun;
IF dem_auto = 0 THEN
Writeln('Khong phat hien Autorun.inf')
ELSE
REPEAT
Writeln('Ban co muon xoa tat ca autorun.inf khong(Y/N)?');
Readln(key);
IF (Key = 'Y') OR (key= 'y') THEN
BEGIN
del_autorun;
Writeln('Da~ Xong!!! ');
key := 'n';
END;
UNTIL (key='N') OR (key= 'n');
Write('  PRESS ANY KEY TO EXIT  ');
Readln;
END.