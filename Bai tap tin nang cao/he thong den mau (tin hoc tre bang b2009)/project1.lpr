program project1;
const nmax=100000;
  fi='HETHONGDENMAU.INP';
  fo='HETHONGDENMAU.OUT';
var n,k: longint;
  den: array[1..nmax] of boolean;
  count: longint;
procedure input;
var f: text;
begin
  assign(f,fi);
  reset(f);
  read(f,n,k);
  close(f);
end;
procedure output;
var f: text;
begin
     assign(f,fo);
     rewrite(f);
     write(f,count);
     close(f);
end;
procedure xuli;
var i,j: longint;
begin
     for i:= 1 to k do
     for j:= 1 to n do
     if (j mod i=0) then den[j]:=not den[j];
     for i:= 1 to n do if den[i]=true then inc(count);
end;
begin
  input;
  xuli;
  output;
  readln;
end.

