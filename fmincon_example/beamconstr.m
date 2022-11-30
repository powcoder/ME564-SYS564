function [g,geq] = beamconstr(x,F,E,sigmay)
% Define 3 elements of x vector as individual variables length, width, height
l = x(1); w = x(2); h = x(3);
% Define each constraint as an element of the vector g
g(1) = w-l/10;
g(2) = h-l/10;
g(3) = (6*F*l^3)/(w*h^2)-sigmay;
g(4) = (F*l^3)/(3*E*(w*h^3/12)) - 0.005;
% Since there are no equality constraints, we create "geq" as an empty vector
geq = [];