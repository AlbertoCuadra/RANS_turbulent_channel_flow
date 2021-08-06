function dudx = difx(u,x)
% % Central derivative with h non-uniform of order 1
n = length(x);
dudx = zeros(n,1);
h = x(2:end)-x(1:end-1);
hmax = max(h);
mu = h(1:end)./hmax;
% First element
dudx(1,1) = (u(2)-u(1))/(mu(1)*hmax);
% c1 = (mu(2)+mu(1))^2/mu(1)^2;
% dudx(1,1) = (-u(3)+c1*u(2)+(1-c1)*u(1))/((mu(1)*(c1-1)-mu(2))*hmax);
% Inner elements
dudx(2:n-1,1) = (u(3:n)-u(1:n-2))./((mu(2:end)+mu(1:end-1))*hmax);
% for i=2:n-1
%     dudx(i,1) = (u(i+1)-u(i-1))/((mu(i)+mu(i-1))*hmax);
% %     dudx(i,1) = (mu(i-1)^2.*u(i+1)-(mu(i-1)^2-mu(i)^2).*u(i)-mu(i)^2.*u(i-1))/((mu(i-1)^2*mu(i)+mu(i)^2*(mu(i-1)))*hmax);
% end
% Last element
dudx(n,1) = (u(n)-u(n-1))/(mu(end)*hmax); 
% c2 = (mu(end)+mu(end-1))^2/mu(end-1)^2;
% dudx(n,1) = (u(end-2)-c2*u(end-1)+(-1+c2)*u(end))/((mu(end)*(c2-1)-mu(end-1))*hmax);