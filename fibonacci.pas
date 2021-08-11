program Project1;
uses crt;
var n,i: word;
    f: array[1..10000] of longword;
    k: char;
begin
  repeat
  clrscr;
  write('Nhap so n '); read(n);
  f[1]:=0;
  f[2]:=1;
  for i:=3 to n do
  begin
    f[i]:=f[i-1]+f[i-2];
    write('',f[i],' ');
  end;
  readln;
  k:=readkey;
  until k=#27;
end.
      