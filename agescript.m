function y = deficit(time)
pop = 250*(exp(time/25));
%convert
pop = pop*1e6;
y = 0.01*(pop).^2+2000*(pop)+50;
%integrate deficit over specified time period
%tinit=initial time ,tfin =final time
tinit=0
tfin=50
%integrate using quadrate debt in $
debt =quad('deficit',tinit,tfin)