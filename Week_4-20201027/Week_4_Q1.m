clear all
t_init=0;
t_fin=1;
y_init=0;
v_init=3*pi;
h=0.01;
steps=(t_fin-t_init)/h;

t_vals=zeros(1,steps+1);
y_vals=zeros(1,steps+1);
v_vals=zeros(1,steps+1);

t_vals(1)=t_init;
y_vals(1)=y_init;
v_vals(1)=v_init;

t_vals(2)=t_vals(1)+h;
y_vals(2)=y_vals(1)+h*v_vals(1);
v_vals(2)=v_vals(1)+h*(-pi^2)*y_vals(1);

for i = 3:steps+1
    t_vals(i) = t_vals(i-1) + h;
    y_vals(i) = y_vals(i-2) + 2*h*v_vals(i-1);
    v_vals(i) = v_vals(i-2) + 2*h*-1*pi^2*y_vals(i-1);
end

y_vals_exact=3*sin(pi*t_vals);

figure(1)
plot(t_vals,abs(y_vals-y_vals_exact),'k-')
hold on
plot([t_init,t_fin],[h^1.4,h^1.4],'r--')
plot([t_init,t_fin],[h^3,h^3],'b--')
hold off