program fi_quy_hoach_dong;
var s: array[1..255] of int64;
  n: byte;
  key: char;
function fi(i: byte): int64;    //thuat toan quy hoach dong
begin
  if s[i]=-1 then
  begin
    if i<=2 then
    begin
      fi:=1;
      s[i]:=1;
    end
    else if i>2 then
    begin
      fi:=fi(i-1)+fi(i-2);
      s[i]:=fi;
    end;
  end
  else if s[i]<>-1 then fi:=s[i];
end;
function fi_old(i: byte): int64;    //thuat toan de qui
begin
    if i<=2 then fi_old:=1
    else if i>2 then fi_old:=fi_old(i-1)+fi_old(i-2);
end;
procedure init;
begin
  fillchar(s,sizeof(s),-1);
end;
begin
  repeat
  write('Nhap n: '); readln(n);
  if n>100 then writeln('So qua lon')
  else
  begin
  init;
  writeln(fi(n));
  readln;
  writeln(fi_old(n));
  end;
  until key=#27;
end.

