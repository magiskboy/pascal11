program project1;
uses sysutils;
const
  fi='CHENTOANTU.INP';
  fo='CHENTOANTU.OUT';
  nmax=20;
var
  f: text;
  timthay: boolean=false;
  tmp: array[1..100] of byte;
  toantu: array[1..100,1..100] of byte;
  m,count: byte;
  s: string;
  sum: integer=0;
  c,l: longint;
procedure input;
begin
  assign(f,fi);
  reset(f);
  read(f,s);
  close(f);
  write('Nhap so M: '); readln(m);
end;
procedure output;
var
  i,j: byte;
begin
  for i:= 1 to count do
  begin
  for j:= 1 to length(s) do
  if toantu[i,j]=0 then write('-'+s[j])
  else write('+'+s[j]);
  writeln;
  end;
end;
procedure ghinghiem;
var i,j: byte;
begin
  assign(f,fo);
  rewrite(f);
  for i:= 1 to count do
  begin
  for j:= 1 to length(s) do write(f,toantu[i,j],' ');
  writeln(f);
  end;
  close(f);
end;

procedure backing(i: byte);
var
  j: byte;
begin
  for j:= 0 to 1 do
  begin
    tmp[i]:=j;
    if tmp[i]=0 then sum:=sum- strtoint(s[i])
    else if tmp[i]=1 then sum:=sum+ strtoint(s[i]);
//******************************************************************************
    if ((i=length(s)) and (sum=m)) then
    begin
      inc(count);
      toantu[count]:=tmp;
    end
    else if ((i=length(s)) and (sum<>m)) then
    begin
    if j=0 then begin sum:=sum+ strtoint(s[i]); tmp[i]:=0; end
    else if j=1 then begin sum:=sum- strtoint(s[i]); tmp[i]:=0; end
    end
    else if i<length(s) then backing(i+1);
  end;
end;
begin
  input;  //writeln(length(s));
  //write(s); readln;
  backing(1);
  output;
  ghinghiem;
  write(count);
  readln;
end.

