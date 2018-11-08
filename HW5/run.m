%% Problem 1
clc
clear all
i = [0.25, 0.75, 1.25, 1.5, 2.0];
V = [-0.45, -0.6, 0.70, 1.88, 6.0];
z = [i;V]';
[a, r2] = cf_polyfit(z,3)

%% Problem 2
clc
clear all
x = [1, 2, 4, 6, 8, 10];
y = [5.5, 12.5, 17.5, 32, 38, 49];
z = [x;y]';
[a, r2] = cf_polyfit(z,3)

%% Problem 3
clc
clear all
t = [0, 5, 10, 15, 20];
p = [100, 200, 450, 950, 2000];
z = [t;p]';
[a, r2] = cf_polyfit(z,3)

%% Problem 4
clc
clear all
x = [ 0, 2, 4, 6, 9, 11, 12, 15, 17, 19];
y = [5, 6, 7, 6, 9, 8, 7, 10, 12, 12]; 
z = [x;y]';
[a, r2] = cf_polyfit(z,5)

%% Problem 5

%% Problem 6
clear all
clc
clf
ord = [2.5, 13; 
       3.5, 11;
       5, 8.5;
       6, 8.2;
       7.5, 7;
       10, 6.2;
       12.5, 5.2;
       15, 4.8;
       17.5, 4.6;
       20, 4.3];
[a0, a1, r2] = cf_linear_lsr(ord, 'power')
hold on
plot(ord(:, 1),ord(:, 2), 'o');
x = 1:20;
y = 10.^(log10(a0) + a1*log10(x));
plot(x, y);

x = 9
y = 10.^(log10(a0) + a1*log10(x))
xlabel('x')
ylabel('y')
hold off

%% Problem 7
clear all
clc
clf
ord = [0.4 800;
    0.8 975;
    1.2 1500;
    1.6 1950;
    2 2900;
    2.3 3600];
[a0, a1, r2] = cf_linear_lsr(ord, 'exponential')
hold on
plot(ord(:, 1),ord(:, 2), 'o');
x = 0:.1:3;
y = exp(log(a0) + a1*x);
plot(x, y);

xlabel('x')
ylabel('y')
legend('data', 'line of best fit')
hold off

%% Problem 8
clear all
clc
clf
ord = [5 17;
    10 24;
    15 31;
    20 33;
    25 37;
    30 37;
    35 40;
    40 40;
    45 42;
    50 41];
hold on
x = 0:5:60;
plot(ord(:, 1),ord(:, 2), 'o');
[a0, a1, r2] = cf_linear_lsr(ord, 'linear');
y = a0 + a1*x;
plot(x, y)
[a0, a1, r2] = cf_linear_lsr(ord, 'power');
y = 10.^(log10(a0) + a1*log10(x));
plot(x, y)
[a0, a1, r2] = cf_linear_lsr(ord, 'saturation')
y = 1./((1./a0) + a1./(a0*x));
plot(x, y)

legend('data', 'linear', 'power', 'saturation')
%% Problem 9
clear all
clc
clf
ord = [5 17;
    10 24;
    15 31;
    20 33;
    25 37;
    30 37;
    35 40;
    40 40;
    45 42;
    50 41];
fa0 = @(a0, a1, x) x / (a1 + x);
fa1 = @(a0, a1, x) (-a0*x)/((a1+x)^2);
fx = @(a0, a1, x) a0 * (x ./ (a1 + x));
[a0, a1, r2] = cf_nonlinfit(ord, fx, {fa0 fa1})
hold on
plot(ord(:, 1),ord(:, 2), 'o');
x = 0:5:60
y = a0 * (x ./ (a1 + x))
plot(x, y)
%% test
clear all
clc
clf
ord = [ 0.25 0.28;
      0.75 0.57;
      1.25 0.68;
      1.75 0.74;
      2.25 0.79];
fa0 = @(a0, a1, x) 1 - exp(-a1*x);
fa1 = @(a0, a1, x) a0*x*exp(-a1*x);
fx = @(a0, a1, x) a0*(1-exp(-a1*x));
[a0, a1, r2] = cf_nonlinfit(ord, fx, {fa0 fa1})
hold on
plot(ord(:, 1),ord(:, 2), 'o');
x = 0:.25:3
y = a0*(1-exp(-a1*x))
plot(x, y)