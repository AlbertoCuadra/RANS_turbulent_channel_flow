% Plot configuration
color = colours;
set(figure(5),'innerposition',[750 450 550 400],...
        'outerposition',[750 450 550 400]);
set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y/h$','FontSize',16,'interpreter','latex');
ylabel('$k/u_\tau^2$','FontSize',16,'interpreter','latex');
k_dns = 0.5.*(d(1).d(:,4).^2 + d(1).d(:,5).^2 + d(1).d(:,6).^2);
dl21 = plot(d(1).d(:,1),k_dns,'color',color(1,:),'LineWidth',1.2);
dl22 = plot(y,k,'color',color(2,:),'LineWidth',1.2);
legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
tit = strcat('It $= ',num2str(it),',$ Nodes $ = ',num2str(n),'$');
title({tit},'Interpreter','latex','FontSize',16);
if savefigure
    filename = 'k-';
    filename2 = strcat(fpath,filename,num2str(cont));
    saveas(gcf,filename2,'epsc');
end