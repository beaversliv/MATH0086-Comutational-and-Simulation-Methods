t_init=0;
t_fin=2;
y_init=1;
v_init=-1;
h=0.001;
steps=(t_fin-t_init)/h;

t_vals=zeros(1,steps+1);
y_vals=zeros(1,steps+1);
v_vals=zeros(1,steps+1);

t_vals(1)=t_init;
y_vals(1)=y_init;
v_vals(1)=v_init;

for i=2:steps+1
    t_vals(i) = t_vals(i-1) + h;
    y_vals(i) = y_vals(i-1) + h*v_vals(i-1);
    v_vals(i) = v_vals(i-1) + h*(- t_vals(i-1)*cosh(y_vals(i-1)^2) - 6*v_vals(i-1));
end

figure(1)
plot(t_vals,y_vals,'k-')
hold on
plot(t_vals,v_vals,'b--')
hold off

figure(2)
plot(y_vals,v_vals,'r-')