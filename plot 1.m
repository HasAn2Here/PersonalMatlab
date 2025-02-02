tc = [0:15:100];
tf = 1.8*tc + 32;
tr = tf + 459.69;

%combine answer into one matrix
t = [tc; tf; tr];

% plot tc vs tf
plot(tc,tf);
xlabel('tc');
ylabel('tf')
