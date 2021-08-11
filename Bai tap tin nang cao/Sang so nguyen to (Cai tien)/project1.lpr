program sang_snt;
var a: array[1..10000] of boolean;
  i,j,n: integer;
begin
  write('Nhap n: '); readln(n);
  fillchar(a,sizeof(a),true);
  a[1]:=false;
  for i:= 2 to (n div 2) do
  for j:= i to  (n div i) do
  a[i*j]:=false;

  for i:= 1 to n do
  if a[i]=true then write(i:3);
  readln;
end.

