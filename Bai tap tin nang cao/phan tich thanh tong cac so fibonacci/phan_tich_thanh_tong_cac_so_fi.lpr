program phan_tich_thanh_tong_cac_so_fi;
var
  n: integer;
  a: array[1..100] of integer;
  count,i: integer;
function fi(a: integer): integer;
var x,y,z:integer;
begin
  x:=1;
  y:=1;
  z:=0;
  while z<=a do
    begin
         z:=x+y;
         x:=y;
         y:=z;
    end;
  if z<=a then exit(z)
  else exit(x);
end;
procedure phan_tich(n: integer);
begin
  while n>0 do
    begin
         inc(count);
         a[count]:=fi(n);
         n:=n-a[count];
    end;
end;
begin
  count:=0;
  write('Nhap n: '); readln(n);
  phan_tich(n);
  write(n,'= ');
  for i:= 1 to count-1 do write(a[i],'+ ');
  write(a[count]);
  readln;
end.

