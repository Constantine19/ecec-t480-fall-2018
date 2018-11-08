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