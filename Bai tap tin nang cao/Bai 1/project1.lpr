program project1;
var
  bin,hex: string;
  dec: integer;
function luythua2(a: byte): integer;
begin
  if a=1 then exit(2)
  else luythua2:=2*luythua2(a-1);
end;

function bin2dec(st: string): integer;
var i,tmp: integer;
begin
  tmp:=0;
    for i:= 1 to length(st) do
      begin
      tmp:=tmp+((ord(st[i])-48)*(luythua2(length(st)-i)));
      end;
    writeln(tmp);
    bin2dec:=tmp;
end;
function dec2hex(s: integer): string;
var tmp: string;
  k,c: integer;
begin
  k:=s;
  tmp:='';
  while k<>0 do
  begin
       c:=k mod 16;
       if c<10 then tmp:=chr(c+48)+tmp
       else
         case c of
         10: tmp:='A'+tmp;
         11: tmp:='B'+tmp;
         12: tmp:='C'+tmp;
         13: tmp:='D'+tmp;
         14: tmp:='E'+tmp;
         15: tmp:='F'+tmp;
         end;
       k:=k div 16;
  end;
  dec2hex:= tmp;
end;
begin
  write('Nhap xau bin: '); readln(bin);
  dec:=bin2dec(bin);
  hex:=dec2hex(dec);
  write('Ma HEX la: ',hex);
  readln;
end.

