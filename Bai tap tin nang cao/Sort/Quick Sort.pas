var n,k: integer;
    a:array[1..10000000] of integer;
procedure sort(c,d: integer);
var x,t,i,j: integer;
begin
     i:=c;
     j:=d;
     x:=a[(i+j) div 2];
     while i<=j do
     begin
          while a[i]<x do inc(i);
          while a[j]>x do dec(j);
          if i<=j then
          begin
               t:=a[i];
               a[i]:=a[j];
               a[j]:=t;
               inc(i);
               dec(j);
          end;
     end;
     if c<j then sort(c,j);
     if i<d then sort(i,d);
end;
begin
     write('Nhap n: '); readln(n);
     randomize;
     for k:= 1 to n do a[k]:=random(255);
     writeln('Day a:');
     for k:= 1 to n do write(a[k]:4);
     writeln;
     sort(1,n);
     writeln('Day da sap xep:');
     for k:= 1 to n do write(a[k]:4);
     readln;
end.

