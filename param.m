% TP4
% Parameters for simulink file
x0 = 0.4;
y0 = 0.3;
A = 0.1;
w = 1;
Kp_PC = 20;
Kd_PC = 10;
Ki = 19.9;%18:1:20;
Kp = 39.9;%35:1:40;
Kd = 2;%0:1:5;
reg_type = 3;
%1 for open loop // 2 for pre-calculated torque // 3 for PID or PD+G
PID_mode = 2;
%1 for PD+g // 2 for PID
mean_erreur_min = 200000000;
% Kp_final = 0;
% Kd_final = 0;
% Ki_final = 0;
% Tsim =40;
% step = 0;
% for h = Kd
%     for j = Ki
%         for i = Kp
%             sim('RRRplanaire.mdl');
%             erreurX = rmse(traj_Xd.Data,traj_X.Data);
%             erreurY = rmse(traj_Yd.Data,traj_Y.Data);
%             Erreur_tot = erreurX+erreurY;
%             step = step+1;
%             disp(step)
%             if Erreur_tot<mean_erreur_min
%                 mean_erreur_min = Erreur_tot
%                 Kd_final = h;
%                 Kp_final = i;
%                 Ki_final = j;
%             end
%         end
%     end
% end

            




sim('RRRplanaire.mdl');
path = "fig\";
% Code pour produire graphique avec un plot
fig = figure();
plot(traj_Xd.data,traj_Yd.data,'LineWidth',2)

hold on  
grid minor 
plot(traj_X.data,traj_Y.data) 
% plot(traj_X_PD_g.data,traj_Y_PD_g.data) 
% plot(traj_X_PC_torque.data,traj_Y_PC_torque.data) 
title("Evolution des trajectoires",'Interpreter','latex','FontSize',12)
% xlim([0.27 0.53])

xlabel('x[m]','Interpreter','latex','FontSize',12) % abscisses

ylabel('y[m]','Interpreter','latex','FontSize',12) % Ordonnee

string = {"Traj d\'esir\'ee","Traj PID", "Traj PD+g", "Traj PCTorque"}; % Deux entrees pour la legende (dans l'ordre!)
legend(string,'Interpreter','latex','FontSize',12,'Location','southeast')

nom_image = "trajs"; %Renommer le fichier
print(fig,'-dpng','-r600',strcat(path,nom_image,'.png'))
