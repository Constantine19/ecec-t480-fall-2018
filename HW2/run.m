%% 
%Problem 1

clear all
clc
fprintf('\n Bisection Approach: \n')
incremental(@(x) -12 - 21*x - 18*x^2 - 2.75 * x^3, -10, 10, 15)

fprintf('\n Bisection Approach: \n')
bisection(@(x) -12 - 21*x - 18*x^2 - 2.75 * x^3, -5.7143, -4.2857, 15, 0.001);

fprintf('\n False Position Approach: \n')
false_position(@(x) -12 - 21*x - 18*x^2 - 2.75 * x^3, -5.7143, -4.2857, 15, 0.001);


%% 
%Problem 2 
clear all
clc

fprintf('\n Bisection Approach: \n')
bisection(@(h) pi * h^2 *(3-3*h) - 30, 0, 3, 15, 0.001);

fprintf('\n False Position Approach: \n')
false_position(@(h) pi * h^2 *(3-3*h) - 30, 0, 3, 15, 0.001);
%% 
%Problem 3
clear all
clc
f = @(t) -3 + 9*exp(-t)*sin(2*pi*t);
df = @(t) 19*pi*exp(-t)*cos(2*pi*t) - 9*exp(-t)*sin(2*pi*t);

fprintf('\n Newtown Rhapson Approach: \n')
newton_rhapson(f, df, 0, 15, 0.001);

fprintf('\n Modified Secant Approach: \n')
modified_secant(f, 0.25, 0.01, 15, 0.001);

fprintf('\n Fixed Point Approach: \n')
fixed_point(f, 0, 15, 0.001);
%% 
%Problem 4
clear all
clc
f = @(N) 1/((1.6*10^-19) * 0.5*(N + sqrt(N^2 + 4*(6.21*10^9)))*1300*(1000/300)^2.42);

fprintf('\n Bisection Approach: \n')
bisection(f, 11e9, 13e9, 20, 0.001)

fprintf('\n Modified Secant: \n')
modified_secant(f, 11e9, 0.01, 20, 0.001)
%% 
%Problem 5
clear all
clc

f = @(x) ((4*10^-10*x) / ((4*pi*8.85*10^-12) * (x^2 + 0.81)^(3/2))) - 1;
df = @(x) -(4000*x^2-1620)/(177*pi*(x^2+81/100)^(5/2));

fprintf('\n Newtown Rhapson Approach: \n')
newton_rhapson(f, df, 0, 15, 0.001);

fprintf('\n Fixed Point Approach: \n')
fixed_point(f, 0, 15, 0.001);


%%
%Problem 6
clear all
clc

f = @(w) sqrt(1/225^2 + (w*0.6 * 10^-6 - 1/w*.5)^2) - 1/75;

fprintf('\n bisection Approach: \n')
bisection(f, 1, 1000, 25, 0.001);

fprintf('\n Fixed Point Approach: \n')
false_position(f, 1, 1000, 15, 0.001);

%% 
%Problem 7
clear all
clc

f = @(x) sqrt(1/(5*10^-4) - (x/10)^2) - 1000;
df = @(x) -x/(100*sqrt(2000-x^2/100));

fprintf('\n Newtown Rhapson Approach: \n')
newton_rhapson(f, df, 1, 15, 0.001);

fprintf('\n Bisection Approach: \n')
bisection(f, 400, 500, 15, 0.001)

fprintf('\n Fixed Point Approach: \n')
false_position(f, 400, 500, 15, 0.001);

%% 
%Problem 8
clear all
clc

func_x = @(x, y) x^2 + y -.75;
func_y = @(x, y) x^2 - 5*x*y;
func_x2 = @(x, y) sqrt(x-y+0.075);
func_y2 = @(x, y) (x^2 - y) / 5*x;

nonlin_fixed_point(func_x, func_y, 1.2, 1.2, 10, 0.005)
nonlin_fixed_point(func_x, func_y2, 1.2, 1.2, 10, 0.005)
nonlin_fixed_point(func_x2, func_y, 1.2, 1.2, 10, 0.005)
nonlin_fixed_point(func_x2, func_y2, 1.2, 1.2, 10, 0.005)

f1 = @(x, y) -x^2 + x + 0.75 - y;
f2 = @(x, y) x^2 - 5*x*y - y;

d1 = @(x, y) -1;
d2 = @(x, y) -2*x + 1;
d3 = @(x, y) 5*x - 1;
d4 = @(x, y)  2*x - 5*y;
dmat = {d1, d1; d3, d4};

nonlin_newton_rhapson(f1, f2, dmat, 1.2, 1.2, 15, 0.001)
%% 
%Problem 9
clear all
clc

f1 = @(x, y) (x -4)^2 + (y-4)^2 - 5;
f2 = @(x, y) x^2 + y^2 - 16;

d1 = @(x, y) 2*(x-4);
d2 = @(x, y) 2*(y-4);
d3 = @(x, y) 2*x;
d4 = @(x, y) 2*y;
dmat = {d1, d1; d3, d4};

nonlin_newton_rhapson(f1, f2, dmat, 1.2, 1.2, 15, 0.001)