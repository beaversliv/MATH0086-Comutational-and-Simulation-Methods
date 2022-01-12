% Using initial val as parameter and output are values of x(t),y(t) thourgh RK4 algorithmn
function [x_vals,y_vals]=brusselator(x_init,y_init)
t_init=0; 
t_fin=50;
h=0.001;
steps=(t_fin-t_init)/h;
% Could adjust value of A and B for futher investigation
A=1;
B=2.5;
t_vals=zeros(1,steps+1);
x_vals=zeros(1,steps+1);
y_vals=zeros(1,steps+1);
t_vals(1)=t_init;
x_vals(1)=x_init;
y_vals(1)=y_init;

fx=@(t_vals,x_vals,y_vals)(A-B*x_vals+x_vals^2*y_vals-x_vals);
fy=@(t_vals,x_vals,y_vals)(B*x_vals-x_vals^2*y_vals);
for i=2:steps+1
    t_vals(i)=t_vals(i-1)+h;
    k1_x=h*fx(t_vals(i-1),x_vals(i-1),y_vals(i-1));
    k1_y=h*fy(t_vals(i-1),x_vals(i-1),y_vals(i-1));
    
    k2_x=h*fx(t_vals(i-1)+h/2,x_vals(i-1)+k1_x/2,y_vals(i-1)+k1_y/2);
    k2_y=h*fy(t_vals(i-1)+h/2,x_vals(i-1)+k1_y/2,y_vals(i-1)+k1_y/2);
    
    k3_x=h*fx(t_vals(i-1)+h/2,x_vals(i-1)+k2_x/2,y_vals(i-1)+k2_y/2);
    k3_y=h*fy(t_vals(i-1)+h/2,x_vals(i-1)+k2_y/2,y_vals(i-1)+k2_y/2);
    
    k4_x=h*fx(t_vals(i),x_vals(i-1)+k3_x,y_vals(i-1)+k3_y);
    k4_y=h*fy(t_vals(i),x_vals(i-1)+k3_x,y_vals(i-1)+k3_y);
    x_vals(i)=x_vals(i-1)+1/6*(k1_x+2*k2_x+2*k3_x+k4_x);
    y_vals(i)=y_vals(i-1)+1/6*(k1_y+2*k2_y+2*k3_y+k4_y);
end

end
