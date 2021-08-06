if(mod(it,nfrec)==0)
    figure(8);
    if exist('dl42')
        delete(dl42);
    end
    dl42 = plot(y,nut,'color',color(2,:),'LineWidth',1.2);
    tit = strcat('It $= ',num2str(it),',$ Nodes $ = ',num2str(n),'$');
    title({tit},'Interpreter','latex','FontSize',16);
    legend(leg,'FontSize',16,'Location','northeastoutside','interpreter','latex');
    if savefigure
        filename = 'nut-';
        filename2 = strcat(fpath,filename,num2str(cont));
        saveas(gcf,filename2,'epsc');
    end
end