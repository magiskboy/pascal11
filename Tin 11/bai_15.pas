program bai_15;
uses crt;
var  a,n: word;
  k: byte;
  key: char;
begin
while key<>#27 do
  begin
  clrscr;
  write('Nhap n: '); readln(n);
  a:=n;
  write('So nhi phan cua ',n,' la: ');
  while a<>0 do
begin
  k:=a mod 2;
  write('',k);
  a:=a div 2;
end;
  writeln;
  write('MUON THOAT NHAN PHIM ESC');
  key:= readkey;
  end;
end.
