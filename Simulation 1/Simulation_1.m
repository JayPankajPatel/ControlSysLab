clc; clear; close all; 
J = 0.01;   % J is derived from Newton's 2nd Law equation, moment of interia
b = 0.1;    % b is derived from Newton's 2nd Law equation, motor friction
K = 0.01;   % J is derived from Newton's 2nd Law equation, electromotive force constant
%link is:
%%https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling#:~:text=From%20the%20figure%20above%2C%20we%20can%20derive%20the%20following%20governing%20equations%20based%20on%20Newton%27s%202nd%20law%20and%20Kirchhoff%27s%20voltage%20law.

R = 1;                      %derived from Kirchoff (Resistor)
L = 0.5;                    %derived from Kirchoff (Inductor)

num = [.01]                 % Coefficents of Transfer Function
denom =[0.005 0.06 .1001]   %
P_motor = tf(num,denom)     % Open Loop Transfer Function

%x2 = P_motor/(1+P_motor)   % Equation Implementation of Feedback loop
x2 = feedback(P_motor,1)    % Closed Loop Transfer Function

step(P_motor,x2)            % Open Loop(P_motor) Overlaid with Closed Loop (x2)
legend('Open Loop', 'Closed Loop')
title('Open Loop and Closed Loop Comparison')


