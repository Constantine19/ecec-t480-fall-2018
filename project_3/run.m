% Project 3
% Konstantin Zelmanovich
% Jayden Chen

%% Project 3
clc
clear all
clf 
M = csvread('Curve Tracer Data.csv');

v10 = M(:,3);
i10 = M(:,4);

v20 = M(:,5);
i20 = M(:,6);

v30 = M(:,7);
i30 = M(:,8);

v40 = M(:,9);
i40 = M(:,10);

v10 = v10(v10 ~= 0.0);
i10 = i10(1:length(v10));

v20 = v20(v20 ~= 0.0);
i20 = i20(1:length(v20));

v30 = v30(v30 ~= 0.0);
i30 = i30(1:length(v30));

v40 = v40(v40 ~= 0.0);
i40 = i40(1:length(v40));
vcc = 20;
rc = 2;
vce = linspace(0,20);
ic = vcc/rc - (1/rc)*vce;

for i = 1:length(v10)
    
end
i_v40 = 3.434;
i_i40 = 8.283;
i_v30 = 8.081;
i_i30 = 5.96;
i_v20 = 12.32;
i_i20 = 3.838;
i_v10 = 16.77;
i_i10 = 1.616;
hold on
plot(v10, i10)
plot(v20, i20)
plot(v30, i30)
plot(v40, i40)
plot(vce, ic)
plot(i_v40, i_i40, 'o', i_v30, i_i30, 'o', i_v20, i_i20, 'o', i_v10, i_i10, 'o');
legend('Ib = 10uA', 'Ib = 20uA', 'Ib = 30uA', 'I = 40uA')
xlabel('I collector (mA)');
ylabel('V ce (V)');
text(i_v40, i_i40, "V = 3.434 I = 8.28 mA B = 206.87")
text(i_v30, i_i30, 'V = 8.081 I = 5.96 mA B = 198.53')
text(i_v20, i_i20, 'V = 12.32 I = 3.84 mA B = 191.75')
text(i_v10, i_i10, 'V = 16.77 I = 1.62 mA B = 161.50')

hold off