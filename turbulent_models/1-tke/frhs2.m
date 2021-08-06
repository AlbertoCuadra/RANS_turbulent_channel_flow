function [rhs1,rhs2,nut,ep] = frhs2(u,k,y)
    global Re lm n sigma_k c cd
    u(1) = 0; % Boundary condition
    k(1) = 0; % Boundary condition
    % Doesn't have any sense k<0
    indk = find(k<0);
    k(indk) = 0;
%     k(indk) = 0.1.*abs(k(indk));
%     k = abs(k);% Doesn't have any sense k<0
    % Turbulent viscosity == nut
    u_dot = c.*sqrt(k);
    nut = u_dot.*lm;
    % Momentum y
    dudy = difx(u,y);
    dudy(n,1) = 0; % Boundary condition 
    du2dy = difx(dudy,y);
    tau12 = -nut.*dudy;
    dtau12dy = difx(tau12,y);
    % Turbulent Kinetic Energy
    lm_aux = lm;
    lm_aux(1) = lm(2); % Eliminate the singularity lm(0) = 0!!!
    ep = cd.*k.^(3/2)./lm_aux;
    P = (nut.*dudy).*dudy;
    dkdy = difx(k,y);
    dkdy(n,1) = 0; % Boundary condition
    T = nut./sigma_k.*dkdy;
    dTdy = difx(T,y);
    % Right Hand Side Equations
    rhs1 = 1 + (1/Re).*du2dy - dtau12dy;
    rhs2 = P + dTdy - ep;
end
