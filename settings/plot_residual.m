% Plot Residual 1.2
if(mod(it,nfrec)==0)
% Plot configuration
figure(9)

dlr11 = plot(it,norm(rhs1)/n,'o','color',color(1,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
        'MarkerSize',8);
dlr12 = plot(it,norm(rhs2)/n,'d','color',color(2,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
        'MarkerSize',8);
dlr13 = plot(it,norm(rhs3)/n,'v','color',color(3,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(3,:),'MarkerEdgeColor','black',...
        'MarkerSize',8);
legend([dlr11,dlr12,dlr13],leg2,'FontSize',20,'Location','northeastoutside','interpreter','latex');

% variable time step
% dlr21= plot(it,norm(rhs1)/n,'s','color',color(4,:),'LineWidth',1.2,...
%         'MarkerFaceColor',color(4,:),'MarkerEdgeColor','black',...
%         'MarkerSize',8);
% dlr22= plot(it,norm(rhs2)/n,'<','color',color(5,:),'LineWidth',1.2,...
%         'MarkerFaceColor',color(5,:),'MarkerEdgeColor','black',...
%         'MarkerSize',8);
% dlr23= plot(it,norm(rhs3)/n,'>','color',color(6,:),'LineWidth',1.2,...
%         'MarkerFaceColor',color(6,:),'MarkerEdgeColor','black',...
%         'MarkerSize',8);
% legend([dlr21,dlr22,dlr23],leg2(4:6),'FontSize',20,'Location','northeastoutside','interpreter','latex');
% legend([dlr11,dlr12,dlr13,dlr21,dlr22,dlr23],leg2,'FontSize',20,'Location','northeastoutside','interpreter','latex');
end