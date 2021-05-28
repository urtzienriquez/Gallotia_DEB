
members = clade('Squamata');
complete_mre = read_stat(select('Squamata'), 'COMPLETE', 'MRE');
mods = read_stat(select('Squamata'), 'model');
u_mods = unique(mods);
sum(count(mods, u_mods(1))); % 103 std models
sum(count(mods, u_mods(2))); % 3 stf models (std with foetal development)

% Should we just compare sp with the same model?


% stats for atlantica
load('results_Gallotia_atlantica.mat')
[stat_atlantica, txtStat_atlantica] = statistics_st(metaPar.model, par);

% stats for bravoana
load('results_Gallotia_bravoana.mat')
[stat_bravoana, txtStat_bravoana] = statistics_st(metaPar.model, par);

% stats for caesaris
load('results_Gallotia_caesaris.mat')
[stat_caesaris, txtStat_caesaris] = statistics_st(metaPar.model, par);

% stats for galloti
load('results_Gallotia_galloti.mat')
[stat_galloti, txtStat_galloti] = statistics_st(metaPar.model, par);

% stats for intermedia
load('results_Gallotia_intermedia.mat')
[stat_intermedia, txtStat_intermedia] = statistics_st(metaPar.model, par);

% stats for simonyi
load('results_Gallotia_simonyi.mat')
[stat_simonyi, txtStat_simonyi] = statistics_st(metaPar.model, par);

% stats for stehlini
load('results_Gallotia_stehlini.mat')
[stat_stehlini, txtStat_stehlini] = statistics_st(metaPar.model, par);


% printstat_st(stat_atlantica, txtStat_atlantica)


% % define legend
legend_sq = {...
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Lacertidae'; ...
    {'o', 2, 2, [0 0 0], [1 1 1]}, 'Squamata'; ...
  };

shstat_options('default'); 
shstat_options('x_label', 'on');
shstat_options('y_label', 'on');
shstat_options('z_label', 'off');
    
all_pars = read_allStat('p_M', 'p_Am', 'L_i', 's_M', 'v', 'kap', 's_s');
p_M = all_pars(:,1); % somatic maintenance costs
p_Am = all_pars(:,2) .* all_pars(:,4); % surf. area sp. max. assimilation rate
L_i = all_pars(:,3); % ultimate size
v = all_pars(:,5); % energy conductance
k = all_pars(:,6); % kappa allocation to soma
s_s = all_pars(:,7); % supply stress

[Hfig, Hleg] = shstat([L_i, s_s], legend_sq); 
figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
xlabel('_{10}log L_\infty , cm')  
ylabel('_{10}log s_s') 
% zlabel('_{10}log [p_M], J/d.cm^3')      

hold on
plot(log10(stat_atlantica.L_i), log10(stat_atlantica.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
plot(log10(stat_bravoana.L_i), log10(stat_bravoana.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
plot(log10(stat_caesaris.L_i), log10(stat_caesaris.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
plot(log10(stat_galloti.L_i), log10(stat_galloti.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
plot(log10(stat_intermedia.L_i), log10(stat_intermedia.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
plot(log10(stat_simonyi.L_i), log10(stat_simonyi.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
plot(log10(stat_stehlini.L_i), log10(stat_stehlini.s_s), 'o', 'Color',[1 0 1], 'MarkerFaceColor',[1 0 1], 'markersize', 10)
hold off
