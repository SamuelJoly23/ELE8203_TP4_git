% TP4
% Parameters for simulink file
x0 = 0.4;
y0 = 0.3;
A = 0.1;
w = 1;
Kp_PC = 20;
Kd_PC = 10;
Ki = 19.9;
Kp = 39.9;
Kd = 2;
reg_type = 3;
%1 for open loop // 2 for pre-calculated torque // 3 for PID or PD+G
PID_mode = 2;
%1 for PD+g // 2 for PID
Tsim = 40;
sim('RRRplanaire.mdl');
