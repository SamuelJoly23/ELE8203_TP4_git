% TP4
% Parameters for simulink file
x0 = 0.4;
y0 = 0.3;
A = 0.1;
w = 1;
Kp_PC = 20;
Kd_PC = 10;
Ki = 17;
Kp = 39;
Kd = 7;
reg_type = 2;
%1 for open loop // 2 for pre-calculated torque // 3 for PID or PD+G
PID_mode = 1;
%1 for PD+g // 2 for PID

Tsim =40;

sim('RRRplanaire.mdl');


path = "fig\";
% Code pour produire graphique avec un plot
fig = figure();
plot(traj_Xd.data,traj_Yd.data,'LineWidth',2)

hold on  
grid minor 
plot(traj_X_PID.data,traj_Y_PID.data) 
plot(traj_X_PD_g.data,traj_Y_PD_g.data) 
plot(traj_X_PC_torque.data,traj_Y_PC_torque.data) 
title("Evolution des trajectoires",'Interpreter','latex','FontSize',12)
% xlim([0.27 0.53])

xlabel('x[m]','Interpreter','latex','FontSize',12) % abscisses

ylabel('y[m]','Interpreter','latex','FontSize',12) % Ordonnee

string = {"Traj d\'esir\'ee","Traj PID", "Traj PD+g", "Traj PCTorque"}; % Deux entrees pour la legende (dans l'ordre!)
legend(string,'Interpreter','latex','FontSize',12,'Location','southeast')

nom_image = "trajs"; %Renommer le fichier
print(fig,'-dpng','-r600',strcat(path,nom_image,'.png'))
