% Kontantin Zelmanovich
% Jayden Chen
% Homework 4

%% problem 1
clear all
clc
e0 = 8.85*10^-12;
q = 2*10^-5;
a = 0.9;
syms f(x)
f(x) = (1/(4*pi*e0)) * ((q * q * x)/(x^2 + a^2)^1.5);
df = diff(f, x);
fprintf('\n optim golden approach: \n')
optim_golden(f, 1, 50, 0.001, 10)
fprintf('\n optim parabolic approach: \n')
optim_parabolic(f, 1, 50, 0.001, 10)
fprintf('\n optim newton approach: \n')
optim_newton(f , df, 1, 50, 0.001 , 10)
fprintf('\n optim random approach: \n')
optim_random_1d(f, 50, 15)

%% Problem 2
clear all
clc
f= @(s) -(15*(s-s.^22)/((1-s)*(4*s.^2-s*3+4)));
%g= @(s) T(-s)* -1;
fprintf('\n optim golden approach: \n')
optim_golden(f, 0, 100, 0.001, 10)

%% Problem 4
clear all
clc
syms f(x, y)
f(x, y) = (x-3)^2 + (y-2)^2;
fx = @(x, y) 2*x - 6;
fy = @(x, y) 2*y - 4;
fprintf('\n optim random approach: \n')
optim_random(f, 1, 10)
gradient = optim_gradient(fx, fy, 1, 1);
fprintf('\n optim steepest ascent approach: \n')
[location, max] = optim_steepest_ascent(f, gradient, .001, 3, 0.001)

%% Problem 5
clear all
clc
syms f(x, y)
f(x, y) = 4*x + 2*y + x^2 - 2*x^4 + 2*x*y - 3*y^2;

fx = @(x, y) - 8*x^3 + 2*x + 2*y + 4;
fy = @(x, y) 2*x - 6*y + 2;
fprintf('\n optim random approach: \n')
optim_random(f, 1, 10)
gradient = optim_gradient(fx, fy, 0, 0);
fprintf('\n optim steepest ascent approach: \n')
[location, max] = optim_steepest_ascent(f, gradient, .001, 3, 0.001)
%% Problem 6
clear all
clc
syms f(x, y)
f(x, y) = -8* x + x^2 + 12*y + 4*y^2 - 2*x*y;
fx = @(x, y) 2*x - 2*y - 8;
fy = @(x, y) 8*y - 2*x + 12;

fprintf('\n optim random approach: \n')
optim_random(f, 1, 10)
gradient = optim_gradient(fx, fy, 0, 0);
fprintf('\n optim steepest ascent approach: \n')
[location, max] = optim_steepest_ascent(f, gradient, .001, 3, 0.001)