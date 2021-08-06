function lm = mxlength(y,yplus,h,n)
kappa = 0.41;
lm1 = kappa.*y.*(1-exp(-yplus./26));
lm2 = 0.09*h;
lm = zeros(n,1);
for i=1:length(lm)
    lm(i,1) = min(lm1(i),lm2);
end