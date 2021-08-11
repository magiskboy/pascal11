program bai_17;
uses crt;
var i,n: word;
  x,d,a,b,fmax,fmin,fx: real;
  k: char;
begin
  while k<>#27 do
  begin
  clrscr;
  write('Nhap n: ');readln(n);
  write('Nhap a: ');readln(a);
  write('Nhap b: ');readln(b);
  Fmax:=5*sqr(sqr(a))+6*sqr(a)*a-4*sqr(a)+3*a-8;
  Fmin:=Fmax;
  For i:= 1 to n do
  begin
    x:=a+i*(b-a)/n;
    Fx:=5*sqr(sqr(x))+6*sqr(x)*a-4*sqr(x)+3*x-8;
    if Fx<Fmin then Fmin:=Fx;
    if Fx>Fmax then Fmax:=Fx;
  end;
  d:=Fmax-Fmin;
  writeln(' Bien do dao dong d= ',d:4);
  write('MUON THOAT NHAN PHIM ESC');
  k:= readkey;  
  end;
end.
