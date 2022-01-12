% Evaluate the 1D wave equation du/dt = 2 du/dx using the Explicit Fed x
% derv for t between 0 and 2, x between -1 and 1 given u(x,0)=cosh((1/2)*x^3

clear all

% making DeltaT smaller or makeing DeltaX bigger, choose DeltaT
DeltaT= 0.001;
DeltaX = 0.01;
t_vals= 0:DeltaT:2;
x_vals = -1:DeltaX:1;
% def of 7.11
C = -2*DeltaT/DeltaX;

u_vals(1,:) = cosh((1/2)*x_vals.^3);

for i=2:length(t_vals)
%     u_diff=u_(n,m) -  u_(n+1,m) current position m
% row vector, all values of x
% outside the range
    u_diff = u_vals(i-1,:) - [u_vals(i-1,2:end) 0];
    u_vals(i,:)=u_vals(i-1,:) + C*u_diff;
end

%cheese cake graph
figure(1)
waterfall(x_vals,t_vals,u_vals)
xlabel('x')
ylabel('t')
zlabel('u')

% contour graph
figure(2)
contour(x_vals,t_vals,u_vals)