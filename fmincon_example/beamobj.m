function [f] = beamobj(x)
% Define 3 elements of x vector as individual variables length, width, height
l = x(1); w = x(2); h = x(3);
% Define volume
f = l*w*h;
