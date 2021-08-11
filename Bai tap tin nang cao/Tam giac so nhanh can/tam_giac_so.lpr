program tam_giac_so;
var f: text;
  n,i: integer;
  a:array[1..1000,1..1000] of integer;
  Way,x: array[1..1000] of integer;
  tmp,s: longint;
procedure input;
var i,j: integer;
begin
  assign(f,'text.txt');
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
begin
  assign(f,'out.txt');
  rewrite(f);
  write(f,s);
  close(f);
end;
procedure update;
begin
  way:=x;
  s:=tmp;
end;

procedure backing(i: integer);
var j: integer;
begin
  for j:= x[i-1] to x[i-1]+1 do
  begin
       x[i]:=j;
       tmp:=tmp*a[i,j];

       if tmp<s then
       begin
         if i=n then
         begin
           update;
           //tmp:=tmp div a[i,j];
         end
         else
         backing(i+1);
         tmp:=tmp div a[i,j];
       end
       else
       begin
         tmp:=tmp div a[i,j];
       end;
  end;
end;
procedure init;
begin
  tmp:=1;
  s:=27000;
  x[1]:=1;
end;
begin
    input;
    init;
    backing(2);
    output;
    for i:= 1 to n do write(a[i,way[i]],', ');
    writeln;
    write(s);
    readln;
end.

