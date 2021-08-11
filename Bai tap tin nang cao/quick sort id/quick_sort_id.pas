program quick_sort_id;
var a,id: array[1..1000000] of integer;
  n,j: integer;
procedure Sort(c,d: integer);
var i,j,tmp: integer;
  x: longint;
begin
  i:=c;
  j:=d;
  x:=a[id[(i+j) div 2]];
  while i<j do
  begin
  while a[id[i]]<x do inc(i);
  while a[id[j]]>x do dec(j);
  if i<=j then
  begin
      tmp:=id[i];
      id[i]:=id[j];
      id[j]:=tmp;
      inc(i);
      dec(j);
  end;
  if i<d then sort(i,d);
  if j>c then sort(c,j);
  end;
end;
begin
  randomize;
  write('Nhap n: '); readln(n);
  for j:=1 to n do
  begin
  a[j]:=random(100)-random(100);
  write(a[j]:5);
  id[j]:=j;
  end;
  writeln;
  sort(1,n);
  for j:= 1 to n do write(a[id[j]]:5);
  readln;
end.

