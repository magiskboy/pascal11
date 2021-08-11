program project1;
const fi= 'TAMGIACSO.INP';
  fo= 'TAMGIACSO.OUT';
  nmax=101;
var n: byte;
    a:array[1..nmax,1..nmax] of integer;
    length_max: integer=0;
    id: array[1..nmax] of byte;
    tmp: integer=1;
procedure input;
var f: text;
    i,j: byte;
begin
     assign(f,fi);
     reset(f);
     readln(f,n);
     for i:= 1 to n do
     begin
          for j:= 1 to i do read(f,a[i,j]);
          readln(f);
     end;
     close(f);
end;
procedure output;
var f: text;
begin
     assign(f,fo);
     rewrite(f);
     write(f,length_max);
     close(f);
end;

procedure backing(i: byte);
var j: byte;
    k: byte;
begin
  for j:= id[i-1]  to id[i-1]+1 do
  begin
  id[i]:=j;
  if i=n then
  begin
    for k:= 1 to n do tmp:=tmp*a[k,id[k]];
    if tmp>length_max then length_max:=tmp;
    tmp:=1;
  end
  else backing(i+1);
end;
end;
begin
  input;
  id[1]:=1;
  backing(2);
  output;
  writeln('Mission Complete');
  write('Press Enter to Exit');
  readln;
end.

