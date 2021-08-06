% Mixing length model
disp('MIXING LENGTH MODEL:');
close all;
tic
model = 1;
lm = mxlength(y,yplus,h,n);
% Plot zero iteration (initialization)
leg{1}='DNS'; leg{2}='Mixing';
cont = 1; filename = 'u_mixing-';
plotfun1;
plotfun4;
plot_residual_mixing1;
% Looping
disp('Looping initialization');
while err>eps && it<itmax
    % Runge Kutta explicit order 4
    [u,rhs,nut] = rk4(u,y,dt);
    err = norm(rhs)/n;
    it = it+1;
    % Refresh plot
    plotfun12;
    plotfun42;
    plot_residual_mixing2;
end
if err<eps
    disp('Solution converged')
    num = 1;
    dname = num2str(Re);
    toc
    elapsedTime = toc;
    savedata
else
    disp('Solution not converged')
    toc
    elapsedTime = toc;
end

