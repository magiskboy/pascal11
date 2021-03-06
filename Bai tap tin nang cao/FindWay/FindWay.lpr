program FindWay;
const
  fi='FindWay.inp';
  fo='FindWay.out';
  nmax=100;
var
  n,s,t,mark: integer;
  a: array[1..nmax,1..nmax] of integer;
  c,tmp,d: array[1..100] of byte;
  count,k: byte;
  f: text;
  i,j: byte;
procedure input;
var i,j: byte;
begin
  assign(f,fi);
  reset(f);
  read(f,n,s,t);
  readln(f);
  for i:= 1 to n do
  begin
    for j:= 1 to n do
    if i=j then a[i,j]:=1
    else
    if a[j,i]<>-1 then a[i,j]:=a[j,i]
    else read(f,a[i,j]);
    readln(f);
  end;
  close(f);
end;
procedure output;
var i: byte;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,count);
  for i:= 1 to count do write(f,c[i],' ');
  close(f);
end;
procedure update;
var
  i: byte;
begin
  count:=k;
  for i:= 1 to count do c[i]:=tmp[i];
  dec(k);                                    inc(mark);
end;
procedure init;
begin
  fillchar(d,sizeof(d),0);
  c[1]:=s;
  d[s]:=1;
  count:=10000;
  k:=1;
  tmp[1]:=s;
end;
procedure find(i: byte);
var j: byte;
begin
  for j:=1 to n do
  if d[j]=0 then
  if (a[tmp[i-1],j]=1) or (a[j,tmp[i-1]]=1 )then
  begin
    tmp[i]:=j;
    inc(k);
    if tmp[i]=t then update
    else find(i+1);
    dec(k);
    d[j]:=0;
  end;
end;
begin
  fillchar(a,sizeof(a),-1);
  input;
  for i:= 1 to n do
  begin
  for j:= 1 to n do write(a[i,j]:2);
  writeln;
  end;
  init;
  find(2);
  output;
  writeln('Complete    ',mark);
  readln;
end.

