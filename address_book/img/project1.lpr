program project1;
var x: array[0..10] of byte;
    n: byte;
    k: byte;
procedure ghinghiem(x: array [0..10] of byte;);
var i: byte;
  begin
    writeln;
    for i:= 1 to k do write(' ',x[i]);
  end;
procedure backtrack(i: byte);
var j: byte;
  begin
    for j:=1 to n do
    begin
      x[i]:=j;
      if i=k then ghinghiem(x)
      else backtrack(i+1);
    end;
  end;
begin
  write('Nhap n ');
  read(n);
  writeln('Nhap k ');
  read(k);
  backtrack(1);
  readln;
end.

