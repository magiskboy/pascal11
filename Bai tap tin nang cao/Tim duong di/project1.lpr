program project1;
const
  fi='TIMDUONG.INP';
  fo='TIMDUONG.OUT';
  nmax=255;
type
  ListLink= array[1..nmax] of  integer;   //chi phi di tu i den cac thanh pho khac
  TPlace= record
    //name: string[30];
    ListCity: ListLink;
    end;
var
  f: text;
  City:array[1..nmax] of TPlace;
  d: array[1..255] of byte;
  n,i: byte;
  step: byte;
  Way,x: array[1..255] of byte;
  City_From, City_To: byte;
  cost,tmp: word;
  //j: byte;
procedure LoadMap;
var
  i,j: byte;
begin
  assign(f,fi);
  reset(f);
  read(f,n,City_From, City_To);
  readln(f);
  for i:= 1 to n do
  begin
    //read(f,City[i].Name);
    for j:= 1 to n do read(f,City[i].ListCity[j]);
    readln(f);
  end;
  close(f);
end;
procedure PrintResult;
var
  i: byte;
begin
  assign(f,fo);
  rewrite(f);
  for i:= 1 to step-1 do write(f,way[i],'->');   write(f,way[step]);
  writeln(f);
  write(f,'Cost: ',cost);
  close(f);
end;
procedure init;
begin
  cost:=65000;
  fillchar(d,sizeof(d),0);
  d[City_From]:=1;
  x[1]:=City_From;
end;
procedure update;
var t: byte;
begin
  way:=x;
  cost:=tmp;
  step:=0;
  for t:= 1 to n do if way[t]<>0 then inc(step);
  tmp:=tmp-City[x[n-1]].ListCity[x[n]];
  d[x[i]]:=0;
end;
procedure Find(i: byte);
var
  j: byte;
begin
  for j:=1 to n do
  if d[j]=0 then
  if City[x[i-1]].ListCity[j]>-1 then
  begin
    tmp:=tmp+ City[x[i-1]].ListCity[j];
    x[i]:=j;
    if (tmp<cost) and (x[i]=City_To) then update
    else
      if (i=n) and (x[i]<>City_To) then exit
    else
      if (tmp<cost) and (i<n) then
      begin
        d[j]:=1;
        find(i+1);
        d[j]:=0;
        tmp:=tmp-City[x[i-1]].ListCity[j];
      end;
  end;
end;
procedure run;
begin
  LoadMap;
  init;
  find(2);
  PrintResult;
  writeln('Mission Complete');
  {for i:= 1 to n do
  begin
    write(City[i].Name,'   ');
    for j:= 1 to n do write(City[i].ListCity[j]:3);
    writeln;
  end;}
//******************************************************************************
  if cost=65000 then write('No way')
  else
  begin
  write(#10#13+'Cost: ',cost);
  writeln;
  for i:= 1 to step-1 do write(way[i],'-> ');
  write(way[step]);
  end;
end;
begin
  run;
  readln;
end.

