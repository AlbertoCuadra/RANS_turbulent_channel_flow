% Plot Mixing, TKE and k-epsilon
% Plot configuration
descr = {strcat('$N_{DNS} = ',num2str(length(y_dns)),'$');
        strcat('$N_{mixing} = ',num2str(length(y_mixing)),'$');
         strcat('$N_{TKE} = ',num2str(length(y_tke)),'$');
         strcat('$N_{k-\epsilon_C} = ',num2str(length(y_kepsilon)),'$');
         strcat('$N_{k-\epsilon_{NT}} = ',num2str(length(y_kepsilon2)),'$')};
leg{1}='DNS'; leg{2}='Mixing'; leg{3}='TKE'; leg{4}='$k-\epsilon_{C}$';
leg{5}='$k-\epsilon_{NT}$';
color = colours;
fig = figure;
set(fig,'innerposition',[250 150 1000 600],...
        'outerposition',[250 150 1000 600]);
set(axes,'LineWidth',1.4,'FontSize',16,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
% text(18,3.75,descr,'interpreter','latex','FontSize',26,'Units','centimeters')
xlabel('$y^+ = Re_\tau y/h$','FontSize',20,'interpreter','latex');
ylabel('$\nu^+_t = \nu_\tau(u_\tau/h)$','FontSize',20,'interpreter','latex');
plot(d(1).d(1:end-1,1).*Re,nut_dns,'-o','color',color(1,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_mixing.*Re,nut_mixing,'-<','color',color(2,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_tke.*Re,nut_tke,'-s','color',color(3,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon.*Re,nut_kepsilon,'-d','color',color(4,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon2*Re,nut_kepsilon2,'-v','color',color(5,:),'LineWidth',1.4,...
    'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
set(gca,'xscale','log')
legend(leg,'FontSize',20,'Location','northeastoutside','interpreter','latex');
tit = strcat('$Re_\tau = ',num2str(Re),'$');
title({tit},'Interpreter','latex','FontSize',20);
filename2 = strcat(fpath,strcat('all_nutplus',num2str(Re)));
saveas(fig,filename2,'epsc');