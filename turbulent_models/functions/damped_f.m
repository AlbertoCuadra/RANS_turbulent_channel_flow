yplus = y_kepsilon.*Re./h;
fmu = 1-exp(-0.0115.*yplus);
Re_t = Re.*k_kepsilon.^2./ep_kepsilon;
f2 = 1-0.22.*exp(-(Re_t./6).^2);
figure
hold on
plot(y_kepsilon,fmu);
plot(y_kepsilon,f2);
set(gca,'xscale','log')

%% C_mu
Re_vector = [180,550,2000];
fig = figure; hold on;

%%
clear all
Re = 550;
load(strcat(pwd,'\chandata\Re',num2str(Re),...
    '\profiles\Re',num2str(Re),'.prof'));
d(1).d(:,:) = Re550;

for i=1:1
    y_dns = d(1).d(:,1);
    u_dns = d(1).d(:,3); 
    k_dns = 0.5.*(d(1).d(:,4).^2 + d(1).d(:,5).^2 + d(1).d(:,6).^2); 
    uprime_dns = d(1).d(:,4); 
    S12prime_dns = difx(uprime_dns,y_dns);
    ep_dns = 1/Re.*S12prime_dns.*S12prime_dns;
    dudy_dns = difx(u_dns,y_dns);
    tau12_dns = d(1).d(:,11);
    nut_dns = -tau12_dns./dudy_dns;
%     nut_dns = nut_dns(1:end-1);
    C_mu = (nut_dns.*ep_dns)./k_dns.^2;
    plot(y_dns,C_mu);
end

%% Turbulent viscosity/Viscosity
clear all
Re = 2000;
load('kepsilon_2000.mat')
load(strcat(pwd,'\chandata\Re',num2str(Re),...
    '\profiles\Re',num2str(Re),'.prof'));
d(1).d(:,:) = Re2000;

y_dns = d(1).d(:,1);
u_dns = d(1).d(:,3); 
k_dns = 0.5.*(d(1).d(:,4).^2 + d(1).d(:,5).^2 + d(1).d(:,6).^2); 
uprime_dns = d(1).d(:,4); 
S12prime_dns = difx(uprime_dns,y_dns);
ep_dns = 1/Re.*S12prime_dns.*S12prime_dns;
dudy_dns = difx(u_dns,y_dns);
tau12_dns = d(1).d(:,11);
nut_dns = -tau12_dns./dudy_dns;
    
    
figure; hold on;

xlim([0,150])
plot(y_kepsilon*Re,nut_kepsilon*Re);
plot(y_dns*Re,nut_dns*Re);
%% Viscous vs Reynolds stresses
clear all
Re = 2000;
load('kepsilon_2000.mat')
tau_v = 1/Re*difx(u_kepsilon,y_kepsilon);
tau_12 = -nut_kepsilon.*difx(u_kepsilon,y_kepsilon);
tau_tot = tau_v+tau_12;

figure; hold on;

xlim([0,1])
ylim([0,1])
subplot(2,1,1);
plot(y_kepsilon,-tau_12);
subplot(2,1,2);
plot(y_kepsilon,tau_v);
