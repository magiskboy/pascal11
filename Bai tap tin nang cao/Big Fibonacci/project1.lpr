program project1;
uses sysutils;
var n,i: int64;
  fi: array[0..1000] of string;
function add(m,n: string): string;
var a,b,c:string;
  x,y,z,nho: integer;
  i: integer;
begin
  a:=m;
  b:=n;
  c:='';
  nho:=0;
  while length(a)<length(b) do a:='0'+a;
  while length(a)>length(b) do b:='0'+b;
  for i:= length(a) downto 1 do
  begin
     x:=strtoint(a[i]);
     y:=strtoint(b[i]);
     z:=x+y;
     c:=inttostr((z mod 10)+nho)+c;
     nho:=0;
     if z>9 then nho:=1;
  end;
  exit(c);
end;
function F(k: integer): string;
begin
  if k<2 then exit(fi[k])
  else
    if fi[k]<>'' then exit(fi[k])
    else
      begin
        fi[k]:=add(F(k-1),F(k-2));
        exit(fi[k]);
      end;
end;
begin
    fi[0]:='1';
    fi[1]:='1';
    write('Nhap n: '); readln(n);
    write(F(n));
    readln;
end.

