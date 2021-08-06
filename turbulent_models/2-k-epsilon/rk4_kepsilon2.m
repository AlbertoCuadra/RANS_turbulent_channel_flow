function [u,k,ep,rhs1,rhs2,rhs3,nut] = rk4_kepsilon2(u,k,ep,y,dt)
    global Re
    % Runge Kutta explicit order 4
    [k11,k12,k13] = frhs32(u,k,ep,y);
    [k21,k22,k23] = frhs32(u+0.5.*k11.*dt,k+0.5.*k12.*dt,ep+0.5.*k13.*dt,y);
    [k31,k32,k33] = frhs32(u+0.5.*k21.*dt,k+0.5.*k22.*dt,ep+0.5.*k23.*dt,y);
    [k41,k42,k43,nut] = frhs32(u+k31.*dt,k+k32.*dt,ep+k33.*dt,y);
    rhs1 = k11 + 2*k21 + 2*k31 +k41;
    rhs2 = k12 + 2*k22 + 2*k32 +k42;
    rhs3 = k13 + 2*k23 + 2*k33 +k43;
    u = u + (dt/6).*rhs1;
    k = k + (dt/6).*rhs2;
    ep = ep + (dt/6).*rhs3;
    % Runge Kutta explicit order 45
%     [k11,k12,k13] = frhs32(u,k,ep,y);
%     [k21,k22,k23] = frhs32(u+1/4.*k11.*dt,k+1/4.*k12.*dt,ep+1/4.*k13.*dt,y);
%     [k31,k32,k33] = frhs32(u+3/32.*k11.*dt+9/32.*k21.*dt,k+3/32.*k12.*dt+9/32.*k22.*dt,ep+3/32.*k13.*dt+9/32.*k23.*dt,y);
%     [k41,k42,k43] = frhs32(u+1932/2197.*k11.*dt-7200/2197.*k21.*dt+7296/2197.*k31.*dt,k + 1932/2197.*k12.*dt-7200/2197.*k22.*dt+7296/2197.*k32.*dt,ep+1932/2197.*k13.*dt-7200/2197.*k23.*dt+7296/2197.*k33.*dt,y);
%     [k51,k52,k53] = frhs32(u+439/216.*k11.*dt-8.*k21.*dt+3680/513.*k31.*dt-845/4104.*k41.*dt,k +439/216.*k12.*dt-8.*k22.*dt+3680/513.*k32.*dt-845/4104.*k42.*dt,ep+439/216.*k13.*dt-8.*k23.*dt+3680/513.*k33.*dt-845/4104.*k43.*dt,y);
%     [k61,k62,k63,nut] = frhs32(u-8/27.*k11.*dt+2.*k21.*dt-3544/2565.*k31.*dt+1859/4104.*k41.*dt-11/40.*k51.*dt,k -8/27.*k12.*dt+2.*k22.*dt-3544/2565.*k32.*dt+1859/4104.*k42.*dt-11/40.*k52.*dt,ep-8/27.*k13.*dt+2.*k23.*dt-3544/2565.*k33.*dt+1859/4104.*k43.*dt-11/40.*k53.*dt,y);
%     rhs1 = 25/216*k11 + 1408/2565*k31 + 2197/4104*k41 -1/5*k51;
%     rhs2 = 25/216*k12 + 1408/2565*k32 + 2197/4104*k42 -1/5*k52;
%     rhs3 = 25/216*k13 + 1408/2565*k33 + 2197/4104*k43 -1/5*k53;
%     u = u + dt.*rhs1;
%     k = k + dt.*rhs2;
%     ep = ep + dt.*rhs3;
%     % Error 
%     err1 = dt*(1/360.*k11+128/4275.*k31-2197/75240.*k41+1/50.*k51+2/55.*k61);
%     err2 = dt*(1/360.*k12+128/4275.*k32-2197/75240.*k42+1/50.*k51+2/55.*k62);
%     err3 = dt*(1/360.*k13+128/4275.*k33-2197/75240.*k43+1/50.*k51+2/55.*k63);
%     errmax = max(max(err1),max(max(err2),max(err3)));
%     % Re-adjust step size
%     dt_min = 1e-5;
%     dt_max = 1e-3;
%     dt_adjust = 0.84.*((1e-3.*dt)./errmax).^(1/4).*dt;
%     if dt_adjust>dt_max
%         dt_adjust = dt_max;
%     elseif dt_adjust<dt_min
%         dt_adjust = dt_min;
%     end
    % Regularizate k and ep. Doesn't have any sense negative values.
    k(k<0) = 0;
   	ep(ep<0) = 0;
    % Boundary condition
    u(1) = 0; 
    k(1) = 0;
    aux = 1/Re.*difx(difx(k,y),y);
    ep(1) = aux(1); 
end