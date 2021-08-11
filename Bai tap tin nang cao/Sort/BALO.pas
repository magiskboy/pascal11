program BALO;
const fi='BALO.INP';
  fo='BALO.OUT';
var N,M,MT,i, sum_v: integer;
  d,v,id,dt: array[1..100] of integer;
procedure read_data;
var f: text;
  i: integer;
begin
  assign(f,fi);
  reset(f);
  readln(f,N,M);
  for i:= 1 to N do readln(f,d[i],v[i]);
  close(f);
end;
procedure write_data;
var f: text;
  i: integer;
begin
     assign(f,fo);
     rewrite(f);
     for i:= 1 to N do writeln(f,dt[i]);
     write(f,sum_v);
     close(f);
end;
procedure InitID;
var i: byte;
begin
       for i:= 1 to N do id[i]:=i;
end;
procedure SortID(c,d: integer);
var i,j,tmp,x: integer;
begin
     i:=c; j:=d; x:=v[id[(i+j) div 2]];
     while v[id[i]]>x do inc(i);
     while v[id[j]]<x do dec(j);
     if i<=j then
     begin
       tmp:= id[i];
       id[i]:=id[j];
       id[j]:=tmp;
       inc(i);
       dec(j);
     end;
     if c<j then SortID(c,j);
     if i<d then SortID(i,d);
end;
procedure process;
var i: integer;
begin
     i:=1;
     while MT<M do
     begin
       if d[id[i]]=0 then inc(i);
       inc(MT);
       dec(d[id[i]]);
       inc(dt[id[i]]);
     end;
     for i:= 1 to n do sum_v:=sum_v+v[i]*dt[i];
end;
begin
    read_data;
    InitID;
    SortID(1,N);
    process;
    write_data;
    writeln('HOAN THANH NHIEM VU');
    readln;
end.

