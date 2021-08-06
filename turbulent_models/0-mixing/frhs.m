function [rhs,nut] = frhs(u,y)
    global Re lm n
    dudy = difx(u,y);
    dudy(n,1) = 0; % Boundary condition
    du2dy = difx(dudy,y);
    nut = lm.^2.*abs(dudy);
    tau12 = -nut.*dudy;
    dtau12dy = difx(tau12,y);
    rhs = 1 + (1/Re).*du2dy - dtau12dy;
end

% global Re lm n
%     dudy = difx(u,y);
%     dudy(n,1) = 0; % Boundary condition
%     du2dy = difx(dudy,y);
%     nut = lm.^2.*abs(dudy);
%     dnutdy = difx(nut,y);
% %     rhs = 1 + (1/Re + nut).*du2dy + dnutdy.*dudy;
%     rhs = 1 + (1/Re + nut).*du2dy + dnutdy.*dudy;