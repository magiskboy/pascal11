program bai_16;
uses crt;
var  a,n,s: word;
  k: byte;
  key: char;
begin
  while key<>#27 do
  begin
  clrscr;
  write('Nhap n: '); readln(n);
  s:=1;
  while s<= n do
begin
  s:=s*3;
  inc(k);
end;
  writeln('So k: ',k);
  write('MUON THOAT NHAN PHIM ESC');
  key:= readkey;
  end;
end.
