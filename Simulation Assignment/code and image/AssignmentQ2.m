% Various initial values
clear all
[x_1,y_1]=brusselator(1,3);
[x_2,y_2]=brusselator(2,3);
[x_3,y_3]=brusselator(4,6);
[x_4,y_4]=brusselator(0,0);
% [x_5,y_5]=brusselator(3,2);
% Through defined function to accomplish ploting clearly
% plot(x_1,y_1,'b-')
% hold on
plot(x_2,y_2,'k--')
% plot(x_3,y_3,'r-')
% plot(x_4,y_4,'g-')
% % plot(x_5,y_5,'g-')
% title('(x(t) against y(t) in different initial values)')
% xlabel('x(t)')
% ylabel('y(t)')
% legend('x1=1,y1=3','x2=2,y2=3','x3=4,y3=6','x4=0,y4=0')
% hold off