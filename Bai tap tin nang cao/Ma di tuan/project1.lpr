program project1;
const
  dx: array[1..8] of shortint=(-1,-2,-2,-1,1,2,2,1);
  dy: array[1..8] of shortint=(-2,-1,1,2,2,1,-1,-2);
  max=100000;
  maxn=10;
  maxnn=maxn*maxn;
  fi='MADITUAN.INP';
  fo='MADITUAN.OUT';
type
  TSTEP=record
    x,y: array[1..maxnn] of shortint;
  end;

var
  f: text;
  n,count: word;
  d: array[1..maxn,1..maxnn] of byte;
  tmpx,tmpy: array[1..maxnn] of shortint;
  buoc: array[1..max] of TStep;
procedure input;
begin
  assign(f,fi);
  reset(f);
  read(f,n);
  close(f);
end;
procedure output;
var i,j: word;
begin
  assign(f,fo);
  rewrite(f);
  for i:= 1 to count do
  begin
  for j:= 1 to sqr(n)-1 do
  write(f,'(',buoc[i].x[j],',',buoc[i].y[j],')-> ');   write(f,'(',buoc[i].x[sqr(n)],',',buoc[i].y[sqr(n)],')');
  writeln(f);
  end;
  close(f);
end;
procedure ghinghiem;
var
  l: word;
begin
  inc(count);
  for l:= 1 to sqr(n) do
  begin
       buoc[count].x[l]:=tmpx[l];
       buoc[count].y[l]:=tmpy[l];
  end;
end;

procedure init;
begin
     tmpx[1]:=1;
     tmpy[1]:=1;
     d[1,1]:=1;
     count:=0;
end;
procedure find(i: byte);
var j: byte;
begin
  for j:= 1 to 8 do
  begin
  tmpx[i]:=tmpx[i-1]+dx[j];
  tmpy[i]:=tmpy[i-1]+dy[j];
  if (tmpx[i]>0) and (tmpx[i]<=n) and (tmpy[i]>0) and (tmpy[i]<=n) then
  if d[tmpx[i],tmpy[i]]=0 then
  begin
    if i=sqr(n) then   ghinghiem
    else
      begin
        d[tmpx[i],tmpy[i]]:=1;
        find(i+1);
      end;
    d[tmpx[i],tmpy[i]]:=0;
  end;
  end;
end;
procedure run;
begin
  input;
  init;
  find(2);
  output;
  writeln('Mission Complete');
  writeln('Bai toan co ',count,' nghiem.');
  readln;
end;
begin
  run;
end.

