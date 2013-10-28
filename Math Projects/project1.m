%MA266 Project 1
%James Watterson

%ode45 has complex usage, this stackoverflow link clears it up:
%http://stackoverflow.com/questions/13224292/second-order-diff-eq-with-ode45-in-matlab

%epsilon vals
eps = [0 .2 .4 .6 .8 1];
neps = [.1 .2 .3 .4];
%epsilon vals as they grow
heps = [1 10 100 1000 10000 100000];
leps = [.5 .50027];
%function handles
negodecalc = @(e,tspan,y0)ode45(str2func(char(sprintf('@(t,u)[u(2);-u(1)-%f*u(1)^3]',e))),tspan,y0);
odecalc = @(e,tspan,y0)ode45(str2func(char(sprintf('@(t,u)[u(2);-u(1)+%f*u(1)^3]',e))),tspan,y0);
%wrapper for epsilon > 0
wrapper1 = @(e)negodecalc(e,[0 20],[0 1]);
%wrapper for epsilon < 0, provide positive vals, the sign change is done
%inside odecalc
wrapper2 = @(e)odecalc(e,[0 20],[0 1]);

%%%% PART 1 %%%%
%find values for specific epsilons
dimen = size(eps);
cmap = lines(dimen(2));
figure(1);
for n = dimen(1):dimen(2)
    res = wrapper1(eps(n));
    newplot = plot(res.x,res.y(1,:),'LineWidth',1.5,'Color',cmap(n,:));
    hold on;
    amp = max(abs(res.y(1,:)));
    
    %calc u+
    T = res.x;
    U = res.y(1,:);
    DU = res.y(2,:);
    crit1 = find(DU<0,1);
    crit2 = find(DU(crit1:end)>0,1)+crit1;
    [val,ind] = min(abs(U(crit1:crit2)));
    uplus = T(crit1+ind-1);
    
    if n==1
        legend(['\epsilon = ' num2str(eps(n)) ', Amplitude = ' num2str(amp) ', u+ = ' num2str(uplus)],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\epsilon = ' num2str(eps(n)) ', A = ' num2str(amp) ', u+ = ' num2str(uplus)],'Location','EastOutside');
    end
end
grid on;
xlabel('Time (s)');
ylabel('Position');
title(['$' 'Graph\ 1,\ \epsilon > 0' '$'],'Interpreter','latex', 'FontSize',20);

%find values for high epsilons
dimen = size(heps);
cmap = lines(dimen(2));
figure(2);
for n = dimen(1):dimen(2)
    res = wrapper1(heps(n));
    newplot = plot(res.x,res.y(1,:),'LineWidth',1.5,'Color',cmap(n,:));
    hold on;
    amp = max(abs(res.y(1,:)));
    
    %calc u+
    T = res.x;
    U = res.y(1,:);
    DU = res.y(2,:);
    crit1 = find(DU<0,1);
    crit2 = find(DU(crit1:end)>0,1)+crit1;
    [val,ind] = min(abs(U(crit1:crit2)));
    uplus = T(crit1+ind-1);
    
    if n==1
        legend(['\epsilon = ' num2str(heps(n)) ', Amplitude = ' num2str(amp) ', u+ = ' num2str(uplus)],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\epsilon = ' num2str(heps(n)) ', A = ' num2str(amp) ', u+ = ' num2str(uplus)],'Location','EastOutside');
    end
end
grid on;
xlabel('Time (s)');
ylabel('Position');
title(['$' 'Graph\ 2,\ \epsilon \to \infty' '$'],'Interpreter','latex', 'FontSize',20);

%%%% PART 2 %%%%
dimen = size(neps);
cmap = lines(dimen(2));
figure(3);
for n = dimen(1):dimen(2)
    res = wrapper2(neps(n));
    newplot = plot(res.x,res.y(1,:),'LineWidth',1.5,'Color',cmap(n,:));
    hold on;
    amp = max(abs(res.y(1,:)));
    
    %calc u-
    T = res.x;
    U = res.y(1,:);
    DU = res.y(2,:);
    crit1 = find(DU<0,1);
    crit2 = find(DU(crit1:end)>0,1)+crit1-1;
    [val,ind] = min(abs(U(crit1:crit2)));
    uminus = T(crit1+ind-1);
    
    if n==1
        legend(['\epsilon = ' num2str(-1*neps(n)) ', Amplitude = ' num2str(amp) ', u- = ' num2str(uminus)],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\epsilon = ' num2str(-1*neps(n)) ', A = ' num2str(amp) ', u- = ' num2str(uminus)],'Location','EastOutside');
    end
end
grid on;
xlabel('Time (s)');
ylabel('Position');
title(['$' 'Graph\ 3,\ \epsilon < 0' '$'],'Interpreter','latex', 'FontSize',20);

%find values for low epsilons
dimen = size(leps);
cmap = lines(dimen(2));
figure(4);
for n = dimen(1):dimen(2)
    res = wrapper2(leps(n));
    newplot = plot(res.x,res.y(1,:),'LineWidth',1.5,'Color',cmap(n,:));
    hold on;
    amp = max(abs(res.y(1,:)));
    
    %calc u-
    T = res.x;
    U = res.y(1,:);
    DU = res.y(2,:);
    crit1 = find(DU<0,1);
    crit2 = find(DU(crit1:end)>0,1)+crit1;
    [val,ind] = min(abs(U(crit1:crit2)));
    uplus = T(crit1+ind-1);
    
    if n==1
        legend(['\epsilon = ' num2str(-1*leps(n)) ', Amplitude = ' num2str(amp) ', u- = ' num2str(uplus)],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\epsilon = ' num2str(-1*leps(n)) ', A = ' num2str(amp) ', u- = ' num2str(uplus)],'Location','EastOutside');
    end
end
grid on;
xlabel('Time (s)');
ylabel('Position');
title(['$' 'Graph\ 4,\ \epsilon \to -\infty' '$'],'Interpreter','latex', 'FontSize',20);
%clear for part 3
clear;

%%%% PART 3 %%%%
w = [0.5 0.7 1 1.3 2.0];

odecalc = @(w,tspan,y0)ode45(str2func(char(sprintf('@(t,u)[u(2);cos(%f*t)-u(2)/5-u(1)-(u(1)^3)/5]',w))),tspan,y0);
%wrapper for part 3
wrapper3 = @(w)odecalc(w,[0 60],[0 0]);
%wrapper for finding omega*
wrapper4 = @(w)odecalc(w,[40 60],[0 0]);

dimen = size(w);
cmap = lines(dimen(2));
figure(5);
for n = dimen(1):dimen(2)
    res = wrapper3(w(n));
    newplot = plot(res.x,res.y(1,:),'LineWidth',1.5,'Color',cmap(n,:));
    hold on;
    
    if n==1
        legend(['\omega = ' num2str(w(n))],'Location','EastOutside');
    else
        [LEGH,OBJH,OUTH,OUTM] = legend;
        legend([OUTH;newplot],OUTM{:},['\omega = ' num2str(w(n))],'Location','EastOutside');
    end
end
grid on;
xlabel('Time (s)');
ylabel('Position');
title(['$' 'Graph\ 5,\ \omega\ at\ selected\ values' '$'],'Interpreter','latex', 'FontSize',20);

%find w to maximize |u(t)| => find w for max amplitude
%based on graph 5, it is somewhere between 1 and 2
w1 = 1:.01:2;
maxVal = 0;
maxW = 0;
dimen = size(w1);
for n = dimen(1):dimen(2)
    res = wrapper4(w1(n));
    tmpMax = max(abs(res.y(1,:)));
    if tmpMax > maxVal
        maxVal = tmpMax;
        maxW = w1(n);
    end
end
fprintf('over the interval [40,60] |u(t)| maximized by w = %f, with a max of %f\n',maxW,maxVal);
