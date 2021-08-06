% Plot Residual 1.2
if(mod(it,nfrec)==0)
% Plot configuration
figure(9)

plot(it,norm(rhs)/n,'o','color',color(4,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
        'MarkerSize',8);
legend(leg2,'FontSize',20,'Location','northeastoutside','interpreter','latex');
end