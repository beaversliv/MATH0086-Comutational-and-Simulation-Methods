clear all
t_init=0; 
t_fin=50;
x_init=0;
y_init=1;
h=0.0001;
steps=(t_fin-t_init)/h;

A=1;
B=1.8;

t_vals_RK2=t_init:h:t_fin;
t_vals_half_RK2=t_init+h/2:h:t_fin-h/2;

x_vals_RK2=zeros(1,steps+1);
x_vals_half_RK2=zeros(1,steps);

y_vals_RK2=zeros(1,steps+1);
y_vals_half_RK2=zeros(1,steps);

x_vals_RK2(1)=x_init;
y_vals_RK2(1)=y_init;

fx=@(t_vals_RK,x_vals_RK,y_vals_RK)(A-B*x_vals_RK+x_vals_RK^2*y_vals_RK-x_vals_RK);
fy=@(t_vals_RK,x_vals_RK,y_vals_RK)(B*x_vals_RK-x_vals_RK^2*y_vals_RK);

for i=2:steps+1
    
    x_vals_half_RK2(i-1)=x_vals_RK2(i-1)+(h/2)*fx(t_vals_RK2(i-1),x_vals_RK2(i-1),y_vals_RK2(i-1));
    y_vals_half_RK2(i-1)=y_vals_RK2(i-1)+(h/2)*fy(t_vals_RK2(i-1),x_vals_RK2(i-1),y_vals_RK2(i-1));
    
    x_vals_RK2(i)=x_vals_RK2(i-1)+h*fx(t_vals_half_RK2(i-1),x_vals_half_RK2(i-1),y_vals_half_RK2(i-1));
    y_vals_RK2(i)=y_vals_RK2(i-1)+h*fy(t_vals_half_RK2(i-1),x_vals_half_RK2(i-1),y_vals_half_RK2(i-1));
end

digits(25)
c=x_vals_RK2(end);
d=y_vals_RK2(end);
c_RK2=vpa(c)
D_RK2=vpa(d)