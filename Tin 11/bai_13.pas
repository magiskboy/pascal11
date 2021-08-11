program bai_13;
uses crt;
var a,b,i,c: word;
key: char;
begin
  while key<>#27 do
  begin
  clrscr;
  write('Nhap a: '); readln(a);
  write('Nhap b: '); readln(b);
  for i:= a to b do
     if i mod 2=0 then
     begin
       inc(c);
       write(i, ' ');
     end;
  writeln;
  writeln('So cac so chan la: ',c);
  write('MUON THOAT NHAN PHIM ESC');
  key:= readkey;
  end;
end.
