program project1;
uses crt;
var a,d: longint;
  k: integer;
  i: integer;
  s: word;
  f: text;
begin
  assign(f,'GhiDia.inp');
  rewrite(f);
  randomize;
  write('Nhap so file: '); readln(s);
  write('Nhap so dung luong dia: '); readln(d);
  write(f,s,' ',d);
  writeln(f);
  for i:=1 to s do
  begin
    k:=random(255);
    a:=10*k;
    write(f,a,' ');
  end;
  close(f);
  write('OK');
  readln;
end.

