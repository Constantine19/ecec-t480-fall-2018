% Konstantin Zelmanovich
% Jayden Chen
% ECEC T480 - Numerical Methods
% Project 1

%% Bisection
clear all;
clc;
x = linspace(0, 100);
y = 50 * log(exp(1) + -2*((x/100).^2) + (3 - exp(1))*((x/100).^3));
y2 = 0.2 * (x.^2) / (2 * 9.8);
y3 = @(g) 50 * log(exp(1) + -2*((g/100).^2) + (3 - exp(1))*((g/100).^3)) - 0.2 * (g.^2) / (2 * 9.8);

%Original Pump
plot(x, y)
hold on

%Original Pump with a doubled output
plot(x, 2*y)
plot(2*x, y)
plot(x, y2)
title('Bisection method')
xlabel('Volumetric Flow Rate (m^3/s)')
ylabel('Head (m)')

% Pumps in series (doubled)
y4 = @(g) (50 * log(exp(1) + -2*((g/100).^2) + (3 - exp(1))*((g/100).^3))) *2 - 0.2 * (g.^2) / (2 * 9.8);

% Pumps in parallel
y5 = @(g) 50 * log(exp(1) + -2*((g*2/100).^2) + (3 - exp(1))*((g*2/100).^3)) - 0.2 * (g.^2) / (2 * 9.8);

fprintf('\n Bisection Approach of Original Pump: \n')
bisection(y3 ,0, 200, 50, 0.1) 

fprintf('\n False Position Approach of Original Pump: \n')
false_position(y3 ,0, 200, 50, 0.1)

fprintf('\n Bisection Approach of Series Pump: \n')
bisection(y4 ,0, 200, 50, 0.1) 

fprintf('\n False Position Approach of Series Pump: \n')
false_position(y4 ,0, 200, 50, 0.1)

fprintf('\n Bisection Approach of Parallel Pump: \n')
bisection(y5 ,0, 200, 50, 0.1) 

fprintf('\n False Position Approach of Parallel Pump: \n')
false_position(y5 ,0, 200, 50, 0.1)

%Plotting Pump Original
x = 59.6;
y2 = 0.2 * (x.^2) / (2 * 9.8);
plot(x, y2, 'o')

% Plotting Pump in Series
x = 73.74;
y2 = 0.2 * (x.^2) / (2 * 9.8);
plot(x, y2, 'o')

% Plotting Pump in Parallel
x = 66.67;
y2 = 0.2 * (x.^2) / (2 * 9.8);
plot(x, y2, 'o')


legend({'x1 = 59.6','x2 = 73.74', 'x3 = 66.67'},'Location','northeast')




%% False-Position
clear all;
clc;
x = linspace(0, 100);
y = 50 * log(exp(1) + -2*((x/100).^2) + (3 - exp(1))*((x/100).^3));
y2 = 0.2 * (x.^2) / (2 * 9.8);
y3 = @(g) 50 * log(exp(1) + -2*((g/100).^2) + (3 - exp(1))*((g/100).^3)) - 0.2 * (g.^2) / (2 * 9.8);

%Original Pump
plot(x, y)
hold on

%Original Pump with a doubled output
plot(x, 2*y)
plot(2*x, y)
plot(x, y2)
title('False-Position method')
xlabel('Volumetric Flow Rate (m^3/s)')
ylabel('Head (m)')

%Plotting Pump Original
x = 59.6;
y2 = 0.2 * (x.^2) / (2 * 9.8);
plot(x, y2, 'o')

% Plotting Pump in Series
x = 73.74;
y2 = 0.2 * (x.^2) / (2 * 9.8);
plot(x, y2, 'o')

% Plotting Pump in Parallel
x = 66.67;
y2 = 0.2 * (x.^2) / (2 * 9.8);
plot(x, y2, 'o')

legend({'x1 = 59.6','x2 = 73.74', 'x3 = 66.67'},'Location','northeast')
