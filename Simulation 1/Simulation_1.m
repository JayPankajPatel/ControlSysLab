clc; clear; 
J = 0.01; % J is derived from Newton's 2nd Law equation 
b = 0.1;% b is derived from Newton's 2nd Law equation 
K = 0.01;% J is derived from Newton's 2nd Law equation
%link is:
%%https://ctms.engin.umich.edu/CTMS/index.php?example=MotorSpeed&section=SystemModeling#:~:text=From%20the%20figure%20above%2C%20we%20can%20derive%20the%20following%20governing%20equations%20based%20on%20Newton%27s%202nd%20law%20and%20Kirchhoff%27s%20voltage%20law.

R = 1; %derived from Kirchoff (Resistor)
L = 0.5;%derived from Kirchoff (inductor)
s = tf('s')%transfer function
P_motor = K/((J*s+b)*(L*s+R)+K^2)
x = step(P_motor); 
hold on
plot(x,'green')

%x2 = P_motor/(1+P_motor)
x2 = feedback(P_motor,1)
x2 = step(x2);
plot(x2,'blue')