program bai_17;
uses crt;
var a,n,k,s: word;
  key: char;
begin
  while key<>#27 do
  begin
  clrscr;
  write('Nhap n: ');
  readln(n);
  a:=n;
  while a<>0 do
begin
  k:=a mod 10;
  s:=S+sqr(k);
  a:= a div 10;
end;
  writeln(' Tong do la: ',s);
  write('MUON THOAT NHAN PHIM ESC');
  key:= readkey;
  end;
end.
