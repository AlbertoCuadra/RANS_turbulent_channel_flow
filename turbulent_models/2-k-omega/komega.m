% k-omega model
disp('k-omega MODEL:');
close all;
tic
model = 4;
sigma_k = 1;
sigma_om = 1.3;
% c_ep1 = 1.44;
% c_ep2 = 1.92; 
c_mu = 0.09; % We can tune it depending of the Reynolds number

c_om1 = 1.35; % Chien
comp2 = 1.8; % Chien
% Plot zero iteration (initialization)
leg{1}='DNS'; leg{2}='$k-\omega$';
cont = 1; filename = 'u_komega-';
plotfun1;
plotfun2;
plotfun3;
plotfun4;
% Looping
disp('Looping initialization');
while err>eps && it<itmax
    % Runge Kutta explicit order 4
    [u,k,ep,rhs1,rhs2,rhs3,nut] = rk4_komega(u,k,om,y,dt);
    % Error
    maxrhs = max(norm(rhs1),norm(rhs2));
    maxrhs = max(maxrhs,norm(rhs3));
    err = maxrhs/n;
    it = it+1;
    % Refresh plots
    plotfun12;
    plotfun22;
    plotfun32;
    plotfun42;
end
if err<eps
    disp('Solution converged')
    num = 4;
    dname = num2str(Re);
    toc
    elapsedTime = toc;
    savedata
else
    disp('Solution not converged')
    toc
    elapsedTime = toc;
end