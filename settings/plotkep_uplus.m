% Plot all k-epsilon models
% Plot configuration
leg{1}='$DNS$'; leg{2}='$k-\epsilon_{C}$'; 
leg{3}='$k-\epsilon_{NT}$'; leg{4}='$k-\epsilon_{LS}$';
% leg{5}='$k-\epsilon_{LB}$';
color = colours;
fig = figure;
set(fig,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.4,'FontSize',16,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y^+ = Re_\tau y/h $','FontSize',20,'interpreter','latex');
ylabel('$u^+ = \langle u\rangle /u_\tau$','FontSize',20,'interpreter','latex');

plot(y_dns.*Re,u_dns,'o','color',color(1,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon*Re,u_kepsilon,'s','color',color(3,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon2*Re,u_kepsilon2,'d','color',color(4,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon3*Re,u_kepsilon3,'v','color',color(5,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
% plot(y_kepsilon4*Re,u_kepsilon4,'v','color',color(5,:),'LineWidth',1.4,...
%     'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
%     'MarkerSize',6)
plot(y_dns(1:15).*Re,y_dns(1:15).*Re,'--','color','black','LineWidth',1.4)
plot(y_dns(8:end).*Re,1/0.41.*log(y_dns(8:end).*Re)+5.2,'--','color','black','LineWidth',1.4)
set(gca,'xscale','log')
legend(leg,'FontSize',20,'Location','northeastoutside','interpreter','latex')
tit = strcat('$Re_\tau = ',num2str(Re),'$');
title({tit},'Interpreter','latex','FontSize',20);

filename2 = strcat(fpath,strcat('allkep_uplus',num2str(Re)));
saveas(fig,filename2,'epsc');