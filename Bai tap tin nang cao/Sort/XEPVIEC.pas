program XEPVIEC;
const fi= 'XEPVIEC.INP';
  fo= 'XEPVIEC.OUT';
  EL=#13#10;
var a,t,id,h: array[1..100] of integer;  {t: tien thuong   a: thoi gian nop   id: so thu tu uu tien so tien       h: so thu tu uu tien de bai}
    n: integer;
    sum_time,sum_money: integer;
    i,M: integer;
procedure read_data;       {doc du lieu}
var f: text;
    i: byte;
begin
     assign(f,fi);
     reset(f);
     readln(f,n);
     for i:= 1 to n do readln(f,a[i],t[i]);
     close(f);
end;
procedure write_data;          {ghi du lieu}
var f: text;
    i: byte;
begin
     assign(f,fo);
     rewrite(f);
     write(f,sum_time,EL,sum_money,EL);
     for i:= 1 to n do write(f,h[i],EL);
     close(f);
end;
procedure SortID(c,d: integer);       {sap xep id theo chieu giam so tien}
var i,j,tmp,x: integer;
begin
     i:=c; j:=d;
     x:=t[id[(i+j) div 2]];
     while t[id[i]]>x do inc(i);
     while t[id[j]]<x do dec(j);
     if i<=j then
     begin
          tmp:=id[i];
          id[i]:=id[j];
          id[j]:= tmp;
          inc(i);
          dec(j);
     end;
     if c<j then SortID(c,j);
     if i<d then SortID(i,d);
end;
procedure InitID;     {khoi tao gia tri id}
var i: byte;
begin
     for i:= 1 to n do id[i]:=i;
end;
function max_time: integer;  {thoi gian nop muon nhat  co the}
var i: byte;
    tmp: integer;
begin
     tmp:=a[1];
     for i:= 1 to n do if a[i]>tmp then tmp:=a[i];
     max_time:=tmp;
end;

procedure process;
var i: integer;
begin
     for i:= 1 to n do
     begin
          if h[a[id[i]]]=0 then   {tranh ghi trung cong viec}
          begin
             h[a[id[i]]]:= id[i];
             id[i]:=-id[i];
          end;
     end;
end;
procedure donviec;
var i: byte;
begin
     sum_time:=1;
     for i:= 1 to max_time do
     if h[i]<>0 then
        sum_money:=sum_money+t[h[i]]
     else
     if M=0 then M:=i;
     for i:= M+1 to max_time do
     if h[i]<>0 then
     begin
        h[M]:=h[i];
        h[i]:=0;
        inc(M);
     end;
     for i:= 1 to max_time do if h[i]>0 then inc(sum_time);
     for i:= 1 to n do if id[i]>0 then
     begin
        h[M]:=id[i];
        inc(M);
        if M > max_time then exit;
     end;
end;
begin
  read_data;
  InitID;
  SortID(1,n);
  process;
  donviec;
  write_data;
  writeln('HOAN THANH NHIEM VU');
  readln;
end.

