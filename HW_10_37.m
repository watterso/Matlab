%init vars
syms s t
u(t) = heaviside(t);
K = 1;
a = 1/2;
f(t) = K*exp(a*t)*u(-t)+K*u(t);


%part a
h_1(t) = dirac(t-4);
y_1(t) = convfun(h_1,f);
t_1 = cat(2,-10:.1:3.9,4.1:.1:10);
g_1 = y_1(t_1);

figure(1);
h = plot(t_1,g_1);
set(h(1),'LineWidth',2);
grid on;
title(['$' '37a: y_1(t) = \mathrm{e}^{\frac{t}{2}}u(-t)+u(t)' '$'],'Interpreter','latex', 'FontSize',20)
ylabel('y_1(t)');


%part b
h_2(t) = u(t+2);
y_2(t) = convfun(h_2,f);
t_2 = -10:.1:10;
g_2 = y_2(t_2);

figure(2);
h = plot(t_2,g_2);
set(h(1),'LineWidth',2);
grid on;
title(['$' '37b: y_2(t) = 2\mathrm{e}^{\frac{t-2}{2}}r(2-t)+r(2-t)' '$'],'Interpreter','latex', 'FontSize',20)
ylabel('y_2(t)');

%part c
b = .0000001;
h_3(t) = exp(-b*t)*u(t);
y_3(t) = convfun(h_3,f);
t_3 = -10:.1:10;
g_3 = y_3(t_3);

figure(3);
h = plot(t_3,g_3);
set(h(1),'LineWidth',2);
grid on;
%title(['$' '37b: y_2(t) = 2\mathrm{e}^{\frac{t-2}{2}}r(2-t)+r(2-t)' '$'],'Interpreter','latex', 'FontSize',20)
ylabel('y_3(t)');

