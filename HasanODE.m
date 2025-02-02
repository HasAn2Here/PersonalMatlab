clear
global k1 k2
k1 = 2; k2 =1;
caO = 2; 
tfin = 1/3;
c0 (1) = cao ; c0(2) =0 ; c0(3) =0;
[t,c] = ode45('exampleode',0,tfin,c0);
ca = c(:,1)
cd = c(:,2)
cu = c(:,3)
last = size(c)
caf = c(last(1),1)
cdf = c(last(1),2)
cuf = c(last(1),3)
