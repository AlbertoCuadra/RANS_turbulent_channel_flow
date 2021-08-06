function [u,rhs,nut,k] = rk4(u,y,dt)
    % Runge Kutta explicit order 4
    u(1) = 0;    % Boundary condition
    k1 = frhs(u,y);
    k2 = frhs(u+0.5.*k1.*dt,y);
    k3 = frhs(u+0.5.*k2.*dt,y);
    [k4,nut] = frhs(u+k3.*dt,y);
    rhs = k1 + 2*k2 + 2*k3 +k4;
    u = u + (dt/6).*rhs;
end