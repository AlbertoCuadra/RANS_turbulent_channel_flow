% Plot all k-epsilon models
% Plot configuration
leg{1}='$DNS$'; leg{2}='$k-\epsilon_{C}$'; 
leg{3}='$k-\epsilon_{NT}$'; leg{4}='$k-\epsilon_{LS}$';
% leg{5}='$k-\epsilon_{LB}$';
color = colours;
fig = figure;
set(fig,'innerposition',[250 150 1000 600],...
        'outerposition',[250 150 1000 600]);
set(axes,'LineWidth',1.4,'FontSize',16,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
% text(18,4.25,descr,'interpreter','latex','FontSize',26,'Units','centimeters')
xlabel('$y^+ = Re_\tau y/h$','FontSize',20,'interpreter','latex');
ylabel('$k^+ = k/u_\tau^2$','FontSize',20,'interpreter','latex');
plot(y_dns*Re,k_dns,'-o','color',color(1,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
    'MarkerSize',6);
plot(y_kepsilon*Re,k_kepsilon,'-s','color',color(3,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon2*Re,k_kepsilon2,'-d','color',color(4,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon3*Re,k_kepsilon3,'-v','color',color(5,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
set(gca,'xscale','log')
legend(leg,'FontSize',20,'Location','northeastoutside','interpreter','latex');
tit = strcat('$Re_\tau = ',num2str(Re),'$');
title({tit},'Interpreter','latex','FontSize',20);
filename2 = strcat(fpath,strcat('allkep_kplus',num2str(Re)));
saveas(fig,filename2,'epsc');