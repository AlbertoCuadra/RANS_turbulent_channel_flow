% Production vs Dissipation
npoint = 1;
load_results
% ---------------------------------------
% TKE 
P_tke = nut_tke.*difx(u_tke,y_tke).*difx(u_tke,y_tke);
Pdis_tke = P_tke ./ep_tke;
Pdis_tke(1:2) = 0; % Wrong values
% k-epsilon 1
P_kep = nut_kepsilon.*difx(u_kepsilon,y_kepsilon).*difx(u_kepsilon,y_kepsilon);
ep_kep = ep_kepsilon + D_kepsilon;
Pdis_kepsilon = P_kep./ep_kep;
% k-epsilon 2
P_kep2 = nut_kepsilon2.*difx(u_kepsilon2,y_kepsilon2).*difx(u_kepsilon2,y_kepsilon2);
D2 = 0;
ep_kep2 = ep_kepsilon2 + D2;
Pdis_kepsilon2 = P_kep2./ep_kep2;
% -----------------------------------------
Pdis_dns = -d(2).d(:,4)./d(2).d(:,3);
x_line = linspace(0,1);
y_line = ones(length(x_line),1);
% Plot configuration
leg{1}='DNS'; leg{2}='TKE'; leg{3}='$k-\epsilon_{C}$';
leg{4}='$k-\epsilon_{NT}$';
% leg{6}='$u^+ = y^+$';

color = colours;
fig = figure;
set(fig,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.8,'FontSize',17.9,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
% xlim([0,Re])
ylim([0,1.9])
% xlabel('$y^+ = Re_\tau y/h $','FontSize',20,'interpreter','latex');
xlabel('$y/h $','FontSize',24,'interpreter','latex');
ylabel('$P/\epsilon$','FontSize',24,'interpreter','latex');

plot(y_dns,Pdis_dns,'-','color',color(1,:),'LineWidth',2.4,...
    'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_tke,Pdis_tke,'-','color',color(2,:),'LineWidth',2.4,...
    'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon,Pdis_kepsilon,'-','color',color(3,:),'LineWidth',2.4,...
    'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
plot(y_kepsilon2,Pdis_kepsilon2,'-','color',color(4,:),'LineWidth',2.4,...
    'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
    'MarkerSize',6)
% set(gca,'xscale','log')
plot(x_line,y_line,'--','color','black','LineWidth',2.4)

legend(leg,'FontSize',24,'Location','northeastoutside','interpreter','latex')
% tit = strcat('$\langle u\rangle /u_\tau, Re_\tau = ',num2str(Re),'$');
tit = strcat('$Re_\tau = ',num2str(Re),'$');
title({tit},'Interpreter','latex','FontSize',24);
filename2 = strcat(fpath,strcat('P_ep',num2str(Re)));
saveas(fig,filename2,'epsc');
%%

% 
% plot(y_kepsilon*Re,u_kepsilon,'-','color',color(4,:),'LineWidth',2,...
%     'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
%     'MarkerSize',6)
% plot(y_kepsilon2*Re,u_kepsilon2,'-','color',color(5,:),'LineWidth',2,...
%     'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
%     'MarkerSize',6)
% plot(y_dns(1:dnsplot1).*Re,y_dns(1:dnsplot1).*Re,'--','color','black','LineWidth',2)
% plot(y_dns(dnsplot2:end).*Re,1/0.41.*log(y_dns(dnsplot2:end).*Re)+5.2,'--','color','black','LineWidth',2)
% set(gca,'xscale','log')
% legend(leg,'FontSize',20,'Location','northeastoutside','interpreter','latex')
% % tit = strcat('$\langle u\rangle /u_\tau, Re_\tau = ',num2str(Re),'$');
% tit = strcat('$Re_\tau = ',num2str(Re),'$');
% title({tit},'Interpreter','latex','FontSize',20);


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

