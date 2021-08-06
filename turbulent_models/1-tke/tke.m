% TKE model
model = 2;
disp('TKE MODEL:');
close all;
tic
sigma_k = 1;
c = 0.55;
cd = 0.125;
lm = mxlength(y,yplus,h,n);
D = 0; % k-epsilon model (for plotting)
% Plot zero iteration (initialization)
leg{1}='DNS'; leg{2}='TKE';
cont = 1; filename = 'u_tke-';
plotfun1;
plotfun2;
plotfun3;
plotfun4;
plot_residual_tke1;
% Looping
disp('Looping initialization');
while (err1>eps||err2>eps)&& it<itmax
    % Runge Kutta explicit order 4
    [u,k,rhs1,rhs2,nut,ep] = rk4_tke(u,k,y,dt);
    err1 = norm(rhs1)/n;
    err2 = norm(rhs2)/n;
    err = max(err1,err2);
%     fprintf(log,'\n%-i\t%-.4E ',it,err);
    it = it+1;
    % Refresh plots
    plotfun12;
    plotfun22;
    plotfun32;
    plotfun42;
    plot_residual_tke2;
end
beep
if err<eps
    disp('Solution converged')
    num = 2;
    dname = num2str(Re);
    toc
    elapsedTime = toc;
    savedata
else
    disp('Solution not converged')
    toc
    elapsedTime = toc;
end