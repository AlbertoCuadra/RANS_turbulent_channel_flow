function dudx = difx2(u,x)
% Central derivative with h non-uniform of order 1
n = length(x);
dudx = zeros(n,1);
h = x(2:end)-x(1:end-1);
hmax = max(h);
mu = h(1:end)./hmax;
% First element
% dudx(1,1) = (u(2)-u(1))/h(1);
dudx(1,1) = (-3*u(1)+4*u(2)-u(3))/((mu(2)+mu(1))*hmax);
% Inner elements
for i=2:n-1
    dudx(i,1) = (mu(i-1)^2.*u(i+1)-(mu(i-1)^2-mu(i)^2).*u(i)-mu(i)^2.*u(i-1))/((mu(i-1)^2*mu(i)+mu(i)^2*(mu(i-1)))*hmax);
end
% Last element
dudx(n,1) = (u(n)-u(n-1))./h(end); 