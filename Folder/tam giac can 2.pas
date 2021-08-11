uses crt;
var n,i,j,k,t: byte;
key: char;
begin
while key<> chr(27) do
begin
clrscr;
Writeln('nhap n:'); read(n);
for i:= 1 to n do
begin
j:=40-i;
gotoxy(40-i,i);
t:=i-1;
for k:= 1 to 2*i-1 do
begin
if (j<40) then
begin
inc(t);
inc(j);
t:=t mod 10;
write('',t);
end
else
if (j>=40) and (t<>0) then
begin
dec(t);
inc(j);
t:= t mod 10;
write('',t);
end
else
if (t=0) and (j>=40) then
begin
t:=9;
write('',t);
inc(j);
end;
end;
end;
 key:= readkey;
 end;
end.