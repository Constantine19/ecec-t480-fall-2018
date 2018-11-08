% Konstantin Zelmanovich
% Jayden Chen

%% Problem 1
clc
clear all
i = [0.25, 0.75, 1.25, 1.5, 2.0];
V = [-0.45, -0.6, 0.70, 1.88, 6.0];
z = [i;V]';
[a, r2] = cf_polyfit(z,3)

best_fit = a(1)*i.^3+a(2)*i.^2+a(3)*i+a(4)
figure
plot(i,V)
hold on
plot(i,best_fit)

%% Problem 2
clc
clear all
x = [1, 2, 4, 6, 8, 10];
y = [5.5, 12.5, 17.5, 32, 38, 49];
z = [x;y]';
[a, r2] = cf_polyfit(z,3)

best_fit = a(1)*x.^3+a(2)*x.^2+a(3)*x+a(4)
figure
plot(x,y)
hold on
plot(x,best_fit)

%% Problem 3
clc
clear all
t = [0, 5, 10, 15, 20];
p = [100, 200, 450, 950, 2000];
z = [t;p]';
[a, r2] = cf_polyfit(z,3)

best_fit = a(1)*t.^3+a(2)*t.^2+a(3)*t+a(4)
figure
plot(t,p)
hold on
plot(t,best_fit)

%% Problem 4
clc
clear all
x = [ 0, 2, 4, 6, 9, 11, 12, 15, 17, 19];
y = [5, 6, 7, 6, 9, 8, 7, 10, 12, 12]; 
z = [x;y]';
[a, r2] = cf_polyfit(z,3)

best_fit = a(1)*x.^3+a(2)*x.^2+a(3)*x+a(4)
figure
plot(x,y)
hold on
plot(x,best_fit)

%% Problem 5
clear all
clc
clf
ord = [.75 1.2;
    2 1.95;
    3 2;
    4 2.4;
    6 2.4;
    8 2.7;
    8.5 2.6];
hold on
x = 0:.5:10;
plot(ord(:, 1),ord(:, 2), 'o');
[a0, a1, r2] = cf_linear_lsr(ord, 'power');
y = 10.^(log10(a0) + a1*log10(x));
plot(x, y)
[a0, a1, r2] = cf_linear_lsr(ord, 'saturation')
y = 1./((1./a0) + a1./(a0*x));
plot(x, y)


%% Problem 5 (poly part)
clear all
clc
x = [0.75, 2, 3, 4, 6, 8, 8.5];
y = [1.2, 1.95, 2, 2.4, 2.4, 2.7, 2.6];
z = [x;y]';
[a, r2] = cf_polyfit(z,3);

best_fit = a(1)*x.^3+a(2)*x.^2+a(3)*x+a(4)
figure
plot(x,y)
hold on
plot(x,best_fit)

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

%% Problem 8 (poly part)
clear all
clc
x = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];
y = [17, 24, 31, 33, 37, 37, 40, 40, 42, 41];
z = [x;y]';
[a, r2] = cf_polyfit(z,3);

best_fit = a(1)*x.^3+a(2)*x.^2+a(3)*x+a(4)
figure
plot(x,y)
hold on
plot(x,best_fit)

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