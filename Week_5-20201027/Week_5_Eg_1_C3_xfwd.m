clear all

DeltaT= 0.01;
DeltaX = 0.01;
t_vals= 0:DeltaT:2;
x_vals = -3:DeltaX:3;
% def of 7.11
C = -1*DeltaT/DeltaX;

u_vals(1,:) = sin(pi*x_vals);

% steps+1 the same as
for i=2:length(t_vals)
%     u_diff=u_(n,m) -  u_(n+1,m) current position m
% row vector, all values of x
    u_diff = u_vals(i-1,:) - [u_vals(i-1,2:end) 0];
%     introducing initial value to remove 0
    u_vals(i,:)=u_vals(i-1,:) + C*u_diff;
end

figure(1)
% in a mesh
surf(x_vals,t_vals,u_vals)

figure(2)
waterfall(x_vals,t_vals,u_vals)
xlabel('x')
ylabel('t')
zlabel('u')

% contour graph
figure(3)
contour(x_vals,t_vals,u_vals)


