program project1;
uses crt;
var t,x,y: integer;
  k: char;
begin
  while k<>#27 do
  begin
  clrscr;
  x:=1;
  y:=0;
  write('Nhap t: '); readln(t);
  if ( (t mod 4=1) or (t mod 4=0)) and (t mod 2=1) then begin y:=t+1; x:=0; end
  else
  if ( (t mod 4=2) or (t mod 4=3)) and (t mod 2=1) then begin y:=(t+1)*(-1); x:=0;end
  else
  if ( (t mod 4=1) or (t mod 4=0)) and (t mod 2=0) then begin x:=t+1; y:=0; end
  else
  if ( (t mod 4=2) or (t mod 4=3)) and (t mod 2=0) then begin x:=(t+1)*(-1); y:= 0; end;
  write('',x,', ',y);
  k:=readkey;
  end;
end.

