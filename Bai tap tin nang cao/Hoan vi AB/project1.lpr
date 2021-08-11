program project1;
const
  fi='HOANVIAB.INP';
  fo='HOANVIAB.OUT';
  nmax=20;
type
  arrchar=array[0..nmax] of char;
var
  n: byte;
  x: arrchar;
  f,f1: text;
procedure input;
begin
  assign(f,fi);
  reset(f);
  read(f,n);
  close(f);
end;
procedure output(x: arrchar);
var
  j: byte;
begin
     for j:= 1 to n do write(f1,x[j],' ');
     writeln(f1);
end;
procedure backing(i: byte);
var j: char;
begin
     for j:= 'A' to 'B' do
     if not((x[i-1]='B') and (j='B')) then
     begin
          x[i]:=j;
          if i=n then output(x)
          else backing(i+1);
     end;
end;
begin
     assign(f1,fo);
     rewrite(f1);
     input;
     backing(1);
     write('Mission Complete');
     close(f1);
     readln;
end.

