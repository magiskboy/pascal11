const max=50;
var n, i,j: byte;
  a: array[1..max, 1..max] of integer;
  x, tmp_x, mark: array[1..max] of byte;
  f: text;
  tmp, bestSol: integer;
procedure init;
var i,j: byte;
begin
  assign(f,'DULICH.INP');
  reset(f);
  readln(f,n);
  for i:= 1 to n do
  begin
    for j:= 1 to n do read(f, a[i,j]);
    readln(f);
  end;
  for i:= 1 to n do mark[i]:=0;
  close(f);
  mark[1]:=1;
  bestSol:=10000;
  tmp_x[1]:=1;
  tmp:=0;
end;
procedure update;
var i: byte;
begin
  for i:= 1 to n do x[i]:=tmp_x[i];
  bestSol:=tmp+a[x[n],1];
end;
procedure next(i: byte);
var j: byte;
begin
  for j:= 2 to n do
  if (mark[j]=0) then
  if (tmp+a[tmp_x[i-1], j])< bestSol then
  begin
       tmp_x[i]:=j;
       tmp:= tmp+a[tmp_x[i-1], j];
       mark[j]:=1;
       if (i=n) then
       begin
            if ((tmp+ a[j,1])< bestSol) then update;
       end
       else if i<n then next(i+1);
       mark[j]:=0;
       tmp:= tmp-a[tmp_x[i-1], j];
  end;
end;
begin
  init;
  for i:= 1 to n do
  begin
       for j:= 1 to n do write(a[i,j]:3);
       writeln;
  end;
  next(2);
  writeln(bestSol);
  for j:= 1 to n do write(x[j]:2);
  readln;
end.

