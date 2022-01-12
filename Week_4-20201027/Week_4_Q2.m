%   Using an RK2 scheme, solve dx/dt = x^2 + y*t^2, dy/dt = z*t, dz/dt = t*sin(t)
% 	for t between 0 and 1, x(0) = 0, y(0) = 0, z(0) = 1. Plot two figures, 
% 	the first showing x, y and z against t and the second showing the 
% 	distance of the co-ordinate (x,y,z) from the origin at all times.

clear all
t_init=0;
t_fin=1;
x_init=0;
y_init=0;
z_init=1;
h=0.01;
steps=(t_fin-t_init)/h;

t_vals=t_init:h:t_fin;
t_vals_half=t_init+h/2:h:t_fin-h/2;

x_vals=zeros(1,steps+1);
x_vals_half=zeros(1,steps);

y_vals=zeros(1,steps+1);
y_vals_half=zeros(1,steps);

z_vals=zeros(1,steps+1);
z_vals_half=zeros(1,steps);

x_vals(1)=x_init;
y_vals(1)=y_init;
z_vals(1)=z_init;

for i = 2:steps+1
    x_vals_half(i-1)=x_vals(i-1)+(h/2)*(x_vals(i-1)^2+y_vals(i-1)*t_vals(i-1)^2);
    y_vals_half(i-1)=y_vals(i-1)+(h/2)*z_vals(i-1)*t_vals(i-1);
    z_vals_half(i-1)=z_vals(i-1)+(h/2)*t_vals(i-1)*sin(t_vals(i-1));
    x_vals(i)=x_vals(i-1)+h*(x_vals_half(i-1)^2+y_vals_half(i-1)*t_vals_half(i-1)^2);
    y_vals(i)=y_vals(i-1)+h*z_vals_half(i-1)*t_vals_half(i-1);
    z_vals(i)=z_vals(i-1)+h*t_vals_half(i-1)*sin(t_vals_half(i-1));
end

y_vals_exact=(1/2)*t_vals.^2 + 3*sin(t_vals) - 3*t_vals.*cos(t_vals) - (t_vals.^2).*sin(t_vals);
z_vals_exact=1 + sin(t_vals) - t_vals.*cos(t_vals);

figure(1)
plot(t_vals,x_vals,'k-')
hold on
plot(t_vals,y_vals,'b-')
plot(t_vals,z_vals,'r-')
hold off

figure(2)
plot(t_vals,y_vals,'k-')
hold on
plot(t_vals,y_vals_exact,'r--')
hold off

figure(3)
plot(t_vals,abs(y_vals-y_vals_exact),'k-')

abs_xyz_origin=zeros(1,steps+1);

for j = 1:steps+1
    abs_xyz_origin(j)=sqrt(x_vals(j)^2+y_vals(j)^2+z_vals(j)^2);
end

figure(4)
plot(t_vals,abs_xyz_origin,'b-')