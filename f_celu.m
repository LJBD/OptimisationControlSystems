function [ J ] = f_celu( T, xT, ro )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if nargin==2
    ro = 10;
end

xf = [1.8094; 0; 2.4712];

J = T + ro / 2 * (xT - xf)' * (xT - xf);

end

