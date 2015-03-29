function [ f ] = magLevChanged( x,t,u)
c = 2.62627844778518;

dx1 = x(2);
dx2 = - exp(-x(1)) * x(3).^2 + 1;
dx3 = -c * x(3) + u;
f = [dx1; dx2; dx3];
end