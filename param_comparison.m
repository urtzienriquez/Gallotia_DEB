
members = clade('Squamata');
complete_mre = read_stat(select('Squamata'), 'COMPLETE', 'MRE');
mods = read_stat(select('Squamata'), 'model');
u_mods = unique(mods);
sum(count(mods, u_mods(1))); % 103 std models
sum(count(mods, u_mods(2))); % 3 stf models (std with foetal development)

% Should we just compare sp with the same model?



% % define legend
legend_sq = {...
    {'o', 8, 3, [1 0 1], [1 0 1]}, 'Gallotia'; ...
    {'o', 8, 3, [0 0 0], [0 0 0]}, 'Lacertidae'; ...
    {'o', 2, 2, [0 0 0], [1 1 1]}, 'Squamata'; ...
  };

shstat_options('default'); 
shstat_options('x_label', 'on');
shstat_options('y_label', 'on');
shstat_options('z_label', 'on');
    
all_pars = read_allStat('p_M', 'p_Am', 'L_i', 's_M', 'v', 'kap', 's_s');
p_M = all_pars(:,1); % somatic maintenance costs
p_Am = all_pars(:,2) .* all_pars(:,4); % surf. area sp. max. assimilation rate
L_i = all_pars(:,3); % ultimate size
v = all_pars(:,5); % energy conductance
k = all_pars(:,6); % kappa allocation to soma
s_s = all_pars(:,7); % supply stress

[Hfig, Hleg] = shstat([p_Am, p_M, v], legend_sq); 
figure(Hfig) % add labels to figure, because this is not done by shstat in numerical mode
xlabel('_{10}log \{p_{Am}\}, J/d.cm^2')  
ylabel('_{10}log [p_M], J/d.cm^3') 
zlabel('_{10}log v, cm/d')      


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multi-dimensional scaling

lizards = 'Lacertidae'; % options: 'Squamata', 'Gallotia', ''Lacertidae'
% traits = {'a_m'; 'a_p'; 'a_b'; 'Ww_i'; 'Ww_p'; 'Ww_b'; 'R_i'; 's_s'; 's_Hbp'; 'p_M'; 'v'; 'kap'; 'E_Hb'; 'E_Hp'};
% traits = {'v'; 'E_m'; 'a_p'; 'p_M'; 'L_m'; 'R_i'}; % use anything from allStat
traits = {'v'; 'E_m'; 'E_G'; 'p_M'; 'E_Hp'; 'E_Hb'; 'kap'; 'p_Am'; 'h_a'}; % use anything from allStat
% --> for Gallotia, we can only use up to 7 traits
% traits = {'v'; 'E_m'; 'E_G'; 'p_M'; 'E_Hp'; 'kap'; 'p_Am'}; 
% traits = {'del_M'};

switch lizards
    case 'Squamata'
        species = select('Squamata');
        legend_liz = legend_sq; % use the previously defined legend for squamata
    case 'Gallotia'
        species = select('Gallotia');
        legend_liz = {...
            % big gallotias, red edge
            {'o', 8, 3, [1 0 0], [0 0 0]}, 'Gallotia_intermedia'; ...
            {'o', 8, 3, [1 0 0], [1 0 0]}, 'Gallotia_simonyi'; ...
            {'o', 8, 3, [1 0 0], [1 1 0]}, 'Gallotia_stehlini'; ...
            {'o', 8, 3, [1 0 0], [1 0 1]}, 'Gallotia_bravoana'; ...
            % other gallotia, blue edge
            {'o', 6, 3, [0 0 1], [0 0 1]}, 'Gallotia_atlantica'; ....
            {'o', 6, 3, [0 0 1], [1 1 1]}, 'Gallotia_caesaris'; ....
            {'o', 6, 3, [0 0 1], [0 0 1]}, 'Gallotia_galloti'; ....
            };
        case 'Lacertidae'
        species = select('Lacertidae');
        legend_liz = {...
            % big gallotias, red edge
            {'o', 8, 3, [1 0 0], [0 0 0]}, 'Gallotia_intermedia'; ...
            {'o', 8, 3, [1 0 0], [1 0 0]}, 'Gallotia_simonyi'; ...
            {'o', 8, 3, [1 0 0], [1 1 0]}, 'Gallotia_stehlini'; ...
            {'o', 8, 3, [1 0 0], [1 0 1]}, 'Gallotia_bravoana'; ...
            % other gallotia, blue edge
            {'o', 6, 3, [0 0 1], [0 0 1]}, 'Gallotia_atlantica'; ....
            {'o', 6, 3, [0 0 1], [1 1 1]}, 'Gallotia_caesaris'; ....
            {'o', 6, 3, [0 0 1], [0 0 1]}, 'Gallotia_galloti'; ....
            % Lacertidae - black dots
            {'o', 8, 3, [0 0 0], [0 0 0]}, 'Lacertidae'; ...
            };
end
               
% first compute distance-matrix and pass it to cmdscale
[dist, val] = dist_traits(species, traits); % distances between species based on traits
[y,e]=cmdscale(dist); % configuration matrix, eigenvalues
n_traits= length(traits); E = e(n_traits)/e(1);
fprintf(['With ', num2str(n_traits), ' traits the, ', num2str(n_traits), '-th eigenvalue as fraction of the first one is ', num2str(E), '\n'])
%return

% make sure that the number of rows of data matches the number of entries
data = NaN(length(select),3); data(select_01(lizards),:) = y(:,1:3);

% plot with legend in second figure
shstat_options('default');
shstat_options('x_transform', 'none');
shstat_options('y_transform', 'none');
shstat_options('z_transform', 'none');
[Hfig, Hleg] = shstat(data, legend_liz, [lizards, ' ', num2str(length(species)), ' @ ', datestr(date,26)]);

fig(Hleg)
xlabel('Coordinate 1')
ylabel('Coordinate 2')
zlabel('Coordinate 3')
title(lizards)
%saveas (Hleg, 'SquamataLegend.png')

switch lizards
    case 'Squamata'
        % connect the points for subclades
        connect_subclade(Hfig, y(:,1:3), 'Squamata', 'Gallotia');
end

%saveas (Hfig, 'SquamataMds.png')

figure % plot eigenvalues
n_e = length(e); n_t = length(traits);
plot(1:n_t, e(1:n_t), '*b', n_t+1:n_e, e(n_t+1:n_e), '*r')
xlabel('rank');
ylabel('eigenvalue');
title(['MDS for ', lizards]);
set(gca, 'FontSize', 15, 'Box', 'on');
%saveas (gca, 'SquamataEigen.png')

c =NaN(3,size(val,2));
for i=1: size(val,2)
    c(1,i) = corr(y(:,1), val(:,i));
    c(2,i) = corr(y(:,2), val(:,i));
    c(3,i) = corr(y(:,3), val(:,i));
end
traits'
c


