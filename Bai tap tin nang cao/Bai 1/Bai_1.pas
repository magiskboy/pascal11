program Bai_1;
var n:longint;
  a,b,c,cv: longint;
begin
  write('Nhap n: ') ;readln(n);
  c:=trunc(sqrt(n));
  if sqr(c)=n then
  begin
    a:=c;
    b:=c;
    cv:=2*(a+b);
  end
  else
  begin
    if c*(c+1)>=n then
    begin
      a:=c;
      b:=c+1;
      cv:=2*(a+b);
    end
    else
    begin
      a:=c+1;
      b:=c+1;
      cv:=4*a;
    end;
  end;
  write('Kich thuoc: ',a,' x ',b,'. Chu vi: ',cv);
  readln;
end.

