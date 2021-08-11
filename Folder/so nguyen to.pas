program so_nguyen_to;
uses crt;
var i,j,c,n: word;
  check: boolean;
  key: char;
begin
  while key<>#27 do
  begin
  clrscr;
  write('Nhap n='); readln(n);
  c:=0;
  write('Cac so nguyen to tu 2 den ',n,' la: 2, 3 va ');
  For i:= 4 to n do
  begin
  for j:= 2 to round(sqrt(i)) do
    if i mod j=0 then
    begin
      check:=false;
      break;
    end;
    if check= true then
    begin
    inc(c);
    write(', ',i);
    end;
    check:=true;
  end;
  writeln;
  writeln('Co tat ca ',c+2,' so nguyen to');
  write('AN PHIM ESC DE THOAT');
  key:= readkey;
  end;
end.
