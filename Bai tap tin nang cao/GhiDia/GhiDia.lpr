{Bước 1: sắp xếp danh sách file theo thứ tự tăng dần nhưng vẫn giữ chỉ số ban dầu trong biến Item.id
 Bước 2: trong khi vẫn còn file chưa ghi thì
         - tăng số lượng đĩa
         - biến con trỏ chỉ về 1, dể duyệt từ đầu danh sách
         - trong khi chưa hết file, chưa duyệt hết, dung lượng trống lón hơn file có kích thước nhỏ nhất thì:
                + nếu file đó nhỏ hơn dung lượng đĩa trống thì di chuyển
                + ngược lại tăng biến con trỏ
 * thủ tục di chuyển file:
         + tăng số lượng file ghi trên đĩa
         + ghi id file đó ra danh sách file trên đĩa
         + giảm dung lượng đĩa trống
         + xóa file đó ra khỏi danh sách (sử dụng thao tác xóa trên dữ liệu kiểu danh sách)
         + giam số lượng file chưa ghi}
program GhiDia;
const
  fi='GhiDia.inp';
  fo='GhiDia.out';
  nmax=50000;
type
  TDisk= record
    sum: integer; //số file ghi trên dĩa
    space: word; //tổng dung lượng đĩa
    ItemIndex: array[1..nmax] of integer; //danh sách file
  end;
  TFile= record
    id: integer;  //mã số file
    size: word;  //kích thước file
  end;

  ArrDisk= array[1..50000] of TDisk;
var
  Disk: ArrDisk;
  count: integer; //số đĩa cần dùng
  f: text;
  s: integer; //số file càn ghi
  Item: array[1..nmax] of TFile; //danh sách file cần ghi
  d: word; //dung lượng đĩa cho phép
  sum_place: word;
  muc_sd: real;
  tmp_s: longint;
procedure final;
var i: integer;
begin
  for i:= 1 to tmp_s do sum_place:=sum_place+Disk[i].Space;
  muc_sd:=((sum_place/(d*tmp_s))*100);
end;

procedure input;
var i: integer;
begin
  assign(f,fi);
  reset(f);
  read(f,s,d);
  readln(f);
  for i:= 1 to s do
  begin
    read(f,Item[i].Size);
    Item[i].id:=i;;
  end;
  close(f);
end;
procedure output;
var i,j: integer;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,'Can it nhat ',count,' dia');
  for i:= 1 to count do
  begin
    write(f,'Dia ',i,': ');
    for j:= 1 to Disk[i].sum do write(f,Disk[i].ItemIndex[j],' ');
    writeln(f);
    writeln(f,'         Con trong: ',Disk[i].Space);
  end;
  write(f,'Dung luong hao phi ',muc_sd:2:2,' %');
  close(f);
end;
procedure sort(c,d: integer);
var i,j,tmpId: integer;
  x,tmpSize: longint;
begin
  i:=c; j:=d;
  x:=Item[random(d-c+1)+c].Size;
  while Item[i].Size>x do inc(i);
  while Item[j].Size<x do dec(j);
  if i<=j then
  begin
       tmpId:=Item[i].id;
       tmpSize:=Item[i].Size;
       Item[i].id:=Item[j].id;
       Item[i].Size:= Item[j].Size;
       Item[j].id:=tmpId;
       Item[j].Size:=tmpSize;
       inc(i);
       dec(j);
  end;
  if c<j then sort(c,j);
  if d>i then sort(i,d);
end;
procedure init;
var i: integer;
begin
  for i:= 1 to 100 do Disk[i].Space:=d;
  count:=0;
  tmp_s:=s;
end;

procedure MoveFile(l: integer);
var p: integer;
begin
  inc(Disk[count].sum); //tăng số file trên đĩa
  Disk[count].ItemIndex[Disk[count].sum]:=Item[l].id;
  Disk[count].space:=Disk[count].space-Item[l].Size;  //giảm dung lượng đĩa
//******************************************************************************
  for p:= l to s-1 do
  begin
    Item[p].id:=Item[p+1].id;
    Item[p].Size:=Item[p+1].Size;
  end;
  dec(s); //giảm số lượng file chưa ghi
end;
procedure GhiDia;
var i: longint;
begin
  while s>0 do  //còn file chưa ghi...
  begin
    inc(count);
    i:=1;    //khởi tạo con trỏ trỏ vào đầu danh sách
    while (Disk[count].Space> Item[s].Size) and (s>0) and (i<=s) do   //dung lượng đĩa trống còn nhỏ hơn file nhỏ nhất
    begin
      if Item[i].Size<Disk[count].Space then MoveFile(i) //nếu ghi một file=> giảm số file chưa ghi thì không càn tăng biến con trỏ cũng tự trỏ đến phần tử tiếp theo
      else
      inc(i); //nếu không sẽ trỏ đến phần tử tiếp theo
    end;
  end;
end;
procedure BubbleSort;
var tmpId,tmpSize: integer;
  i,j: integer;
begin
  for i:= 1 to s-1 do
  for j:= i+1 to s do
  if Item[i].Size<Item[j].Size then
  begin
      tmpId:=Item[i].id;
       tmpSize:=Item[i].Size;
       Item[i].id:=Item[j].id;
       Item[i].Size:= Item[j].Size;
       Item[j].id:=tmpId;
       Item[j].Size:=tmpSize;
  end;
end;
procedure run;
begin
  randomize;
  writeln('Reading List File ...     ');
  input;   //đọc dữ liệu
  writeln('Initing ...     ');
  init;   //khởi tạo các giá trị
  writeln('Sorting...');
  Sort(1,s); //sắp xếp giảm dần
  writeln('Processing...');
  GhiDia;  //chọn cách ghi
  writeln('Writing data...');
  final; //tong ket
  output;  //xuất dữ liệu
  writeln('Mission Complete');
  writeln('Dung luong hao phi ',muc_sd:2:2,'%');
  readln;
end;
begin
  run;
end.

