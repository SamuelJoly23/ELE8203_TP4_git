x0 = 0.4;
y0 = 0.3;
A = 0.1;
w = 1;
Kp_PC = 20;
Kd_PC = 10;
Ki = 18:1:20;
Kp = 35:1:40;
Kd = 0:1:5;
reg_type = 3;
%1 for open loop // 2 for pre-calculated torque // 3 for PID or PD+G
PID_mode = 2;
%1 for PD+g // 2 for PID
mean_erreur_min = 200000000;
Kp_final = 0;
Kd_final = 0;
Ki_final = 0;
Tsim =40;
step = 0;
for h = Kd
    for j = Ki
        for i = Kp
            sim('RRRplanaire.mdl');
            erreurX = rmse(traj_Xd.Data,traj_X.Data);
            erreurY = rmse(traj_Yd.Data,traj_Y.Data);
            Erreur_tot = erreurX+erreurY;
            step = step+1;
            disp(step)
            if Erreur_tot<mean_erreur_min
                mean_erreur_min = Erreur_tot
                Kd_final = h;
                Kp_final = i;
                Ki_final = j;
            end
        end
    end
end
