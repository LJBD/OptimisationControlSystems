function [ f ] = magLev( x,t,u)
L0 = 0.1091;
s = 0.0077;
g = 9.81;
tau = 0.0107;
is = 1.506;
k = 0.29703;
m = 0.06;
%f = -x+u; %x'=f(x,t,u)
dL = -L0 * exp(-x(1) / s) / s;

dx1 = x(2);
dx2 = dL/(2*m) * x(3)^2 + g;
dx3 = (k*u - is - x(3))/tau;
f = [dx1; dx2; dx3];
end