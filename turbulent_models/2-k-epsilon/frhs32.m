function [rhs1,rhs2,rhs3,nut] = frhs32(u,k,ep,y)
    global Re n sigma_k c_mu c_ep1 c_ep2 sigma_ep h
    % Boundary condition
    u(1) = 0; 
    k(1) = 0;
    aux = 1/Re.*difx(difx(k,y),y);
    ep(1) = aux(1); 
%     ep(2) = aux(2); % To decrease the value of depdy
    % Eliminate negative values (no physical sense)
    indk = find(k<0);
    indep = find(ep<0);
    k(indk) = 0;
    ep(indep) = 0;
    % Constants and terms
    D = 0; % Nagano-Tagawa
    ep2 = ep + D;
    Re_t = Re.*k.^2./ep2;
    indRe_t = find(isnan(Re_t)|isinf(Re_t));
    Re_t(indRe_t) = 0;
    %     Re_t(1) = 0; % Eliminate the singularity
    yplus = y.*Re./h;
    % Damping functions
%     fmu = 1-exp(-2e-4.*yplus - 6.5e-4.*yplus.^2); % Rodi & Mansour (1993)
    fmu = (1-exp(-yplus./26)).^2.*(1+4.1./Re_t.^(3/4)); % Nagano-Tagawa
    f1 = 1; % Nagano-Tagawa
    f2 = (1-0.3.*exp(-(Re_t./6.5).^2)).*(1-exp(-yplus./6)).^2; % Nagano-Tagawa
    % Turbulent viscosity == nut
    nut = fmu.*c_mu.*k.^2./ep;
    indnut = find(isnan(nut)|isinf(nut));
    nut(indnut) = 0; 
    % Momentum y
    dudy = difx(u,y);
    dudy(n,1) = 0; % Boundary condition 
%     du2dy = difx(dudy,y);
    tau12 = -nut.*dudy;
%     dtau12dy = difx(tau12,y);
    % Turbulent Kinetic Energy
    P = (nut.*dudy).*dudy;
    dkdy = difx(k,y);
    dkdy(n,1) = 0; % Boundary condition
    Tk = (1/Re + nut./sigma_k).*dkdy;
    dTkdy = difx(Tk,y);
    depdy = difx(ep,y);
    depdy(n,1) = 0; % Boundary condition
    Tep = (1/Re + nut./sigma_ep).*depdy;
    dTepdy = difx(Tep,y);
    E = 0; % Nagano-Tagawa
    % Right Hand Side Equations
%     rhs1 = 1 + (1/Re).*du2dy - dtau12dy;
    rhs1 = 1 + difx((1/Re.*dudy-tau12),y);
    rhs2 = P + dTkdy - (ep+D); 
    rhs3 = P.*(c_ep1.*f1.*ep)./k + dTepdy - ep.*(f2.*c_ep2.*ep)./k + E;
    indrhs3 = find(isnan(rhs3)|isinf(rhs3));
    rhs3(indrhs3) = 0;
end