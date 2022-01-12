clear all

a = 2;
dt = 0.0005;
dx = 0.04;
tsol2 = 0:dt:2;
xsol2 = -2:dx:2;
alpha = dt/(dx^2)-a*dt/dx;
beta = 1 - 2*dt/(dx^2);
gamma = dt/(dx^2)+a*dt/dx;

u2(1,:) = exp(-xsol2.^2);

for i = 2:length(tsol2)
    u2_n1 = [u2(i-1,2:end) u2(i-1,1)];
    u2_nm1 = [u2(i-1,end) u2(i-1,1:end-1)];
    %u2_n1 = [u2(i-1,2:end) 0];
    %u2_nm1 = [0 u2(i-1,1:end-1)];
    u2(i,:) = alpha*u2_n1 + beta*u2(i-1,:) + gamma*u2_nm1;
end

figure(1)
waterfall(xsol2,tsol2,u2)
xlabel('x')
ylabel('t')
zlabel('u2')

figure(2)
contour(xsol2,tsol2,u2)