clear all
t_init=0;
t_fin=0.95;
y_init=1;
steps=1000;
h=(t_fin-t_init)/steps;

t_vals=zeros(1,steps+1);
y_vals=zeros(1,steps+1);

t_vals(1)=t_init;
t_vals(2)=t_vals(1)+h;
y_vals(1)=y_init;
y_vals(2)=y_vals(1)+h*y_vals(1)^2;

for i=3:steps+1
    t_vals(i)=t_vals(i-1)+h;
    y_vals(i)=y_vals(i-2)+2*h*y_vals(i-1)^2;
end

y_vals_exact=1./(1-t_vals);

plot(t_vals,y_vals,'k-')
hold on
plot(t_vals,y_vals_exact,'r--')
hold off