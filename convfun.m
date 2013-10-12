%convolutes 2 given functions, args should be of type symfun, returns symfun of t
function conv = convfun(h,f)
syms t s
conv = int(h(t-s)*f(s),'s',-inf,inf);
end