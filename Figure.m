Tsim =40;
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
