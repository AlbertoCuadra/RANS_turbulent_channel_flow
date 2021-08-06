% Velocity-defect law
Re_vec = [180,550,2000];
color = colours;
leg{1}= '$Re_\tau = 180$';
leg{2}= '$Re_\tau = 550$';
leg{3}= '$Re_\tau = 2000$';

fig = figure;
set(fig,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.4,'FontSize',20,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y/h $','FontSize',26,'interpreter','latex');
ylabel('$u_{max}^+ - u^+(y)$','FontSize',26,'interpreter','latex');

for i=1:3
    load(strcat('kepsilon_',num2str(Re_vec(i)),'.mat'));
    umax = max(u_kepsilon);
    uplot = umax-u_kepsilon;
    tau_v = 1/Re_vec(i).*difx(u_kepsilon,y_kepsilon);
    plot(y_kepsilon,uplot,'color',color(i,:),'LineWidth',2.4)
end

legend(leg,'FontSize',26,'Location','northeastoutside','interpreter','latex')
tit = 'Velocity-defect law';
title({tit},'Interpreter','latex','FontSize',26);

filename2 = strcat(fpath,strcat('velocity'));
saveas(fig,filename2,'epsc');