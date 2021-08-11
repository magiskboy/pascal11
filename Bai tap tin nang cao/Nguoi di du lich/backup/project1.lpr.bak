program project1;
type
  arrbyte=array[1..100] of byte;
const
  fi= 'NGUOIDIDULICH.INP';
  fo='NGUOIDIDULICH.OUT';
  nmax= 100;
var
  c: array[1..nmax, 1..nmax] of byte;  //bien luu chi phi di tu thanh pho i den thanh pho j
  way,x: array[1..nmax] of byte;   //bien lo trinh va luu lo trinh tam thoi
  n: byte;        //so thanh pho
  d: arrbyte;    //mang danh dau cac thanh pho da di qua
  l,tmp: word;  //bien chi phi va luu chi phi tam thoi dung de xet
  count: byte;  //bien dem so lan cap nhat gia tri tot hon
procedure input;
var
  f: text;
  i,j: byte;
begin
  assign(f,fi);
  reset(f);
  readln(f,n);
  for i:= 1 to n do
  begin
  for j:= 1 to n do read(f,c[i,j]);
  readln(f);
  end;
  close(f);
//************************************************************************
  for i:= 1 to n do
  begin
  for j:= 1 to n do write(c[i,j]:3);
  writeln;
  end;
end;
procedure output;
var
  f: text;
  i: byte;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,l);
  for i:= 1 to n do write(f,way[i],'->');
  close(f);
  writeln('Cost: ',l);
  for i:= 1 to n do write(way[i],'-> '); write('1');
end;
procedure update;    //cap nhat cac gia tri moi toi uu hon
begin
  l:=tmp+c[x[n],1];  //gia tri duong di
  tmp:=tmp-c[x[n-1],x[n]];   //gia tri tam thoi nhan lai gia tri truoc mot buoc de xet buoc moi
  inc(count);   //bien dem so lan update
  way:=x;       //gia tri lo trinh
end;
procedure init;
var
  i: byte;
begin
     for i:= 2 to n do d[i]:=0;    //danh dau cac thanh pho chua di qua
     l:=1000;                      //chi phi dat lon nhat >>
end;

procedure backing(i: byte);
var
  j: byte;
begin
     for j:= 2 to n do
     if d[j]=0 then    //neu thanh pho do chua di qua thi chon
     begin
       x[i]:=j;        //thu gan vao lo trinh
       tmp:=tmp+c[x[i-1],x[i]];   //thu tinh chi phi
       if tmp<l then              //neu chi phi it hon chi phi hien thoi thi con hi vong
       begin
         if (i=n) and (tmp+c[x[n],1]< l) then update  //neu chi phi do cong voi chi phi di ve thanh pho 1 cung nho hon moi cap nhat
         else
         if i<n then   //neu chua di qua het cac thanh pho thi ...
         begin
           d[j]:=1;    //danh dau thanh pho da di qua
           backing(i+1);  //tim thanh pho tiep theo
           d[j]:=0;   //bo danh dau de tim mot cau hinh khac bat dau tu nhanh j;
           tmp:=tmp-c[x[i-1],x[i]];  //giam chi phi de chon thanh pho khac
         end;
       end
       else tmp:=tmp-c[x[i-1],x[i]];   //loai bo nghiem khong tot
     end;
end;
procedure run;
begin
     input;    //nhap
     init;     //khoi tao
     d[1]:=1;
     x[1]:=1;
     backing(2);  //chon
     output;      //xuat
     write(#13#10+'Update: ',count);
end;
begin
  run;
  readln;
end.

