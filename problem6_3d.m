x= 1:0.5:10;
y= 1:1:20;
[x,y]=meshgrid(x,y);
Z = sin(x) + cos(y);
C = x.*y;
surf(x,y,Z);
surf(x,y,Z,C);




