program CKN_QHD;
var C: array[0..10000,0..10000] of int64;
  i,j,k,n: integer;
begin
  write('Nhap n: '); readln(n);
  write('Nhap k: '); readln(k);

  for i:=0 to n do    //bai toan co so
  begin
    C[i,0]:=1;
    C[i,i]:=1;
  end;

  for i:= 1 to n do
  for j:= 1 to n do
  begin
    C[i,j]:=C[i-1,j-1]+C[i-1,j];     //cong thuc truy hoi
  end;

  write(C[n,k]);   //ket qua
  readln;
end.

