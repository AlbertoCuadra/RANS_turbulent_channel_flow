% Plot Mixing, TKE and k-epsilon
x_aux = 5.*ones(100,1);
y_aux = linspace(0,7);
x_aux2 = 30.*ones(100,1);
x_aux3 = 1000.*ones(100,1); % outer region
% Plot configuration
descr = {strcat('$N_{DNS} = ',num2str(length(y_dns)),'$');
         strcat('$N_{mixing} = ',num2str(length(y_dns)),'$');
         strcat('$N_{TKE} = ',num2str(length(y_dns)),'$');
         strcat('$N_{k-\epsilon_C} = ',num2str(length(y_dns)),'$')};
leg{1}='DNS'; leg{2}='Mixing'; 
leg{3}='TKE'; leg{4}='$k-\epsilon_{C}$';
leg{5}='$k-\epsilon_{NT}$';
% leg{6}='$u^+ = y^+$';
color = colours;
fig = figure;
set(fig,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.4,'FontSize',16,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
% text(18,3.75,descr,'interpreter','latex','FontSize',26,'Units','centimeters')
xlabel('$y^+ = Re_\tau y/h $','FontSize',20,'interpreter','latex');
ylabel('$u^+ = \langle u\rangle /u_\tau$','FontSize',20,'interpreter','latex');


plot(y_dns.*Re,u_dns,'-','color',color(1,:),'LineWidth',2,...
    'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_mixing*Re,u_mixing,'-','color',color(2,:),'LineWidth',2,...
    'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_tke*Re,u_tke,'-','color',color(3,:),'LineWidth',2,...
    'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon*Re,u_kepsilon,'-','color',color(4,:),'LineWidth',2,...
    'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon2*Re,u_kepsilon2,'-','color',color(5,:),'LineWidth',2,...
    'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_dns(1:dnsplot1).*Re,y_dns(1:dnsplot1).*Re,'--','color','black','LineWidth',2)
plot(y_dns(dnsplot2:end).*Re,1/0.41.*log(y_dns(dnsplot2:end).*Re)+5.2,'--','color','black','LineWidth',2)
plot(x_aux,y_aux,'--','color','black','LineWidth',2)
plot(x_aux2,y_aux,'--','color','black','LineWidth',2)
plot(x_aux3,y_aux*2,'--','color','black','LineWidth',2)
set(gca,'xscale','log')
legend(leg,'FontSize',20,'Location','northeastoutside','interpreter','latex')
% tit = strcat('$\langle u\rangle /u_\tau, Re_\tau = ',num2str(Re),'$');
tit = strcat('$Re_\tau = ',num2str(Re),'$');
title({tit},'Interpreter','latex','FontSize',20);


% text(0.5,14,'$u^+ = y^+ \rightarrow$','interpreter','latex','FontSize',26)

% ax1 = gca;
% ax1_pos = ax1.Position; % position of first axes
% ax2 = axes('Position',ax1_pos,...
%     'XAxisLocation','top',...
%     'YAxisLocation','right',...
%     'Color','none');
% % 
% set(ax2,'ytick',[])
% set(ax2,'LineWidth',1.4,'FontSize',16,'BoxStyle','full')  
% grid(ax2,'off'); box(ax2,'off'); hold(ax2,'off');
% xlabel(ax2,'$y/h$','FontSize',20,'interpreter','latex');

if savefigure
    filename2 = strcat(fpath,strcat('all_uplus2',num2str(Re)));
    saveas(fig,filename2,'epsc');
end