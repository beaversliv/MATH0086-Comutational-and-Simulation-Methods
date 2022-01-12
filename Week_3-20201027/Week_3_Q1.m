% f(y,t) = y^2

% y_n - h f(y_n,t_n) = y_n-1
% y_n - h ( y_n^2 ) = y_n-1
% y_n - h y_n^2 = y_n-1
% - h (y_n - 1/2h)^2 + 1/4h = y_n-1
% 1/(4h^2) - y_n-1/h = (y_n - 1/2h)^2
% y_n = 1/2h - sqrt(1/(4h^2) - y_n-1/h)

t_init = 0;
t_fin = 0.8;
h = [0.001,0.01,0.1];
steps = (t_fin - t_init)./h;
y_init = 1;

% t_vals = zeros(1,steps(1)+1);
% y_vals = zeros(1,steps(1)+1);
t_vals_2 = zeros(1,steps(2)+1);
y_vals_2 = zeros(1,steps(2)+1);
% t_vals_3 = zeros(1,steps(3)+1);
% y_vals_3 = zeros(1,steps(3)+1);
% 
% t_vals(1)=t_init;
% y_vals(1)=y_init;
t_vals_2(1)=t_init;
y_vals_2(1)=y_init;
% t_vals_3(1)=t_init;
% y_vals_3(1)=y_init;

% for i = 2:steps(1)+1
%     t_vals(i) = t_vals(i-1) + h(1);
%     y_vals(i) = 1/(2*h(1)) - sqrt(1/(4*h(1)^2)-y_vals(i-1)/h(1));
% end

for i = 2:steps(2)+1
    t_vals_2(i) = t_vals_2(i-1) + h(2);
    y_vals_2(i) = 1/(2*h(2)) - sqrt(1/(4*h(2)^2)-y_vals_2(i-1)/h(2));
end

% for i = 2:steps(3)+1
%     t_vals_3(i) = t_vals_3(i-1) + h(3);
%     y_vals_3(i) = 1/(2*h(3)) - sqrt(1/(4*h(3)^2)-y_vals_3(i-1)/h(3));
% end

% y_vals_exact = 1./(1-t_vals);
% y_vals_exact_2 = 1./(1-t_vals_2);
% y_vals_exact_3 = 1./(1-t_vals_3);
% 
% plot(t_vals,y_vals,'k-')
% hold on
% plot(t_vals_2,y_vals_2,'b--')
% plot(t_vals_3,y_vals_3,'r--')
% hold off