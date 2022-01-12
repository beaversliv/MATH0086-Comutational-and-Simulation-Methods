clear all

dt = 0.005;
dx = 0.01;
tsol2 = 0:dt:1;
xsol2 = -1:dx:1;
C = 2*dt/dx;

u2(1,:) = cos(pi*xsol2).^2;
u2(2,:) = u2(1,:) + dt*(1 - 2*sin(2*pi*xsol2));

for i = 3:length(tsol2)
    u2_sum = [u2(i-1,2:end) u2(i-1,1)] + [u2(i-1,end) u2(i-1,1:end-1)];
    %u2_sum = [u2(i-1,2:end) 0] + [0 u2(i-1,1:end-1)];
    u2(i,:) = - u2(i-2,:) + 2*(1-C^2)*u2(i-1,:) + C^2*u2_sum;
end

figure(1)
waterfall(xsol2,tsol2,u2)
xlabel('x')
ylabel('t')
zlabel('u2')

figure(2)
contour(xsol2,tsol2,u2)