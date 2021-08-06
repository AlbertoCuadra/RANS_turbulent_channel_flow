if(mod(it,nfrec)==0)
    cont = cont+1;
    fprintf('Error = %.3e \n',err)
    figure(4);
    delete(dl2)
%     dl2 = plot(y,u,'color',color(2,:),'LineWidth',1.2);
    dl2 = plot(y,u,'-','color',color(2,:),'LineWidth',1.2,...
        'MarkerFaceColor',color(2,:),'MarkerEdgeColor','black',...
        'MarkerSize',5);
    tit = strcat('It $= ',num2str(it),',$ Nodes $ = ',num2str(n),'$');
    title({tit},'Interpreter','latex','FontSize',16);
    legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
    if savefigure
        filename = 'k-';
        filename2 = strcat(fpath,filename,num2str(cont));
        saveas(gcf,filename2,'epsc');
    end
end