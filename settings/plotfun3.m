% Plot configuration
color = colours;
set(figure(7),'innerposition',[175 50 550 400],...
        'outerposition',[175 50 550 400]);
set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y/h$','FontSize',16,'interpreter','latex');
ylabel('$\tilde{\epsilon}/(u_\tau^3/h)$','FontSize',16,'interpreter','latex');
% dl31 = plot(y_dns,ep_dns,'color',color(1,:),'LineWidth',1.2);
if model ~=2
    dl32 = plot(y,ep,'color',color(2,:),'LineWidth',1.2);
end
legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
tit = strcat('It $= ',num2str(it),',$ Nodes $ = ',num2str(n),'$');
title({tit},'Interpreter','latex','FontSize',16);
if savefigure
    filename = 'ep-';
    filename2 = strcat(fpath,filename,num2str(cont));
    saveas(gcf,filename2,'epsc');
end