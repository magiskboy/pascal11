program maphuong;
uses crt;
var n,i,j,k: longint;
  a: array[0..1000, 0..1000] of longint;
  b: array[0..1000, 0..1000] of string[10];
  kc, max: byte;
  kt1, kt2: boolean;
  key: char;
  f: text;
function toado(i,j: longint): boolean;   {kt1}
begin
if (i=n+1) or (j=0) then toado:=true else toado:=false;
end;
function chuongngaivat(i,j: longint): boolean;  {kt2}
begin
if a[i,j]<> 0 then chuongngaivat:=true else chuongngaivat:=false;
end;
begin
  repeat
  clrscr;
  for j:= 1 to n do
  for i:=1 to n do
  begin
  a[i,j]:=0;
  b[i,j]:='';
  end;
  max:=0; kc:=0;
  n:=0;
  while (n<3) or (n mod 2=0) do
  begin
  clrscr;
  write('Nhap n >3 la so le: ');
  readln(n);
  end;
  i:=trunc(n/2)+1;
  j:=1;
  a[i,j]:=1;
  for k:= 2 to sqr(n) do
  begin
    inc(i);
    dec(j);
    kt1:= toado(i,j);
    kt2:=chuongngaivat(i,j);
    if ((i=n+1) and (j= 0)) then
    begin
      dec(i);
      j:=2;
      a[i,j]:=k;
    end
    else
      if kt1=true then
      begin
        if j=0 then
        begin
        j:=n;
        a[i,j]:=k;
      end
      else
      if i=n+1 then
      begin
        i:=1;
        a[i,j]:=k;
      end
      end
      else
        if kt2=true then
        begin
          dec(i);
          j:= j+2;
          a[i,j]:=k;
        end
      else
       if kt2= false then
      a[i,j]:=k
  else a[i,j]:=k;
      end;
  for j:= 1 to n do
    for i:=1 to n do
       STR(a[i,j],b[i,j]);
  for j:= 1 to n do
    for i:=1 to n do
      if length(b[i,j])>max then max:=length(b[i,j]);
  assign(f,'maphuong.txt');
  rewrite(f);
  for j:= 1 to n do
  begin
    for i:=1 to n do
    begin
      write(b[i,j]);
      write(f,b[i,j]);
      for kc:=1 to max-length(b[i,j])+1 do begin write(' '); write(f,' ');end;
    end;
    writeln;
    writeln(f);
    end;
  close(f);
  key:=readkey;
  until key=#27;
end.
