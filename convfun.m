%Calculates the convolution of the given fuctions
function conv = convfun(h,f)
syms t s
conv = int(h(t-s)*f(s),'s',-inf,inf);
end