program project1;
const fi= '4.5.INP';
  fo='4.5.OUT';
  nmax=10;
var n,k: byte;
  a: array[1..nmax] of integer;
  b: array[1..nmax,1..nmax] of integer;
  i,j: byte;
  hs,s,s_0,s_hs: byte;
procedure input;
var f: text;
  i: byte;
begin
  assign(f,fi);
  reset(f);
  read(f,n);
  readln(f,k);
  for i:= 1 to n do read(f,a[i]);
  close(f);
end;
procedure ghinghiem;
var i,j: byte;
  f: text;
begin
  assign(f,fo);
  rewrite(f);
  for i:= 1 to k do
  begin
  for j:=1 to 2 do
    write(f,b[i,j]);
  writeln(f);
  end;
  close(f);
end;
procedure sort;
var i,j: byte;
    t: integer;
begin
  for i:= 1 to n-1 do
  for j:=i+1 to n do
  if a[i]>a[j] then
  begin
    t:=a[i];
    a[j]:=a[i];
    a[j]:=t;
  end;
end;
function init: boolean;
var i: byte;
begin
  init:=true;
  sort;
  for i:= 1 to n do if a[i]=0 then inc(s_0); //liet ke so ptu 0
  for i:= s_0+1 to n do a[i-s_0]:=a[i];      //don gia tri
  n:=n-s_0;
  for i:= 1 to n do s:=s+a[i];               //tinh tong
  if s mod  k<>0 then exit(false);           //dieu kien vi pham
  hs:=s div k;                               //tinh hang so
  for i:= n to 1 do
  begin
  if a[i]>hs then exit(false);
  if a[i]=hs then inc(s_hs)
  else break;
  end;
end;
begin
  input;
  if init then
  begin
    for i:= 1 to (n div 2)+1 do
    b[i,i]:=a[i];
    b[i,n-i+1]:=a[n-i+1];
  end;
  writeln(hs);
  writeln(n);
  for i:= 1 to (n div 2)+1 do
  begin
  for j:= 1 to 2 do write(b[i,j]:3);
  writeln;
  end;
  readln;
end.

