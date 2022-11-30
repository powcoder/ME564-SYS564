clear
close all
fclose all;
clc
%% Initialize parameters and inputs
F = 100;
E = 2300000000;
sigmay = 45000000;
lb = [0.3;0.001;0.001];
ub = [2;2;2];
x0 = [1;0.1;0.1];
%% Optimize
% Set algorithm (this is optional - fmincon has 4 built-in options)
options = optimset('Algorithm','sqp');
% Run fmincon to find optimum
[xopt,fopt] = fmincon(@(x) beamobj(x),x0,[],[],[],[],lb,ub,@(x) beamconstr(x,F,E,sigmay),options);
% Print the solution
fprintf('SOLUTION: The optimizer is (%.4f,%.4f,%.4f), and the optimum is %f.\n',xopt(1),xopt(2),xopt(3),fopt)