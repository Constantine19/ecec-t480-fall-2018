% Project 2
% Konstantin Zelmanovich
% Jayden Chen

%% Project 2
clear all
clc
format long

% Initial values
L = 10;
e = 0.25/1000;
p = 1000;
u = 0.001;
D1 = 0.2;
g = 9.81;
A1 = ((D1/2)^2)*pi();
RR1 = e/(D1);
data = [];
data1 = [];

% Mass flow rate, Friction factor, Reynolds number, Head loss
for D2 = 0.03:0.01:0.5
    RR2 = e/D2;
    A2 = ((D2/2)^2)*pi();
    HL_Diff = 9999999999;
    m1_perm = 0;
    
    for m = 0.01:0.01:5
        m1 = m;
        m2 = 5-m1;

        % Calculating Mass flow rate
        v1 = m1/(p*A1);
        v2 = m2/(p*A2);

        % Calculating Reynolds number
        Re1 = p*v1*D1/u;
        Re2 = p*v2*D2/u;

        % Calculating Friction factor
        y1 = @(f) 1/sqrt(f) + 2*log10( (e/D1)/3.7 + 2.51/(Re1*sqrt(f)));
        dy1 = @(f) (sqrt(f) *(-0.5*RR1*Re1 - 4.03329) - 4.6435) / (RR1* f^2 * Re1 + 9.287*f^1.5);
        
        y2 = @(f) 1/sqrt(f) + 2*log10( (e/D2)/3.7 + 2.51/(Re2*sqrt(f)));
        dy2 = @(f) (sqrt(f) *(-0.5*RR2*Re2 - 4.03329) - 4.6435) / (RR2* f^2 * Re2 + 9.287*f^1.5);
        
        fy1 = newton_rhapson(y1, dy1, 0.04, 10, 0.001);
        a = size(fy1);
        fy1_num = fy1(a(1),2);
        fy2 = newton_rhapson(y2, dy2, 0.04, 10, 0.001);
        b = size(fy2);
        fy2_num = fy2(b(1),2);
        
        % Calculating Head Loss
        HL1 = fy1_num*L*(v1^2)/(D1*2*g);
        HL2 = fy2_num*L*(v2^2)/(D2*2*g);
        if abs(HL1-HL2) < HL_Diff
            HL_Diff = abs(HL1-HL2);
            m2_perm = m2;
            HL_perm = HL2;
            Re_perm = Re2;
            f_perm = fy2_num;
            m1_perm = m1;
            HL1_perm = HL1;
            Re1_perm = Re1;
            f1_perm = fy1_num;
        end 
    end
    
    data = [data;D2 m2_perm f_perm Re_perm HL_perm];
    data1 = [data1; D1 m1_perm f1_perm Re1_perm HL1_perm];

end

figure(1)
grid on
semilogx(data(:,1),data(:,2))
hold on
semilogx(data(:,1),data1(:,2))
legend('Pipe2','Pipe1')
xlabel('Diameter of Pipe2 (m)')
ylabel('Mass Flow Rate (kg/s)')
title('Mass Flow Rate')
hold off


figure(2)
grid on
semilogx(data(:,1),data(:,3))
hold on
semilogx(data(:,1),data1(:,3))
legend('Pipe2','Pipe1')
xlabel('Diameter of Pipe2 (m)')
ylabel('Friction Factor')
title('Friction Factors')
hold off

figure(3)
grid on
semilogx(data(:,1),data(:,4))
hold on
semilogx(data(:,1),data1(:,4))
legend('Pipe2','Pipe1')
xlabel('Diameter of Pipe2 (m)')
ylabel('Reynolds Numbers')
title('Reynold Numbers')
hold off

figure(4)
grid on
semilogx(data(:,1),data(:,5))
hold on
semilogx(data(:,1),data1(:,5))
legend('Pipe2','Pipe1')
xlabel('Diameter of Pipe2 (m)')
ylabel('Head Loss  (m*s)')
title('Head Loss')
hold off

figure(5)
grid on
semilogx(data(:,3),data(:,4))
hold on
semilogx(data1(:,3),data1(:,4))
legend('Pipe2','Pipe1')
xlabel('Friction Factor')
ylabel('Reynolds Number')
title('Friction Factor vs Reynolds Number')
hold off


