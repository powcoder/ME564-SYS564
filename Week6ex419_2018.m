clear
close all
clc
%% Initialize
niter = 20;
xinit = [2 2];

%% Implement gradient descent:
xmat(1,:) = xinit;
f(1) = ex419(xmat(1,:));
for i = 1:(niter-1)
    x = xmat(i,:); %NOTE: During class, I erroneously had x = xmat(1,:);
    alpha = grad(x)'*grad(x)/(grad(x)'*hess(x)*grad(x));
    xmat(i+1,:) = x - alpha.*grad(x)';
    newx = xmat(i+1,:);
    f(i+1) = ex419(newx);
end

%% Plot function
% fint = @(x1,x2) (1/3)*x1^3 + x1*x2 + (1/2)*x2^2 + 2*x2 - 2/3;
% ezsurf(fint,[-5 5 -5 5])

%% Implement Newton's
xNM(1,:) = xinit;
fNM(1) = ex419(xNM(1,:));
for i = 1:niter-1
    xNM(i+1,:) = xNM(i,:)' - inv(hess(xNM(i,:)))*grad(xNM(i,:));
    fNM(i+1) = ex419(xNM(i+1,:));
end

%% From the optimization toolbox
[xstar,fstar] = fmincon(@ex419,xinit);

%% Define functions
function f = ex419(x)
    f = (1/3)*x(1)^3 + x(1)*x(2) + (1/2)*x(2)^2 + 2*x(2) - 2/3;
end

function g = grad(x)
    g = [x(1)^2+x(2); x(1)+x(2)+2];
end

function H = hess(x)
    H = [2*x(1) 1;1 1];
end