% k-epsilon model with damped functions: Chien
disp('k-epsilon MODEL with Nagano-Tagawa damped functions:');
close all;
tic
model = 32;
sigma_k = 1.4;
sigma_ep = 1.3;
c_mu = 0.09; % We can tune it depending of the Reynolds number
c_ep1 = 1.45; % Nagano-Tagawa
c_ep2 = 1.9; % Nagano-Tagawa
D = 0;
% Plot zero iteration (initialization)
leg{1}='DNS'; leg{2}='$k-\epsilon_{NT}$';
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
    [u,k,ep,rhs1,rhs2,rhs3,nut] = rk4_kepsilon2(u,k,ep,y,dt);
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
    num = 32;
    dname = strcat(num2str(Re),'NT');
    toc
    elapsedTime = toc;
    savedata
else
    disp('Solution not converged')
    toc
    elapsedTime = toc;
end