program day_tang;
var f: text;
  n,i: byte;
  a,T,L: array[0..100] of integer;
procedure input;
var i: byte;
begin
  assign(f,'text.txt');
  reset(f);
  readln(f,n);
  for i:= 1 to n do read(f,a[i]);
  close(f);
end;
procedure xuli;
var i,j,jmax: integer;
begin
    a[0]:=-32768;
    a[n+1]:=32767;
    L[n+1]:=1;
    for i:= n downto 0 do
    begin
      jmax:=n+1;
      for j:= i+1 to n+1 do
      if (a[i]<a[j]) and (L[j]>L[jmax]) then jmax:=j;
      T[i]:=jmax;
      L[i]:=L[jmax]+1;
    end;
end;
begin
  input;
  for i:= 1 to n do write(i:3);
  writeln;
  for i:= 1 to n do write(a[i]:3);
  writeln;
  xuli;
  for i:= 1 to n do write(L[i]:3);
  writeln;
  for i:= 1 to n do write(T[i]:3);
  writeln;
  i:=T[0];
  while i<>n+1 do
  begin
    write(i:3);
    i:=T[i];
  end;
  readln;
end.

