fexact=@(t,x) [1-1.8*x(1)+x(1)^2*x(2)-x(1);1.8*x(1)-x(1)^2*x(2)];
[t,xa] = ode45(fexact,[0 50],[0 1])
