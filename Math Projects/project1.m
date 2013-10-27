t0 = 0;
tf = 20;
strength = [0.0 0.2 0.4 0.6 0.8 1.0];

%THIS
func = @(t,u)[0;-1*(u+ u.^3)];
[T Y] = ode45(func,[0 20],[0;1]);