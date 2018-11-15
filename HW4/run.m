%% HW1
clear all
clc

initial_condition1 = [1;0];
initial_condition2 = [0;1];
initial_condition3 = [1;1];
x1 = [];
x2 = [];
x3 = [];
time = 0:.01:10;
for k = 1:100
    t = time(k);
    x1 = [ x1, [cos(t) sint(t); -sin(t) cos(t)]*initial_condition1];
    x2 = [ x2, [cos(t) sint(t); -sin(t) cos(t)]*initial_condition2];
    x2 = [ x2, [cos(t) sint(t); -sin(t) cos(t)]*initial_condition3];
end

plot(x1(1,:), x1(2,:))