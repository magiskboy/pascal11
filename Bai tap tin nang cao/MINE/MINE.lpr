program MINE;
const
  dx: array[1..8] of shortint=(0,-1,-1,-1,0,1,1,1);
  dy: array[1..8] of shortint=(-1,-1,0,1,1,1,0,-1);
  fi='MINE.INP';
  fo='MINE.OUT';
  nmax=10;
var
  MINE_1,tmp_1: array[1..nmax,1..nmax] of integer;//ban do mat do
  MINE_2,tmp_2: array[1..nmax,1..nmax] of integer;//ban do vi tri
  m,n: byte;
  s: word;
  f: text;
procedure input;
var
  i,j: byte;
begin
  assign(f,fi);
  reset(f);
  read(f,m,n);
  for i:= 1 to m do
  begin
    for j:= 1 to n do read(f, MINE_1[j,i]);
    readln(f);
  end;
  close(f);
end;
procedure output;
var
  i,j: byte;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,s);
  for i:= 1 to m do
  begin
    for j:= 1 to n do write(MINE_2[j,i],' ');
    writeln(f);
  end;
  close(f);
end;
function check_dk(a,b: byte): boolean; //kiem tra xem xung quanh o (a,b) co du min chua ?
var
  i: byte;
begin
  check_dk:=true;
  if (a=1) or (b=1) then
  begin
    if (tmp_2[1,2]<>-1) or (tmp_2[2,2]<>-1) or (tmp_2[2,1]<>-1) then check_dk:=true
  end
  else
  if (a=1) or (b=n)then
  begin
  if (tmp_2[1,n-1]<>-1) or (tmp_2[2,n-1]<>-1) or (tmp_2[2,n]<>-1) then check_dk:=true;
  end
  else if (a=m) or (b=1) then
  begin
  if (tmp_2[m-1,1]<>-1) or (tmp_2[m-1,2]<>-1) or (tmp_2[m,2]<>-1) then check_dk:=true;
  end
  else
  if (a=m) or (b=n) then
  begin
  if (tmp_2[n-1,m]<>-1) or (tmp_2[n-1,m-1]<>-1) or (tmp_2[m-1,n]<>-1) then check_dk:=true;
  end
  else
  if a=1 then
  begin
       for i:= 3 to 7 do if tmp_2[a+dx[i],b+dy[i]]=-1 then exit(false)
  end
  else
  if a=m then
  begin
     for i:= 1 to 3 do if tmp_2[a+dx[i],b+dy[i]]=-1 then exit(false);
     for i:= 7 to 8 do if tmp_2[a+dx[i],b+dy[i]]=-1 then exit(false)
  end
  else
  if b=1 then
  begin
      for i:= 5 to 8 do if tmp_2[a+dx[i],b+dy[i]]=-1 then exit(false);
      if tmp_2[a+dx[1],b+dy[1]]=-1 then exit(false);
  end
  else
  if b=n then
  begin
      for i:= 1 to 5 do if tmp_2[a+dx[i],b+dy[i]]=-1 then exit(false);
  end
  else
  for i:= 1 to 8 do if tmp_2[a+dx[i],b+dy[i]]=-1 then exit(false);
end;
function check(x,y: byte): boolean;
begin

end;
begin
end.

