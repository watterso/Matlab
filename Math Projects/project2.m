%MA266 Project 2
%James Watterson
L = 1;
C = 1/5;
R = 4;
w = [ 0 .5 1 2 4 8 16 ];
w2 = 0:1:100;

%q'' = -(R/L*q')-(1/(L*C))q +10/Lcos(wt)
%creates an ode for the simple RLC circuit to feed into ode45, provide RLC and omega values
createode = @(R,L,C,w)str2func(sprintf('@(t,q)[q(2); -%f/%f*q(2)-1/(%f*%f)*q(1)+10/%f*cos(%f*t)]',R,L,L,C,L,w));
part1wrapper = @(o)ode45(createode(R,L,C,o),[0 80],[0 0]);

%%%% PART 1 %%%%
dimen = size(w);
cmap = lines(dimen(2));
figure(1);
for n = dimen(1):dimen(2)
    res = part1wrapper(w(n));
    T = res.x;
    Y = res.y(1,:);
    newplot = plot(T,Y,'LineWidth',2,'Color',cmap(n,:));
    hold on;
    if n==1
        legend(['\omega = ' num2str(w(n))],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\omega = ' num2str(w(n))],'Location','EastOutside');
    end
end
xlabel('\omega', 'FontSize',20);
ylabel('Charge', 'FontSize',20);
title('Graph 1, Charge at Select Frequencies', 'FontSize',20);
grid on;

%%%% PART 2 %%%%
dimen = size(w2);
%frequency array
F = zeros(dimen);
%amplitude array
A = zeros(dimen);
for n = dimen(1):dimen(2);
    F(n) = w2(n);
    fprintf('calc for w=%d\n',w2(n));
    res = part1wrapper( w2(n));
    T = res.x;
    Y = res.y(1,:);
    minT = find(T>=30,1);
    maxT = find(T<=80, 1,'last');
    A(n) = max(abs(Y(minT:maxT)));
end
figure(2);
semilogx(F,A);
xlabel('\omega', 'FontSize',20);
ylabel('Amplitude', 'FontSize',20);
title('Graph 2, Effect of Input Frequency on Amplitude', 'FontSize',20);
grid on;

