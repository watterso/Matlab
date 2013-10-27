tspan = [0 20];
y0 = [0 1];
func = @(t,u)[u(2);-u(1)-u(1)^3];
[T Y] = ode45(func,tspan,y0);
%important reference: http://stackoverflow.com/questions/13224292/second-order-diff-eq-with-ode45-in-matlab