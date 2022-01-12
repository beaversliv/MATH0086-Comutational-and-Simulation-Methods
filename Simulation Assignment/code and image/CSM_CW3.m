a = 1;
u_0 = 1;
x = linspace(0,5);
y = linspace(0,2);
[X,Y] = meshgrid(x,y);

% figure(1)
z1 = a*u_0.*Y.*(239/1362 - 10*X/681 );
contour(X,Y,z1,20)
hold on

x = linspace(5,7);
y = linspace(0,2);
[X,Y] = meshgrid(x,y);
% figure(2)
z2 = (139/681) *a*u_0*(5/2 - 0.5*X + 0.5*Y );
contour(X,Y,z2,20)
hold on
x = linspace(0,5);
y = linspace(2,6);
[X,Y] = meshgrid(x,y);
% figure(3)
z3 = a*u_0*(6/227 - 10*X/227  + (221/1362)*Y+(5/681)*X.*Y );
contour(X,Y,z3,20)
hold on
x = linspace(5,7);
y = linspace(2,6);
[X,Y] = meshgrid(x,y);
% figure(4)
z4 = a*u_0*(432/1362 - (139/1362)*X+(271/1362)*Y );
contour(X,Y,z4,20)
hold on

x = linspace(5,10);
y = linspace(2,6);
[X,Y] = meshgrid(x,y);
% figure(5)
z5 = a*u_0*(0.5-X/8+3*Y/16 );
contour(X,Y,z5,20)
hold on
x = linspace(5,10);
y = linspace(4,6);
[X,Y] = meshgrid(x,y);
% figure(6)
z6 = a*u_0*(-2+Y/2);
contour(X,Y,z6,20)
hold off