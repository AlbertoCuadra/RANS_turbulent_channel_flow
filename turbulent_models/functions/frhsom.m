function [rhs1,rhs2,rhs3,nut] = frhsom(u,k,om,y)
    global Re n sigma_k c_mu c_om1 c_om2 sigma_om h
    % Boundary condition
    u(1) = 0; 
    k(1) = 0;
    om(1) = 0; 
%     k = abs(k);
%     ep = abs(ep);
    indk = find(k<0);
    indep = find(om<0);
    k(indk) = 0;
    om(indep) = 0;
    % Constants and terms
    Re_t = Re.*k.^2./om;
    indRe_t = find(isnan(Re_t)|isinf(Re_t));
    Re_t(indRe_t) = 0;
    %     Re_t(1) = 0; % Eliminate the singularity
    yplus = y.*Re./h;
    % Damping functions
%     fmu=1;f1=1;f2=1;
    fmu = 1-exp(-0.0115.*yplus); % Chien
    f1 = 1; % Chien
    f2 = 1-0.22.*exp(-(Re_t./6).^2); % Chien
%     fmu = exp(-3.4./(1+Re_t./50).^2); % Launder - Sharma
%     f1 = 1;                           % Launder - Sharma
%     f2 = 1-0.3*exp(-Re_t.^2);         % Launder - Sharma
    % Turbulent viscosity == nut
    nut = fmu.*c_mu.*k.^2./om;
    indnut = find(isnan(nut)|isinf(nut));
    nut(indnut) = 0; 
%     nut(1) = 0; % Eliminate the singularity
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
    Tk = nut./sigma_k.*dkdy;
    dTkdy = difx(Tk,y);
%     D = 2/Re.*(difx(sqrt(k),y)).^2; % Launder - Sharma
    D = 2/Re.*k./y.^2; % Chien
    indD = find(isnan(D)|isinf(D));
    D(indD) = 0;
%     D(1) = 0; % Launder - Sharma,k(0)=0 -> dkdy(0) = 0; % Boundary condition
%     D(n) = 0; % Launder - Sharma, dkdy(n,1) = 0; % Boundary condition
    depdy = difx(om,y);
    depdy(n,1) = 0; % Boundary condition
    Tep = nut./sigma_ep.*depdy;
    dTepdy = difx(Tep,y);
%     E = 2/Re.*nut.*du2dy.^2; % Launder - Sharma
    E = -2/Re.*om./y.^2.*exp(-0.5.*yplus); % Chien
    indE = find(isnan(E)|isinf(E));
    E(indE) = 0;
    % Right Hand Side Equations
    rhs1 = 1 + (1/Re).*du2dy - dtau12dy;
    rhs2 = P + dTkdy - (om+D); 
%     rhs2 = abs(rhs2);
    rhs3 = P.*(c_ep1.*f1.*om)./k + dTepdy - om.*(f2.*c_ep2.*om)./k + E;
    indrhs3 = find(isnan(rhs3)|isinf(rhs3));
    rhs3(indrhs3) = 0; 
%     rhs3 = abs(rhs3);
%     rhs3(1) = 0;% Eliminate the singularity
%     indrhs3 = find(rhs3<0); 
%     rhs3(indrhs3)=0;
end