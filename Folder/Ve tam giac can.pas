uses crt;
var n,i,j,k: byte;
key: char;
begin
while key<> chr(27) do
begin
clrscr;
Writeln('nhap n:'); read(n);
for i:= 1 to n do
begin
gotoxy(41-i,i);
for k:= 1 to 2*i-1 do write('*');
end;
 key:= readkey;
 end;
end.