

% % define legend
legend_gal = {...
    {'o', 4, 4, [1 0 1], [1 0 1]}, 'Gallotia_atlantica'; ...
    {'o', 4, 4, [1 0 1], [1 0 1]}, 'Gallotia_caesaris'; ...
    {'o', 4, 4, [1 0 1], [1 0 1]}, 'Gallotia_galloti'; ...
    {'o', 8, 8, [0 0 0], [0 0 0]}, 'Gallotia_bravoana'; ...
    {'o', 8, 8, [0 0 0], [0 0 0]}, 'Gallotia_intermedia'; ...
    {'o', 8, 8, [0 0 0], [0 0 0]}, 'Gallotia_simonyi'; ...
    {'o', 8, 8, [0 0 0], [0 0 0]}, 'Gallotia_stehlini'; ...
  };

shstat_options('default'); 
shstat_options('x_transform', 'none');
shstat_options('y_transform', 'none');
shstat_options('x_label', 'on');
shstat_options('y_label', 'on');
shstat_options('z_label', 'off');
    
all_pars = read_allStat('p_M', 'p_Am', 'L_i', 's_M', 'v', 'kap', 's_s', 'p_Ji');
p_M = all_pars(:,1); % somatic maintenance costs
p_Am = all_pars(:,2) .* all_pars(:,4); % surf. area sp. max. assimilation rate
L_i = all_pars(:,3); % ultimate size
v = all_pars(:,5); % energy conductance
k = all_pars(:,6); % kappa allocation to soma
s_s = all_pars(:,7); % supply stress
p_Ji = all_pars(:,8); % maturity maintenance costs

[Hfig, Hleg] = shstat([p_Am, p_Ji], legend_gal); 
figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
xlabel('p_Am')  
ylabel('p_Ji') 

%saveas (Hfig, 'assimilationVSmaturmaint.png')





