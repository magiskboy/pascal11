program project1;
const
  fi='DAUNGOAC.INP';
  fo='DAUNGOAC.OUT';
  nmax=20;
var
  n,count,level: byte;
  f: text;
  x: array[1..2*nmax] of byte;
  nghiem: array[1..255] of string;
procedure input;
begin
  assign(f,fi);
  reset(f);
  read(f,n,level);
  close(f);
end;
procedure output;
var
  j: byte;
begin
  assign(f,fo);
  rewrite(f);
  for j:= 2 to count do writeln(f,nghiem[j]); //nhan xet:
  close(f);         //ta luon luon co xau dau khong hop le do tinh doi xung => co do sau la level+1 nen bat dau viet tu xau thu 2
end;                // ((...()...))
function check_level: boolean; forward;
procedure ghinghiem;
var
  t: byte;
begin
  if check_level then
  begin
       inc(count);
       for t:= 1 to n do
       if x[t]=0 then nghiem[count]:=nghiem[count]+'('
       else nghiem[count]:=nghiem[count]+')';
  end;
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
  if (i=n) and (c<>0) then exit(false);
end;
function check_level: boolean;
var
  l: byte;
  t1,t2: boolean;
begin
  t1:=true;
  t2:= true;
  for l:= 1 to level-1 do
  if x[l]<>x[l+1] then
     begin
       t1:=false;
       break;
     end;
  for l:=n downto n-level+2 do
  if x[l]<>x[l-1]then
     begin
       t2:=false;
       break;
     end;
  if (t1 and t2) or (t1 or t2) then check_level:=true
  else check_level:=false;
end;
procedure backing(i: byte);
var
  j: byte;
begin
  for j:= 0 to 1 do
  begin
       x[i]:=j;
       if check(i) then
          if i=n then
             ghinghiem
          else backing(i+1);
  end;
end;
procedure run;
begin
  input;
  //writeln(level);
  if (n mod 2 =0) then
     begin
          backing(1);
          output;
          write('Mission Complete'#13#10);
     end
  else write('Error: ',n,' mod 2=1');
  readln;
end;
begin
  run;
end.

