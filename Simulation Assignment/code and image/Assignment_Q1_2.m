clear all 
clc
t_init=0; 
t_fin=100;
x_init=0;
y_init=1;
h=0.001;
steps=(t_fin-t_init)/h;

A=1.4218;
B=8.7472;

t_vals_RK4=zeros(1,steps+1);
x_vals_RK4=zeros(1,steps+1);
y_vals_RK4=zeros(1,steps+1);
t_vals_RK4(1)=t_init;
x_vals_RK4(1)=x_init;
y_vals_RK4(1)=y_init;

fx=@(t_vals_RK4,x_vals_RK4,y_vals_RK4)(A-B*x_vals_RK4+x_vals_RK4^2*y_vals_RK4-x_vals_RK4);
fy=@(t_vals_RK4,x_vals_RK4,y_vals_RK4)(B*x_vals_RK4-x_vals_RK4^2*y_vals_RK4);

for i=2:steps+1
    t_vals_RK4(i)=t_vals_RK4(i-1)+h;
    k1_x=h*fx(t_vals_RK4(i-1),x_vals_RK4(i-1),y_vals_RK4(i-1));
    k1_y=h*fy(t_vals_RK4(i-1),x_vals_RK4(i-1),y_vals_RK4(i-1));
    
    k2_x=h*fx(t_vals_RK4(i-1)+h/2,x_vals_RK4(i-1)+k1_x/2,y_vals_RK4(i-1)+k1_y/2);
    k2_y=h*fy(t_vals_RK4(i-1)+h/2,x_vals_RK4(i-1)+k1_y/2,y_vals_RK4(i-1)+k1_y/2);
    
    k3_x=h*fx(t_vals_RK4(i-1)+h/2,x_vals_RK4(i-1)+k2_x/2,y_vals_RK4(i-1)+k2_y/2);
    k3_y=h*fy(t_vals_RK4(i-1)+h/2,x_vals_RK4(i-1)+k2_y/2,y_vals_RK4(i-1)+k2_y/2);
    
    k4_x=h*fx(t_vals_RK4(i),x_vals_RK4(i-1)+k3_x,y_vals_RK4(i-1)+k3_y);
    k4_y=h*fy(t_vals_RK4(i),x_vals_RK4(i-1)+k3_x,y_vals_RK4(i-1)+k3_y);
    x_vals_RK4(i)=x_vals_RK4(i-1)+1/6*(k1_x+2*k2_x+2*k3_x+k4_x);
    y_vals_RK4(i)=y_vals_RK4(i-1)+1/6*(k1_y+2*k2_y+2*k3_y+k4_y);
end

% digits(25)
% a=x_vals_RK4(end);
% b=y_vals_RK4(end);
% a_RK4=vpa(a)
% b_RK4=vpa(b)

figure(1)
plot(t_vals_RK4,x_vals_RK4,'k-')
hold on
plot(t_vals_RK4,y_vals_RK4,'b-')
title('Brusselator Model RK4')
xlabel('0<t<100')
ylabel('Value')
legend('x(t)','y(t)')
hold off


figure(2)
plot(x_vals_RK4,y_vals_RK4,'r-')
title('phase plane (x,y)')
xlabel('x(t)')
ylabel('y(t)')    