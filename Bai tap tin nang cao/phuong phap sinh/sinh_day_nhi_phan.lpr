program sinh_day_nhi_phan;
type
  arrint= array[1..100] of byte;
var
  a: arrint;
  n,j: byte;
  f: text;
  c: integer;
procedure input;
begin
  write('Nhap n: '); readln(n);
end;
procedure ghinghiem(x: arrint);
var i: byte;
begin
  for i:= 1 to n do write(f,x[i]);
  writeln(f);
end;
function find: integer;
var i: byte;
begin
  for i:=n downto 1 do
  if a[i]=0 then exit(i);
  exit(-1);
end;
begin
  assign(f,'Binary.data');
  rewrite(f);
  input;
  for j:= 1 to n do a[j]:=0;  //cau hinh ban dau 0000....
  repeat
    ghinghiem(a);  //ghi nghiem
    c:=find;       //lay vi tri gia tri 0
    if c>0 then    //neu co...
    begin
      a[c]:=1;     //chuyen thanh 1
      for j:= c+1 to n do a[j]:=0;  //cac gia tri sau thanh 0
    end;
  until c=-1;   //dieu kien het cau hinh
  close(f);
  write('Complete');
  readln;
end.

