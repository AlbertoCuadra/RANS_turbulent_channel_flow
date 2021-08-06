% Plot configuration
color = colours;
set(figure(4),'innerposition',[175 450 550 400],...
        'outerposition',[175 450 550 400]);
% set(figure(4),'innerposition',[250 150 1000 600],...
%         'outerposition',[250 150 1000 600]);
set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
% set(axes,'LineWidth',1.2,'FontSize',16,'BoxStyle','full')    
grid on; box on; hold on;
xlabel('$y/h$','FontSize',16,'interpreter','latex');
% xlabel('$y/h$','FontSize',20,'interpreter','latex');
ylabel('$\langle u\rangle /u_\tau$','FontSize',16,'interpreter','latex');
% ylim([0,25])
% dl1 = plot(d(1).d(:,1),d(1).d(:,3),'color',color(1,:),'LineWidth',1.2);
dl1 = plot(d(1).d(:,1),d(1).d(:,3),'-','color',color(1,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
        'MarkerSize',4);
% dl1 = plot(d(1).d(:,2),d(1).d(:,3),'color',color(1,:),'LineWidth',1.2);
% dl2 = plot(y,u,'color',color(2,:),'LineWidth',1.2);
dl2 = plot(y,u,'-','color',color(2,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
        'MarkerSize',5);
% dl2 = plot(yplus,u,'color',color(2,:),'LineWidth',1.2);
legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
tit = strcat('It $= ',num2str(it),',$ Nodes $ = ',num2str(n),'$');
title({tit},'Interpreter','latex','FontSize',20);
if savefigure
    filename = 'u-';
    filename2 = strcat(fpath,filename,num2str(cont));
    saveas(gcf,filename2,'epsc');
end