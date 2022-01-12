clear all
t_init = 0;
t_fin = 0.5;
h = 0.01;
steps = (t_fin - t_init)/h;
y_init = 1;

t_vals = zeros(1,steps+1);
y_vals = zeros(1,steps+1);
t_vals_2 = zeros(1,steps+1);
y_vals_2 = zeros(1,steps+1);

t_vals(1)=t_init;
y_vals(1)=y_init;

t_vals_2(1)=t_init;
t_vals_2(2)=t_vals(1)+h;
y_vals_2(1)=y_init;
y_vals_2(2)=y_vals_2(1)+h*y_vals_2(1)^2;

for i=3:steps+1
    t_vals_2(i)=t_vals_2(i-1)+h;
    y_vals_2(i)=y_vals_2(i-2)+2*h*y_vals_2(i-1)^2;
end

for i = 2:steps+1
    t_vals(i) = t_vals(i-1) + h;
    y_vals(i) = 1/(2*h) - sqrt(1/(4*h^2)-y_vals(i-1)/h);
end

y_vals_exact = 1./(1-t_vals);

figure(1)
plot(t_vals,abs(y_vals-y_vals_exact),'k-')
hold on
plot([t_init,t_fin],[h^2,h^2],'r--')
hold off

figure(2)
plot(t_vals_2,abs(y_vals_2-y_vals_exact),'b-')
hold on
plot([t_init,t_fin],[h^2,h^2],'r--')
hold off