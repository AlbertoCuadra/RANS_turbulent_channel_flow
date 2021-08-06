% Plot Viscous vs Reynolds stresses
% Viscous stresses
x_aux = linspace(0,1);
y_aux = 1-x_aux;
Re_vec = [180,550,2000];

color = colours;
leg{1}= '$Re_\tau = 180$';
leg{2}= '$Re_\tau = 550$';
leg{3}= '$Re_\tau = 2000$';

fig1 = figure;
set(fig1,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.4,'FontSize',20,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
% text(18,3.75,descr,'interpreter','latex','FontSize',26,'Units','centimeters')
xlabel('$y/h$','FontSize',26,'interpreter','latex');
ylabel('$\langle \tau_{12}^*\rangle$','FontSize',26,'interpreter','latex');
xlim([0,1])
ylim([0,1])


for i=1:3
    load(strcat('kepsilon_',num2str(Re_vec(i)),'.mat'));
    tau_v = 1/Re_vec(i).*difx(u_kepsilon,y_kepsilon);
    plot(y_kepsilon,tau_v,'color',color(i,:),'LineWidth',2)
end
plot(x_aux,y_aux,'color','black','LineWidth',2)
legend(leg,'FontSize',26,'Location','northeastoutside','interpreter','latex')
tit1 = strcat('Viscous stresses');
title({tit1},'Interpreter','latex','FontSize',26);    
filename2 = strcat(fpath,strcat('tau_v'));
saveas(fig1,filename2,'epsc');
%% Reynolds stresses
fig2 = figure;
set(fig2,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.4,'FontSize',20,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y/h $','FontSize',26,'interpreter','latex');
ylabel('$\tau_{12}^{R*}$','FontSize',26,'interpreter','latex');
xlim([0,1])
ylim([0,1])

for i=1:3
    load(strcat('kepsilon_',num2str(Re_vec(i)),'.mat'));
    tau_12 = -nut_kepsilon.*difx(u_kepsilon,y_kepsilon);
    plot(y_kepsilon,-tau_12,'color',color(i,:),'LineWidth',2)
end
plot(x_aux,y_aux,'color','black','LineWidth',2)
legend(leg,'FontSize',26,'Location','northeastoutside','interpreter','latex')
tit2 = strcat('Reynolds stresses');
title({tit2},'Interpreter','latex','FontSize',26);

filename2 = strcat(fpath,strcat('tau_R'));
saveas(fig2,filename2,'epsc');
%% Viscous vs Reynolds stresses
fig3 = figure;
set(fig3,'innerposition',[250 150 1100 700],...
        'outerposition',[250 150 1100 700]);
set(axes,'LineWidth',1.4,'FontSize',20,'BoxStyle','full')    
grid on; box on; hold on; axis tight;
xlabel('$y^+ = Re_\tau y/h $','FontSize',26,'interpreter','latex');
ylabel('Relative contribution','FontSize',26,'interpreter','latex');
xlim([0,100])
ylim([0,1])

leg2{1}= '$Re_\tau = 180$';
leg2{2}= '$Re_\tau = 180$';
leg2{3}= '$Re_\tau = 550$';
leg2{4}= '$Re_\tau = 550$';
leg2{5}= '$Re_\tau = 2000$';
leg2{6}= '$Re_\tau = 2000$';

for i=1:3
    load(strcat('kepsilon_',num2str(Re_vec(i)),'.mat'));
    tau_v = 1/Re_vec(i).*difx(u_kepsilon,y_kepsilon);
    tau_12 = -nut_kepsilon.*difx(u_kepsilon,y_kepsilon);
    tau = tau_v+abs(tau_12);
    h(i) = plot(y_kepsilon.*Re_vec(i),tau_v./tau,'color',color(i,:),'LineWidth',2.4);
    plot(y_kepsilon.*Re_vec(i),-tau_12./tau,'color',color(i,:),'LineWidth',2.4)
end
legend(h,leg2(1:2:end),'FontSize',26,'Location','best','interpreter','latex')
tit2 = strcat('Viscous vs Reynolds stresses');
title({tit2},'Interpreter','latex','FontSize',26);


filename2 = strcat(fpath,strcat('tau_vR'));
saveas(fig3,filename2,'epsc');


