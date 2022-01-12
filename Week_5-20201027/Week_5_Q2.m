% solve Q1, this time using the Lax-Friedrichs method as opposed to the
% forward Euler scheme. Alos, use a repeatind boundary condition in x

clear all

DeltaT= 0.001;
DeltaX = 0.01;
t_vals= 0:DeltaT:2;
x_vals = -1:DeltaX:1;

C = -2*DeltaT/DeltaX;

u_vals(1,:) = cosh((1/2)*x_vals.^3);
for i=2:length(t_vals)
%     u_plus = u_[n+1,m] + u_[n-1,m]
%     u_diff=u_(n,m) -  u_(n+1,m)
%     insert periodic
     u_plus = [u_vals(i-1,2:end) u_vals(i-1,1)]+[u_vals(i-1,end) u_vals(i-1,i:end-1)]
     u_diff = [u_vals(i-1,2:end) u_vals(i-1,1)]-[u_vals(i-1,end) u_vals(i-1,i:end-1)]
     u_vals(i,:)=(1/2)*u_plus-(1/2)*C*u_diff;
end

figure(3)
waterfall(x_vals,t_vals,u_vals)
xlabel('x')
ylabel('t')
zlabel('u')

% contour graph
figure(4)
contour(x_vals,t_vals,u_vals)