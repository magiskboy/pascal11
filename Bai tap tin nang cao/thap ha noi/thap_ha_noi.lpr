program thap_ha_noi;
var n: byte;
  f: text;
procedure move(n,x,y: byte);
begin
  if n=1 then writeln(f,'Chuyen dia tu ',x,' sang ',y)
  else
    begin
      move(n-1,x,6-x-y);
      move(1,x,y);
      move(n-1,6-x-y,y);
    end;
end;
begin
  assign(f,'output.txt');
  rewrite(f);
  write('Nhap n: '); readln(n);
  move(n,1,3);
  close(f);
  write('Complete');
  readln;
end.

