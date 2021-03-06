program project1;
const
  fi='BS.INP';   //Binary Search
  fo='BS.OUT';
  nmax=5000;
var
  n: word;
  a: array[1..nmax] of longint;
  f: text;
  vitri: array[1..nmax] of word;
  count: word;
  k: longint;
  ok: boolean=false;
procedure input;
var i: word;
begin
  assign(f,fi);
  reset(f);
  read(f,n,k);
  readln(f);
  for i:=1 to n do read(f,a[i]);
  close(f);
end;
procedure output;
var i: byte;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,count);
  for i:= 1 to count do write(f,vitri[i]);
  close(f);
end;

procedure search(i,j: word);
var mid: word;
begin
  if (i<j) and (ok=false) then
  begin
    mid:=(i+j) div 2;
    if a[mid]=k then
    begin
      inc(count);
      vitri[count]:=mid;
      ok:=true;
      exit;
    end
    else
    if a[mid]<k then search(mid,j)
    else search(i,mid);
  end;
end;

begin
  input;
  search(1,n);
  output;
  readln;
end.

