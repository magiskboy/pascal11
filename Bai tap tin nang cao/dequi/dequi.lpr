program dequi;
function UCLN(a,b: word):word;
begin
  if a=b then UCLN:=a
  else
    if a<b then UCLN:=UCLN(a,b-a)
    else
      if a>b then UCLN:=UCLN(a-b,b);
end;
function CKN(n,k: word):word;
begin
  if k>n then CKN:=0
  else if (k=0) or (n=k) then CKN:=1
  else CKN:=CKN(n-1,k-1)+CKN(n-1,k);
end;
function fibonacci(n: word):longint;
begin
  if n<2 then fibonacci:=1
  else fibonacci:=fibonacci(n-1)+fibonacci(n-2);
end;
begin
  writeln(UCLN(5,3));
  writeln(CKN(10,5));
  writeln(fibonacci(5));
  readln;
end.

