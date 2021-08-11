USES crt, graph;
VAR x1, y1, x2, y2, a, b, c: REAL;
    gd, gm: INTEGER;
PROCEDURE tinh;
BEGIN
     x1:=0;
     y1:=(-c-a*x1)/b;
     y2:=0;
     x2:=(-c-b*y2)/a;
     y1:= y1*trunc(getmaxy/y1);
     x2:= x2*trunc(getmaxx/x2);
END;
PROCEDURE vve;
BEGIN
    gd:=detect;
    initgraph(gd,gm,'C:\Program Files\TP\BGI');
    line(0,getmaxy/2,getmaxx,getmaxy/2);
    line(getmaxx/2,0,getmaxx/2,getmaxy);
END;
BEGIN
    readln(a);
    readln(b);
    readln(c);
    tinh;
    vve;
    readln;
    closegraph;
END.

    
    
    
    