function y = mesh1D(n,a,x0,xf,mplot)
    global Re
    x = 1:n;
    y = linspace(x0,xf,n);
    y = y.^(a);
    yplus = y.*Re;
    if (mplot==1)
        % Plot mesh y/h 
        color = colours;
        fig = figure;
        set(fig,'innerposition',[200 150 500 500],...
            'outerposition',[200 150 500 500]);
        set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
        grid on; box on; hold on; axis tight;
        xlabel('$n_y$','FontSize',16,'interpreter','latex');
        ylabel('$y/h$','FontSize',16,'interpreter','latex');
        tit = 'Mesh 1D $y/h$';
        title({tit},'Interpreter','latex','FontSize',16);
        plot(x,y,'-d','color',color(2,:),'LineWidth',1.4,...
            'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
            'MarkerSize',5);
        % Plot mesh yplus
        fig2 = figure;
        set(fig2,'innerposition',[700 150 500 500],...
            'outerposition',[700 150 500 500]);
        set(axes,'LineWidth',1.2,'FontSize',14,'BoxStyle','full')    
        grid on; box on; hold on; axis tight;
        xlabel('$n_y$','FontSize',16,'interpreter','latex');
        ylabel('$y^+$','FontSize',16,'interpreter','latex');
        tit2 = 'Mesh 1D $y^+$';
        title({tit2},'Interpreter','latex','FontSize',16);
        plot(x,yplus,'-o','color',color(1,:),'LineWidth',1.4,...
            'MarkerFaceColor',color(1,:),'MarkerEdgeColor','black',...
            'MarkerSize',5);
    end
end