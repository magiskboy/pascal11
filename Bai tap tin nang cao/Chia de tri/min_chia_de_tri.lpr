program min_chia_de_tri;
var a,b: array[1..10000] of int64;
  n,k,c: int64;
procedure input;
var i: int64;
begin
  for i:= 1 to n do begin a[i]:=random(c)-random(c); b[i]:=a[i]; end;
end;
function min(i,j: int64): int64;
var t1,t2:int64;
begin
  if j>i then
  begin
  if j-i=1 then
  begin
    if a[i]>a[j] then min:=j
    else min:=i;
  end
  else
  begin
    t1:=min(i,(i+j) div 2);
    t2:=min(((i+j) div 2)+1,j);
    if a[t1]<=a[t2] then min:=t1
    else min:=t2;
  end;
  end;
end;
function min_old(i,j: int64):int64;
var tmp,tmpi,l: int64;
begin
  tmpi:=i;
  tmp:=b[i];
  for l:= i+1 to j do
  if tmp>b[l] then begin tmp:=b[l];  tmpi:=l; end;
  min_old:=tmpi;
end;
begin
  randomize;
  write('Nhap n: '); readln(n);
  write('Nhap c: '); readln(c);
  input;
  //for k:= 1 to n do write(a[k]:3);
  writeln;
  write(min(1,n),'   ',a[min(1,n)]);
  readln;
  write(min_old(1,n), '   ',b[min_old(1,n)]);
  readln;
end.

