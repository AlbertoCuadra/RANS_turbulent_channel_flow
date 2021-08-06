% Plot configuration
color = colours;
set(figure(8),'innerposition',[750 50 550 400],...
        'outerposition',[750 50 550 400]);
set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y/h$','FontSize',16,'interpreter','latex');
ylabel('$\nu_\tau/(u_\tau h)$','FontSize',16,'interpreter','latex');
dl41 = plot(y_dns(1:end-1),nut_dns,'color',color(1,:),'LineWidth',1.2);
legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
tit = strcat('It $= ',num2str(it),',$ Nodes $ = ',num2str(n),'$');
title({tit},'Interpreter','latex','FontSize',16);
if savefigure
    filename = 'nut-';
    filename2 = strcat(fpath,filename,num2str(cont));
    saveas(gcf,filename2,'epsc');
end