% Save data: 
% Mixing length model
if num == 1
    n_mixing = n;
    y_mixing = y;
    u_mixing = u;
    nut_mixing = nut;
    err_mixing = err;
    time_mixing = elapsedTime;
    a_mixing = a;
    CFL_mixing = CFL;
    eps_mixing = eps;
    save(strcat('mixing_',dname,'.mat'),'n_mixing','y_mixing','u_mixing',...
        'nut_mixing','err_mixing','time_mixing','a_mixing','CFL_mixing',...
        'eps_mixing');
elseif num == 2
    n_tke = n;
    y_tke = y;
    u_tke = u;
    k_tke = k;
    ep_tke = ep;
    nut_tke = nut;
    err_tke = err;
    time_tke = elapsedTime;
    a_tke = a;
    CFL_tke = CFL;
    eps_tke = eps;
    save(strcat('tke_',dname,'.mat'),'n_tke','y_tke','u_tke','k_tke',...
        'ep_tke','nut_tke','err_tke','time_tke','a_tke','CFL_tke','eps_tke');
elseif num == 3
    n_kepsilon = n;
    y_kepsilon = y;
    u_kepsilon = u;
    k_kepsilon = k;
    ep_kepsilon = ep;
    nut_kepsilon = nut;
    err_kepsilon = err;
    time_kepsilon = elapsedTime;
    a_kepsilon = a;
    CFL_kepsilon = CFL;
    eps_kepsilon = eps;
    D_kepsilon = D;
    save(strcat('kepsilon_',dname,'.mat'),'n_kepsilon','y_kepsilon','u_kepsilon',...
        'k_kepsilon','ep_kepsilon','nut_kepsilon','err_kepsilon',...
        'time_kepsilon','a_kepsilon','CFL_kepsilon','eps_kepsilon','D_kepsilon');
elseif num == 32
    n_kepsilon2 = n;
    y_kepsilon2 = y;
    u_kepsilon2 = u;
    k_kepsilon2 = k;
    ep_kepsilon2 = ep;
    nut_kepsilon2 = nut;
    err_kepsilon2 = err;
    time_kepsilon2 = elapsedTime;
    a_kepsilon2 = a;
    CFL_kepsilon2 = CFL;
    eps_kepsilon2 = eps;
    save(strcat('kepsilon2_',dname,'.mat'),'n_kepsilon2','y_kepsilon2','u_kepsilon2',...
        'k_kepsilon2','ep_kepsilon2','nut_kepsilon2','err_kepsilon2',...
        'time_kepsilon2','a_kepsilon2','CFL_kepsilon2','eps_kepsilon2');
elseif num == 33
    n_kepsilon3 = n;
    y_kepsilon3 = y;
    u_kepsilon3 = u;
    k_kepsilon3 = k;
    ep_kepsilon3 = ep;
    nut_kepsilon3 = nut;
    err_kepsilon3 = err;
    time_kepsilon3 = elapsedTime;
    a_kepsilon3 = a;
    CFL_kepsilon3 = CFL;
    eps_kepsilon3 = eps;
    D_kepsilon3 = D;
    save(strcat('kepsilon3_',dname,'.mat'),'n_kepsilon3','y_kepsilon3','u_kepsilon3',...
        'k_kepsilon3','ep_kepsilon3','nut_kepsilon3','err_kepsilon3',...
        'time_kepsilon3','a_kepsilon3','CFL_kepsilon3','eps_kepsilon3',...
        'D_kepsilon3');
elseif num == 34
    n_kepsilon4 = n;
    y_kepsilon4 = y;
    u_kepsilon4 = u;
    k_kepsilon4 = k;
    ep_kepsilon4 = ep;
    nut_kepsilon4 = nut;
    err_kepsilon4 = err;
    time_kepsilon4 = elapsedTime;
    a_kepsilon4 = a;
    CFL_kepsilon4 = CFL;
    eps_kepsilon4 = eps;
    save(strcat('kepsilon4_',dname,'.mat'),'n_kepsilon4','y_kepsilon4','u_kepsilon4',...
        'k_kepsilon4','ep_kepsilon4','nut_kepsilon4','err_kepsilon4',...
        'time_kepsilon4','a_kepsilon4','CFL_kepsilon4','eps_kepsilon4');
elseif num == 35
    n_kepsilon5 = n;
    y_kepsilon5 = y;
    u_kepsilon5 = u;
    k_kepsilon5 = k;
    ep_kepsilon5 = ep;
    nut_kepsilon5 = nut;
    err_kepsilon5 = err;
    time_kepsilon5 = elapsedTime;
    a_kepsilon5 = a;
    CFL_kepsilon5 = CFL;
    eps_kepsilon5 = eps;
    save(strcat('kepsilon5_',dname,'.mat'),'n_kepsilon5','y_kepsilon5','u_kepsilon5',...
        'k_kepsilon5','ep_kepsilon5','nut_kepsilon5','err_kepsilon5',...
        'time_kepsilon5','a_kepsilon5','CFL_kepsilon5','eps_kepsilon5');
elseif num == 36
    n_kepsilon6= n;
    y_kepsilon6 = y;
    u_kepsilon6 = u;
    k_kepsilon6 = k;
    ep_kepsilon6 = ep;
    nut_kepsilon6 = nut;
    err_kepsilon6 = err;
    time_kepsilon6 = elapsedTime;
    a_kepsilon6 = a;
    CFL_kepsilon6 = CFL;
    eps_kepsilon6 = eps;
    save(strcat('kepsilon6_',dname,'.mat'),'n_kepsilon6','y_kepsilon6','u_kepsilon6',...
        'k_kepsilon6','ep_kepsilon6','nut_kepsilon6','err_kepsilon6',...
        'time_kepsilon6','a_kepsilon6','CFL_kepsilon6','eps_kepsilon6');
end
        
        