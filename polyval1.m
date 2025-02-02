mass = [9 55 141 267 345 531];
time = [1 3 5 7 8 10];
coeff = polyfit(time,mass,3)
newtime=[1:30];
pred=polyval(coeff,newtime);
derivat
