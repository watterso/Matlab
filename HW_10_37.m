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
title(['$' '37a: y_1(t) = u(-t)\mathrm{e}^{\frac{t}{2}}+u(t)' '$'],'Interpreter','latex', 'FontSize',20)
ylabel('y_1(t)');


%part b
h_2(t) = u(t+2);
y_2(t) = convfun(h_2,f);

%part c
syms b
h_3(t) = exp(-b*t)*u(t);
y_3(t) = convfun(h_3,f);