%{
Turbulence - Project 2: RANS numerical simulation of a turbulent flow
                        through a channel.
Author: Alberto Cuadra Lara
Last update: 11/05/2018
Email: acuadra@ing.uc3m.es

Numerical models:
- Length mixing (0 equation)
- TKE           (1 equation)
- k-epsilon     (2 equations)

Problem description:
Data extracted from direct numerical simulations of fully developed plane
turbulent channel flow. URL:http://torroja.dmt.upm.es/channels/data/
Re_tau = 180 || Re_tau = 550 ||Re_tau = 950 || Re_tau = 2000
%}
clear; clc; help main; addpath(genpath(pwd));
% Figures save path
mkdir figures; addpath('.\figures\'); fpath = strcat(pwd,'\figures\');
savefigure = false;
% ------------------------------------------------------------------------%
% Problem configuration
% ------------------------------------------------------------------------%
global Re lm n nfrec sigma_k c cd c_mu c_ep1 c_ep2 sigma_ep h
Re = 180;       % Re_tau
eps = 1e-3;      % Right Hand Side (RHS) error -> stadistically stationary
nfrec = 1000;    % Plot frecuency
h = 1;           % Half of the channel (Dimensionless h==h^*=1)
n = round(Re/4); % Number of nodes of the mesh
CFL = 1;         % Corant number associated with the viscous term
a = 1.5;         % Exponent amplificator of nodes
mplot = true;    % Mesh plot?
x0 = 0;          % Left bound
xf = h;          % Right bound
itmax = 2e6;     % Max number of iterations
% ------------------------------------------------------------------------%
% DNS Data
% ------------------------------------------------------------------------%
% y/h    || y+     || U+   || u'+  || v'+  || w'+  || -Om_z+ || om_x'+ 
% om_y'+ || om_z'+ || uv'+ || uw'+ || vw'+ || pr'+ || ps'+   || psto'+ || p'
load(strcat('Re', num2str(Re), '.prof'));
d(1).d(:,:) = evalin('base', strcat('Re', num2str(Re)));
% y/h    || y+    || dissip || produc  || p-strain || p-diff || t-diff  
% v-diff || bal   || tp-kbal 
load(strcat('Re', num2str(Re), '.bal.kbal'));
d(2).d(:,:) = evalin('base', strcat('Re', num2str(Re), '_bal'));
% ------------------------------------------------------------------------%
err = 1; err1 = err; err2 = err; err3 = err; it = 1;
y(:,1) = mesh1D(n,a,x0,xf,mplot);
% y(:,1) = d(1).d(:,1); % Copy mesh DNS
% n = length(y);% Copy mesh DNS
yplus = y.*Re./h;
deltay(:,1) = y(2:end)-y(1:end-1);
deltaymax = max(deltay);
mu = deltay(1:end)./deltaymax;

% dt = CFL*min(deltay.^2*Re);
% ------------------------------------------------------------------------%
% Initialization
% ------------------------------------------------------------------------%
% Initialization by functions
% u = 15.*y.^(0.25); % Initialization: Mixing & TKE & k-epsilon
% k = 8.*y.^(0.25).*exp(-2.5.*y); % Initialization: TKE & k-epsilon
% ep = 0.75.*y.^(0.25).*exp(-5.*y); % Initialization: k-epsilon
ep = 500.*y.^(0.25).*exp(-5.*y); % Initialization: k-epsilon
% ep = 750*y.^(0.25).*exp(-5.*y); % Initialization: k-epsilon
% Accurate initialization - 1
y_dns = d(1).d(:,1);
u_dns = d(1).d(:,3); 
k_dns = 0.5.*(d(1).d(:,4).^2 + d(1).d(:,5).^2 + d(1).d(:,6).^2); 
ep_dns = -Re.*d(2).d(:,3); 

u = spline(y_dns,u_dns,y);
k = spline(y_dns,k_dns,y);
% ep = spline(y_dns,ep_dns,y);
% Accurate initialization - 2
% load('kepsilon_2000.mat')
% u = spline(y_kepsilon,u_kepsilon,y);
% k = spline(y_kepsilon,k_kepsilon,y);
% ep = spline(y_kepsilon,ep_kepsilon,y);
% ------------------------------------------------------------------------%
% Turbulent viscosity from DNS data:
dudy_dns = difx(u_dns,y_dns);
tau12_dns = d(1).d(:,11);
nut_dns = -tau12_dns./dudy_dns;
nut_dns = nut_dns(1:end-1);     % Remove wrong value
% ------------------------------------------------------------------------%
nut_spline = spline(y_dns(1:end-1),nut_dns,y);
dt = CFL.*(1/Re+abs(nut_spline(1:end-1))).^(-1).*deltay.^2;
dt = [dt;dt(end)];
nyplus1 = find(yplus<1,1,'last');

% dt = min(CFL.*(1/Re+abs(nut_spline(1:end-1))).^(-1).*deltay.^2); % Fixed step size
% ------------------------------------------------------------------------%
% Display configuration
disp('---- Configuration ----')
fprintf('y =           %.3e \n', h)
fprintf('n =           %d   \n', n)
fprintf('dy_min =      %.3e \n', min(deltay))
fprintf('dy_max =      %.3e \n', deltaymax)
fprintf('dt_min =      %.3e \n', min(dt))
fprintf('CFL =         %.3e \n', CFL)
fprintf('Re =          %.3e \n', Re)
fprintf('eps =         %.3e \n', eps)
fprintf('Nodes y+< 1 = %d   \n', nyplus1)
disp('-----------------------')
if nyplus1 < 2
   disp('ATTENTION! number of nodes in y+ < 1 is less than 2.')
end
%% Mixing length model
mixing;
%% TKE model
tke;
%% k-epsilon 
% kepsilon;   % Chien
% kepsilonRM; % Chien + fmu Rodi & Mansour
% kepsilon2;  % Nagano-Tagawa
kepsilon3;    % Launder-Sharmar 
% kepsilon4;  % Lam-Bremhorst 
%% k-omega 
% komega; % Not yet
%% Load results for plotting
npoint = 1; % Plot per npoint
load_results;
%% Plot Mixing, TKE and k-epsilon
plotallu;
plotallk;   
plotallep;
plotallnut;
%% Plot in wall units (dots)
dnsplot1 = 20;
dnsplot2 = 8;
plotalluplus;
plotallkplus;
plotallepplus;
plotallnutplus;
%% Plot in wall units (lines)
dnsplot1 = 16;
dnsplot2 = 8;
plotalluplus2;
plotallkplus2;
plotallepplus2;
plotallnutplus2;
%% Plot Viscous vs Reynolds stresses
plottau;
%% Plot Production vs Dissipation
plotalllep_prod_dis_plus
%% Velocity-defect law
plotvelocity
%% Plot only k-epsilon models
% plotkep_uplus;
% plotkep_kplus;
% plotkep_epplus;
% plotkep_nutplus;