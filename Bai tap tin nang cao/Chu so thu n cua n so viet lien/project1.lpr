program project1;
uses sysutils;
var
  n,i: int64;
  st,c: string;
begin
  write('Nhap n: '); readln(n);
  i:=0;
  while length(st)<n do
  begin
    inc(i);
    c:=inttostr(i);
    st:=st+c;
  end;
  write(st[n]);
  readln;
end.

