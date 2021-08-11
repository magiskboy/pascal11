program ngan_xep;
var
  s: string;
  f: text;
  dau,cuoi: array[1..10000] of integer;
  p,i,j,count: integer;
begin
  assign(f,'f.txt');
  reset(f);
  read(f,s);
  close(f);
  for i:= 1 to length(s) do
  begin
    if s[i]='(' then
    begin
      inc(p);    inc(count);
      dau[p]:=i;
    end
    else
    if s[i]=')' then
    begin
      cuoi[p]:=i;
      dec(p);
    end;
  end;

  writeln(s);
  if p<0 then writeln('Thieu dau (')
  else
    if p>0 then writeln('Thua dau (')
    else
      begin
        writeln('Co cac bieu thuc sau:');
        for i:= 1 to count do
        begin
          for j:= dau[i] to cuoi[i] do write(s[j]);
          writeln;
        end;
      end;
  write(count);
  readln;
end.

