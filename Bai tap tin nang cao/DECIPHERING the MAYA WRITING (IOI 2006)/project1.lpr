program project1;  //De thi IOI 2006
uses crt;          //DECIPHERING THE MAYA WRITING
const
  fi='DECIPHERINGTHEMAYAWRITING.INP';
  fo='DECIPHERINGTHEMAYAWRITING.OUT';
  maxw=3000;
  maxs=3000000;
var
  f: text;
  d: array[1..maxw] of byte;
  vitri: array[1..maxw] of word;
  w,s,tmp: string;
  count: word;
  mark: word=1;
procedure input;
begin
  assign(f,fi);
  reset(f);
  readln(f,w);
  read(f,s);
  close(f);
end;
procedure output;
var
  i: word;
begin
  assign(f,fo);
  rewrite(f);
  writeln(f,'Count: ',count);
  for i:=1 to count do writeln(f,vitri[i]);
  close(f);
end;
function findstring(st, str: string; m,n: word):word; //tim xau str trong xau st trong khoang tu m den n
var
  t: string;
begin
  if m=n then exit(0);
  findstring:=0;
  t:=copy(st,m,n);
  if pos(str,t)>0 then findstring:=pos(str,t)+m;
end;

procedure find(i: word);   //sinh hoan vi cac net roi tim
var
  j: word;
begin
  for j:= 1 to length(w) do
  if d[j]=0 then
  begin
      tmp:=tmp+w[j];
      d[j]:=1;
      if i=length(w) then
      begin
      while (findstring(s,tmp,mark,length(s))<>0) do //tim cac xau ke ca no lap lai
      begin
        inc(count);
        mark:=findstring(s,tmp,mark,length(s))+length(w);
        vitri[count]:=mark-length(w)-1;
      end;
      mark:=1;
      end
      else
      if i<length(s) then find(i+1);
      d[j]:=0;
      delete(tmp,length(tmp),1);
  end;
end;
begin
  input;
  find(1);
  writeln(count);
  output;
  readln;
end.

