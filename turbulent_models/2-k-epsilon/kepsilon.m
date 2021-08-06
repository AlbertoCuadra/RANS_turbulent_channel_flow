% k-epsilon model with damped functions: Chien
disp('k-epsilon MODEL with Chien damped functions:');
close all;
tic
model = 3;
sigma_k = 1;
sigma_ep = 1.3;
% c_ep1 = 1.44;
% c_ep2 = 1.92; 
c_mu = 0.09; % We can tune it depending of the Reynolds number
c_ep1 = 1.35; % Chien
c_ep2 = 1.8; % Chien
% Plot zero iteration (initialization)
leg{1}='DNS'; leg{2}='$k-\epsilon_{C}$';
cont = 1; filename = 'u_kepsilon-';
plotfun1;
plotfun2;
plotfun3;
plotfun4;
plot_residual_kep1;
% Looping
disp('Looping initialization');
while (err1>eps || err2>eps || err3>eps) && it<itmax
    % Runge Kutta explicit order 4
    [u,k,ep,rhs1,rhs2,rhs3,nut,D] = rk4_kepsilon(u,k,ep,y,dt);
    % Error
    err1 = norm(rhs1)/n;
    err2 = norm(rhs2)/n;    
    err3 = norm(rhs3)/n;
    err = max(err1,err2);
    err = max(err,err3);
    it = it+1;
    % Refresh plots
    plotfun12;
    plotfun22;
    plotfun32;
    plotfun42;
    plot_residual_kep2;
end
if err<eps
    disp('Solution converged')
    num = 3;
    dname = num2str(Re);
    toc
    elapsedTime = toc;
    savedata
else
    disp('Solution not converged')
    toc
    elapsedTime = toc;
end