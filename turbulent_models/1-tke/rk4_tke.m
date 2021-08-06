function [u,k,rhs1,rhs2,nut,ep] = rk4_tke(u,k,y,dt)
    % Runge Kutta explicit order 4
    [k11,k12] = frhs2(u,k,y);
    [k21,k22] = frhs2(u+0.5.*k11.*dt,k+0.5.*k12.*dt,y);
    [k31,k32] = frhs2(u+0.5.*k21.*dt,k+0.5.*k22.*dt,y);
    [k41,k42,nut,ep] = frhs2(u+k31.*dt,k+k32.*dt,y);
    rhs1 = k11 + 2*k21 + 2*k31 +k41;
    rhs2 = k12 + 2*k22 + 2*k32 +k42;
    u = u + (dt/6).*rhs1;
    k = k + (dt/6).*rhs2;
    % Boundary condition
    u(1) = 0;
    k(1) = 0; 
    % Runge Kutta explicit order 45
%     [k11,k12] = frhs2(u,k,y);
%     [k21,k22] = frhs2(u+1/4.*k11.*dt,k+1/4.*k12.*dt,y);
%     [k31,k32] = frhs2(u+3/32.*k11.*dt+9/32.*k21.*dt,k+3/32.*k12.*dt+9/32.*k22.*dt,y);
%     [k41,k42] = frhs2(u+1932/2197.*k11.*dt-7200/2197.*k21.*dt+7296/2197.*k31.*dt,k + 1932/2197.*k12.*dt-7200/2197.*k22.*dt+7296/2197.*k32.*dt,y);
%     [k51,k52] = frhs2(u+439/216.*k11.*dt-8.*k21.*dt+3680/513.*k31.*dt-845/4104.*k41.*dt,k +439/216.*k12.*dt-8.*k22.*dt+3680/513.*k32.*dt-845/4104.*k42.*dt,y);
%     [k61,k62,nut,ep] = frhs2(u-8/27.*k11.*dt+2.*k21.*dt-3544/2565.*k31.*dt+1859/4104.*k41.*dt-11/40.*k51.*dt,k -8/27.*k12.*dt+2.*k22.*dt-3544/2565.*k32.*dt+1859/4104.*k42.*dt-11/40.*k52.*dt,y);
%     rhs1 = 25/216*k11 + 1408/2565*k31 + 2197/4104*k41 -1/5*k51;
%     rhs2 = 25/216*k12 + 1408/2565*k32 + 2197/4104*k42 -1/5*k52;
%     u = u + dt.*rhs1;
%     k = k + dt.*rhs2;
%     % Error 
%     err1 = dt*(1/360.*k11+128/4275.*k31-2197/75240.*k41+1/50.*k51+2/55.*k61);
%     err2 = dt*(1/360.*k12+128/4275.*k32-2197/75240.*k42+1/50.*k51+2/55.*k62);
%     errmax = max(max(err1),max(err2));
%     % Re-adjust step size
%     dt_min = 5e-4;
%     dt_max = 1e-2;
%     dt_adjust = 0.84*((1e-6*dt)./errmax)^(1/4)*dt;
%     if dt_adjust>dt_max
%         dt_adjust = dt_max;
%     elseif dt_adjust<dt_min
%         dt_adjust = dt_min;
%     end
end