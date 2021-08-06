function plotfun1(d,y,u,it)
% Plot configuration
color = colours;
set(figure(1),'innerposition',[300 150 800 600],...
        'outerposition',[300 150 800 600]);
set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y/h$','FontSize',16,'interpreter','latex');
ylabel('$u^+$','FontSize',16,'interpreter','latex');
leg{1}='DNS';
leg{2}='Mixing length';
dl1 = plot(d(1).d(:,1),d(1).d(:,3),'color',color(1,:),'LineWidth',1.2);
dl2 = plot(y,u,'color',color(2,:),'LineWidth',1.2);

legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
tit = strcat('It = ',num2str(it));
title({tit},'Interpreter','latex','FontSize',16);
% filename2 = strcat(fpath,filename);
% saveas(fig,filename2,'epsc');