program UCLN;    //thuat toan de qui
var a,b: int64;   //thuat toan toi uu do khong co cac phep tinh lap lai
function UCLN(a,b: int64):int64;
begin
  if b=0 then exit(a)
  else exit(UCLN(b,a mod b));
end;
begin
  write('Nhap a: '); readln(a);
  write('Nhap b: '); readln(b);
  write(UCLN(a,b));
  readln;
end.

