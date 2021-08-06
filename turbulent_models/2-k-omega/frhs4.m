function [rhs1,rhs2,rhs3,nut] = frhs34(u,k,ep,y)
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
    % Calculate D
    D = 2/Re.*(difx(sqrt(k),y)).^2; % Launder - Sharma
    indD = find(isnan(D)|isinf(D));
    D(indD) = 0;
    ep2 = ep + D;
    % Constants and terms
    Re_t = Re.*k.^2./ep2;
    indRe_t = find(isnan(Re_t)|isinf(Re_t));
    Re_t(indRe_t) = 0;
    %     Re_t(1) = 0; % Eliminate the singularity
    yplus = y.*Re./h;
    % Damping functions
    fmu = exp(-3.4./(1+Re_t./50).^2); % Launder - Sharma
    f1 = 1;                           % Launder - Sharma
    f2 = 1-0.3*exp(-Re_t.^2);         % Launder - Sharma
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
    % TKE
    P = (nut.*dudy).*dudy;
    dkdy = difx(k,y);
    dkdy(n,1) = 0; % Boundary condition
    Tk = (1/Re + nut./sigma_k).*dkdy;
    dTkdy = difx(Tk,y);
    depdy = difx(ep,y);
    depdy(n,1) = 0; % Boundary condition
    Tep = (1/Re +nut./sigma_ep).*depdy;
    dTepdy = difx(Tep,y);
    E = 2/Re.*nut.*du2dy.^2; % Launder - Sharma
    indE = find(isnan(E)|isinf(E));
    E(indE) = 0;
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