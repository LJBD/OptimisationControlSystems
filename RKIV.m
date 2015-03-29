function [ t,x ] = RKIV(func, tau0, tau1, MSHDNS, x0, u)

y = x0;
t(1) = tau0;
h = 1/MSHDNS;

for i=1:(tau1-tau0+h)*MSHDNS
    k1 = feval(func, y, t(i), u);
    k2 = feval(func, y+h/2*k1, t(i)+h/2, u);
    k3 = feval(func, y+h/2*k2, t(i)+h/2, u);
    k4 = feval(func, y+h*k3, t(i)+h, u);
    y = y + h/6*(k1 + 2*k2 + 2*k3 + k4);
    t(i+1) = t(i) + h;
    x(i,:) = y;
end
t = t(1:length(t)-1);
end