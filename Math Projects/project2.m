%MA266 Project 2
%James Watterson
L = 1;
C = 1/5;
R = 4;
w = [ 0 .5 1 2 4 8 16 ];

%q'' = -(R/L*q')-(1/(L*C))q +10/Lcos(wt)
%creates an ode for the simple RLC circuit to feed into ode45, provide RLC and omega values
createode = @(R,L,C,w)str2func(sprintf('@(t,q)[q(2); -%f/%f*q(2)-1/(%f*%f)*q(1)+10/%f*cos(%f*t)]',R,L,L,C,L,w));
part1wrapper = @(o)ode45(createode(R,L,C,o),[0 80],[0 0]);

%%%% PART 1 %%%%
dimen = size(w);
cmap = lines(dimen(2));
figure(1);
for n = dimen(1):dimen(2)
    res = part1wrapper(n);
    T = res.x;
    Y = res.y(1,:);
    newplot = plot(T,Y,'LineWidth',1.5,'Color',cmap(n,:));
    hold on;
    if n==1
        legend(['\omega = ' num2str(w(n))],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\omega = ' num2str(w(n))],'Location','EastOutside');
    end
end
xlabel('\omega');
ylabel('Charge');
title('Charge at Select Frequencies');

grid on;