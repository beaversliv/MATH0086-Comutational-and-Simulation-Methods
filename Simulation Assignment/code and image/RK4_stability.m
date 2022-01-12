% Specify x range and number of points
clear all
x_init= -3;
x_end =  3;
num_x = 301;
% Specify y range and number of points
y_init = -3;
y_end =  3;
num_x = 301;
% Construct mesh
x_vals  = linspace(x_init,x_end,num_x);
y_vals  = linspace(y_init,y_end,num_x);
[x,y] = meshgrid(x_vals,y_vals);
% Calculate z
DET = x + i*y;
% 4th order Runge-Kutta growth factor
g_n = 1 +DET + 0.5*DET.^2 + (1/6)*DET.^3+(1/24)*DET.^4;
% Calculate magnitude of g
gmag = abs(g_n);
% Plot contours of gmag
contour(x,y,gmag,[1 1],'k-');
hold on
contour(x,y,gmag,[1 1],'k-');
axis([x_init,x_end,y_init,y_end]);
axis('square');
xlabel('Real \Delta r');
ylabel('Imag \Delta i');
title('Stability region for RK4')
hold off
grid on;