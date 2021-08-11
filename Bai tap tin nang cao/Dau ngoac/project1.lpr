program project1;
const
  fi='DAUNGOAC.INP';
  fo='DAUNGOAC.OUT';
  nmax=20;
var
  n,count: byte;
  f: text;
  x: array[1..2*nmax] of byte;
  nghiem: array[1..255] of string;
procedure input;
begin
  assign(f,fi);
  reset(f);
  read(f,n);
  close(f);
end;
procedure output;
var
  j: byte;
begin
  assign(f,fo);
  rewrite(f);
  for j:= 1 to count do writeln(f,nghiem[j]);
  close(f);
end;
procedure ghinghiem;
var
  t: byte;
begin
  inc(count);
  for t:= 1 to 2*n do
  if x[t]=0 then nghiem[count]:=nghiem[count]+'('
  else nghiem[count]:=nghiem[count]+')'
end;
function check(i: byte): boolean;
var
  t: byte;
  c: shortint=0;
begin
  check:=true;
  for t:= 1 to i do
  begin
  if x[t]=0 then inc(c)
  else dec(c);
  if c<0 then exit(false);
  end;
  if (i=2*n) and (c<>0) then exit(false);
end;
procedure backing(i: byte);
var
  j: byte;
begin
  for j:= 0 to 1 do
  begin
       x[i]:=j;
       if check(i) then
          if i=2*n then ghinghiem
          else backing(i+1);
  end;
end;
begin
  input;
  backing(1);
  output;
  write('Mission Complete');
  readln;
end.

