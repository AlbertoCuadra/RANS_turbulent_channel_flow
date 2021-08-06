function [u,k,ep,rhs1,rhs2,rhs3,nut] = rk4_kepsilon4(u,k,ep,y,dt)
    global Re
    % Runge Kutta explicit order 4
    [k11,k12,k13] = frhs34(u,k,ep,y);
    [k21,k22,k23] = frhs34(u+0.5.*k11.*dt,k+0.5.*k12.*dt,ep+0.5.*k13.*dt,y);
    [k31,k32,k33] = frhs34(u+0.5.*k21.*dt,k+0.5.*k22.*dt,ep+0.5.*k23.*dt,y);
    [k41,k42,k43,nut] = frhs34(u+k31.*dt,k+k32.*dt,ep+k33.*dt,y);
    rhs1 = k11 + 2*k21 + 2*k31 +k41;
    rhs2 = k12 + 2*k22 + 2*k32 +k42;
    rhs3 = k13 + 2*k23 + 2*k33 +k43;
    u = u + (dt/6).*rhs1;
    k = k + (dt/6).*rhs2;
    ep = ep + (dt/6).*rhs3;
    % Regularizate k and ep. Doesn't have any sense negative values.
%         k = abs(k);
%         ep = abs(ep);
    indk = find(k<0);
    indep = find(ep<0);
    k(indk) = 0;
   	ep(indep) = 0;
    % Boundary condition
    u(1) = 0; 
    k(1) = 0;
    aux = 1/Re.*difx(difx(k,y),y);
    ep(1) = aux(1); 
end