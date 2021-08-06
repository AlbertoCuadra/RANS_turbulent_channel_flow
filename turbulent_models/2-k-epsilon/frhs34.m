function [rhs1,rhs2,rhs3,nut] = frhs34(u,k,ep,y)
    global Re n sigma_k c_mu c_ep1 c_ep2 sigma_ep h
    % Boundary condition
    u(1) = 0; 
    k(1) = 0;
%     aux = 1/Re.*difx(difx(k,y),y); % Boundary condition - Case 1
%     ep(1) = aux(1); % Boundary condition - Case 1
    % Eliminate negative values (no physical sense)
    indk = find(k<0);
    indep = find(ep<0);
    k(indk) = 0;
    ep(indep) = 0;
    % Calculate D
    D = 0; % Lam-Bremhorst
    ep2 = ep + D;
    % Constants and terms
    Re_t = Re.*k.^2./ep2;
    indRe_t = find(isnan(Re_t)|isinf(Re_t));
    Re_t(indRe_t) = 0;
    yplus = y.*Re./h;
    ydot = sqrt(k).*y./Re;
    indydot = find(isnan(ydot)|isinf(ydot));
    ydot(indydot) = 0;
    % Damping functions
%     fmu = 1-exp(-2e-4.*yplus - 6.5e-4.*yplus.^2); % Rodi & Mansour (1993)
    fmu = (1-exp(-0.0165.*ydot)).^2.*(1+20.5./Re_t); % Lam-Bremhorst
    f1 = 1+(0.05./fmu).^3;                           % Lam-Bremhorst
    f2 = 1-exp(-Re_t.^2);                            % Lam-Bremhorst
    % Turbulent viscosity == nut
    nut = fmu.*c_mu.*k.^2./ep;
    indnut = find(isnan(nut)|isinf(nut));
    nut(indnut) = 0;
    % Momentum y
    dudy = difx(u,y);
    dudy(n,1) = 0; % Boundary condition 
    du2dy = difx(dudy,y);
    tau12 = -nut.*dudy;
    dtau12dy = difx(tau12,y);
    % Turbulent Kinetic Energy
    P = (nut.*dudy).*dudy;
    dkdy = difx(k,y);
    dkdy(n,1) = 0; % Boundary condition
    Tk = (1/Re + nut./sigma_k).*dkdy;
    dTkdy = difx(Tk,y);
    % Dissipation
    depdy = difx(ep,y);
    depdy(1,1) = 0; % Boundary condition - Case 2
    depdy(n,1) = 0; % Boundary condition
    Tep = (1/Re +nut./sigma_ep).*depdy;
    dTepdy = difx(Tep,y);
    E = 0; % Lam-Bremhorst
    % Right Hand Side Equations
    rhs1 = 1 + (1/Re).*du2dy - dtau12dy;
    rhs2 = P + dTkdy - (ep+D); 
    rhs3 = P.*(c_ep1.*f1.*ep)./k + dTepdy - ep.*(f2.*c_ep2.*ep)./k + E;
    indrhs3 = find(isnan(rhs3)|isinf(rhs3));
    rhs3(indrhs3) = 0; 
%     rhs3 = abs(rhs3);
%     rhs3(1) = 0;% Eliminate the singularity
%     indrhs3 = find(rhs3<0); 
%     rhs3(indrhs3)=0;
end