% Plot Residual 1
% Plot configuration
leg2{1}='$u$'; leg2{2}='$k$'; leg2{3}='$\tilde{\epsilon}$'; 
color = colours;

set(figure(9),'innerposition',[250 150 1000 600],...
        'outerposition',[250 150 1000 600]);
set(axes,'LineWidth',1.4,'FontSize',20,'BoxStyle','full')       
grid on; box on; hold on;
xlabel('Iterations','FontSize',26,'interpreter','latex');
ylabel('$rhs$','FontSize',26,'interpreter','latex');
% xlim([0,1e5])
% ylim([1e-5,1e3])
set(gca,'yscale','log')
tit = strcat('Residuals');
title({tit},'Interpreter','latex','FontSize',26);