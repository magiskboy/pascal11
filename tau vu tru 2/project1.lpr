program project1;
uses crt;
var t,x,y,k,a,m,n: integer;
  key: char;
   sthang: extended;
begin
  while key<>#27 do
  begin
  clrscr;
  write('t='); readln(t);
  a:=0;
  x:=1;
  y:=0;
  sthang:=0;
  m:=-1;
  n:=1;
  while sthang< t do
begin
  k:=k*(-1);
  if x=0 then
  begin
    a:=(abs(y)+1)*m;
    x:=a;
    y:=0;
    m:=m*(-1);
  end
  else
  if y=0 then
  begin
    a:=(abs(x)+1)*n;
    y:=a;
    x:=0;
    n:=n*(-1);
  end;
  inc(k);
  sthang:=((abs(a)*(abs(a)-1))/2); { thoi gian chay sang vi tri tiep theo}
end;
  Write('So thang can di=',sthang:0:0,', (',x,',',y,')');
  key:= readkey;
  end;
end.

