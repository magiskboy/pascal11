//ý tưởng: dùng tổ hợp dể tính tất cả các giá trị mà mảng a có thể tạo thành
//đánh dấu các giá trị đó
//tìm min,max tổng được tạo thành
//xét từ min đến max xem có giá trị nào chuwa bị đánh dấu thì lấy giá trị đó
// nếu không có, lấy mã làm kết quả cần tìm.
program project1;
const nmax=100;
  dmax=100000000;
  fi='4.8.INP';
  fo='4.8.OUT';
var d: array[1..dmax] of longint;  //danh dau cac so co the phan tich duoc
  a: array[1..nmax] of longint;    //mang a ban dau
  id: array[1..200] of byte;  //id[i] mang gia tri vi tri trong mang a
  n,v: byte;                  // i mang gia tri vi tri trong tap nghiem
  min,max,k,s,i: longint;
  kq: longint=-1;
procedure input;
var f: text;
  i: byte;
begin
  assign(f,fi);
  reset(f);
  readln(f,n);
  for i:= 1 to n do read(f,a[i]);
  close(f);
end;
procedure output;
var  f: text;
begin
  assign(f,fo);
  rewrite(f);
  write(f,kq);
  close(f);
end;
procedure tohopchap(i: byte);
var j: byte;
begin                                        //id[i-1]+1 la phep toan
  for j:= id[i-1]+1 to n-k+i do             //lay vi tri cua gia tri dung sau id[i-1]
  begin
  id[i]:=j;
  if i=k then
  begin
     for v:= 1 to k do s:=s+a[id[v]];
     d[s]:=1;    //writeln('   ',s);
     s:=0;
  end
  else
  tohopchap(i+1);
  end;
end;
begin
  writeln('BEGIN');
  writeln('LOADING');
  input;
  for k:=1 to n do
  begin
    tohopchap(1);
    //writeln('Xong chap ',k);
  end;
  for i:= 1 to n do max:=max+a[i];
  min:=a[1];
  for i:= 2 to n do
    if min>a[i] then min:=a[i];
  for i:= min to max do
  if d[i]=0 then
  begin
    kq:=i;
    break;
  end;
  if kq=-1 then kq:=max+1;
  output;
  write('END');
  readln;
end.

