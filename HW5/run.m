

%% Problem 3
clc
clear all

x = [0, 5, 10, 15, 20];
y = [100, 200, 450, 950, 2000];
z = [x;y]';
[a, r2] = cf_polyfit(z,3)

%% Problem 4
clc
clear all
x = [ 0, 2, 4, 6, 9, 11, 12, 15, 17, 19];
y = [5, 6, 7, 6, 9, 8, 7, 10, 12, 12]; 
z = [x;y]';
[a, r2] = cf_polyfit(z,5)
