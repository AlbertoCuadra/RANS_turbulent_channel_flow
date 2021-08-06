% Load results
load(strcat('mixing_',num2str(Re),'.mat'));
load(strcat('tke_',num2str(Re),'.mat'));
load(strcat('kepsilon_',num2str(Re),'.mat'));
load(strcat('kepsilon2_',num2str(Re),'NT.mat'));
% load(strcat('kepsilon3_',num2str(Re),'LS.mat'));
% load(strcat('kepsilon4_',num2str(Re),'LB.mat'));
if Re>180 
    % Spatial discretization
    y_mixing = y_mixing(1:npoint:end);
    y_tke = y_tke(1:npoint:end);
    y_kepsilon = y_kepsilon(1:npoint:end);
    y_kepsilon2 = y_kepsilon2(1:npoint:end);
    % Velocity
    u_mixing = u_mixing(1:npoint:end);
    u_tke = u_tke(1:npoint:end);
    u_kepsilon = u_kepsilon(1:npoint:end);
    u_kepsilon2 = u_kepsilon2(1:npoint:end);
    % Turbulent Kinetic Energy
    k_tke = k_tke(1:npoint:end);
    k_kepsilon = k_kepsilon(1:npoint:end);
    k_kepsilon2 = k_kepsilon2(1:npoint:end);
    % Pseudo-Dissipation
    ep_tke = ep_tke(1:npoint:end);
    ep_kepsilon = ep_kepsilon(1:npoint:end);
    ep_kepsilon2 = ep_kepsilon2(1:npoint:end);
    % Turbulent viscosity
    nut_mixing = nut_mixing(1:npoint:end);
    nut_tke = nut_tke(1:npoint:end);
    nut_kepsilon = nut_kepsilon(1:npoint:end);
    nut_kepsilon2 = nut_kepsilon2(1:npoint:end);
end