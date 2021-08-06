% Plot Mixing, TKE and k-epsilon
x_aux = 5.*ones(100,1);
y_aux = linspace(0,max(ep_tke));
x_aux2 = 30.*ones(100,1);
% Plot configuration
descr = {strcat('$N_{DNS} = ',num2str(length(y_dns)),'$');
         strcat('$N_{TKE} = ',num2str(length(y_tke)),'$');
         strcat('$N_{k-\epsilon} = ',num2str(length(y_kepsilon)),'$');
         strcat('$N_{k-\epsilon_{NT}} = ',num2str(length(y_kepsilon2)),'$')};
leg{1}='DNS'; leg{2}='TKE'; leg{3}='$k-\epsilon_{C}$';
leg{4}='$k-\epsilon_{NT}$';
color = colours;
fig = figure;
set(fig,'innerposition',[250 150 1000 600],...
        'outerposition',[250 150 1000 600]);
set(axes,'LineWidth',1.4,'FontSize',16,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
% text(18,4.25,descr,'interpreter','latex','FontSize',26,'Units','centimeters')
xlabel('$y^+ = Re_\tau y/h$','FontSize',20,'interpreter','latex');
ylabel('$\epsilon^+ = \epsilon/(u_\tau^3/h)$','FontSize',20,'interpreter','latex');
plot(y_dns.*Re,ep_dns,'-','color',color(1,:),'LineWidth',2,...
    'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_tke.*Re,ep_tke,'-','color',color(3,:),'LineWidth',2,...
    'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon.*Re,ep_kepsilon+D_kepsilon,'-','color',color(4,:),'LineWidth',2,...
    'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon2*Re,ep_kepsilon2,'-','color',color(5,:),'LineWidth',2,...
    'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(x_aux,y_aux,'--','color','black','LineWidth',2)
plot(x_aux2,y_aux,'--','color','black','LineWidth',2)
set(gca,'xscale','log')
legend(leg(1:4),'FontSize',20,'Location','northeastoutside','interpreter','latex');
tit = strcat('$Re_\tau = ',num2str(Re),'$');
title({tit},'Interpreter','latex','FontSize',20);
filename2 = strcat(fpath,strcat('all_epplus2',num2str(Re)));
saveas(fig,filename2,'epsc');