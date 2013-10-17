R_1 = 15;
R_2 = 5;
L = .002;
C = 2.5e-6;
syms s h;
%create the transfer function
h(s) = ((R_2/L)*s)/(s^2+(R_1+R_2)*s/L + 1/(L*C));
%define the frequency range
w = 0:1:(3*2*pi/sqrt(L*C));
pretty(h);
%identify the coefficients of the numerator and denominator
n = [0 2500 0];
d = [1 10000  200000000];
%calculate values for h over the frequency range
H = freqs(n,d,w);
%Magnitude
M = abs(H);
%Phase
P = angle(H)*180/pi;
%Graph
figure(1)
semilogx(w,M)
ylabel('Magnitude');
xlabel('Frequency');
grid on;
figure(2)
semilogx(w,P)
ylabel('Phase');
xlabel('Frequency');
grid on;

%Part C
poles = roots(d);
%Part D
[maxVal, ind] = max(H);
%Part E
halfPower = find(real(H)==.125);

