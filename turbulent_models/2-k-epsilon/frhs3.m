function [rhs1,rhs2,rhs3,nut,D] = frhs3(u,k,ep,y)
    global Re n sigma_k c_mu c_ep1 c_ep2 sigma_ep h
    % Boundary condition
    u(1) = 0; 
    k(1) = 0;
    ep(1) = 0; 
    % Eliminate negative values (no physical sense)
    indk = find(k<0);
    indep = find(ep<0);
    k(indk) = 0;
    ep(indep) = 0;
    % Constants and terms
    Re_t = Re.*k.^2./ep;
    indRe_t = find(isnan(Re_t)|isinf(Re_t));
    Re_t(indRe_t) = 0;
    yplus = y.*Re./h;
    % Damping functions
%     fmu = 1-exp(-2e-4.*yplus - 6.5e-4.*yplus.^2); % Rodi & Mansour (1993)
    fmu = 1-exp(-0.0115.*yplus); % Chien
    f1 = 1; % Chien
    f2 = 1-0.22.*exp(-(Re_t./6).^2); % Chien
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
    Tk = nut./sigma_k.*dkdy;
    dTkdy = difx(Tk,y);
    D = 2/Re.*k./y.^2; % Chien
    indD = find(isnan(D)|isinf(D));
    D(indD) = 0;
    depdy = difx(ep,y);
    depdy(n,1) = 0; % Boundary condition
    Tep = nut./sigma_ep.*depdy;
    dTepdy = difx(Tep,y);
    E = -2/Re.*ep./y.^2.*exp(-0.5.*yplus); % Chien
    indE = find(isnan(E)|isinf(E));
    E(indE) = 0;
    % Right Hand Side Equations
    rhs1 = 1 + (1/Re).*du2dy - dtau12dy;
    rhs2 = P + dTkdy - (ep+D); 
    rhs3 = P.*(c_ep1.*f1.*ep)./k + dTepdy - ep.*(f2.*c_ep2.*ep)./k + E;
    indrhs3 = find(isnan(rhs3)|isinf(rhs3));
    rhs3(indrhs3) = 0; 
end