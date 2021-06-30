function [par, metaPar, txtPar] = pars_init_group(metaData)

metaPar.model = {'std','std','std','std','std','std','std'};
metaPar.cov_rules = '';
metaPar.weights.z = 0.2; % try also with zoom factor, which influences p_Am

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;                                                                       free.T_A   = 0;                 units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = [1.8975 4.8898 2.0172 2.6695 4.061 4.2331 4.1037];                            free.z     = [1 1 1 1 1 1 1];   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;                                                                        free.F_m   = 0;                 units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;                                                                      free.kap_X = 0;                 units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;                                                                      free.kap_P = 0;                 units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = [0.040042 0.07308 0.051718 0.06758 0.071619 0.075426 0.061548];               free.v     = [1 1 1 1 1 1 1];   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = [0.84149 0.70597 0.72987 0.63684 0.62573 0.59223 0.5945];                   free.kap   = [1 1 1 1 1 1 1];   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;                                                                     free.kap_R = 0;                 units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = [30.8417 19.9403 24.0755 13.1832 19.1861 20.9467 16.7467];                  free.p_M   = [1 1 1 1 1 1 1];   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;                                                                          free.p_T   = 0;                 units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;                                                                      free.k_J   = 0;                 units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
% par.E_G = [1.10* 7784.7429 7849.68 7806.0649 7820.2939 7843.3714 7807.0741 7849.2823];      free.E_G   = [1 1 1 1 1 1 1]; 
par.E_G =  mean([7784.7429 7849.68 7806.0649 7820.2939 7843.3714 7807.0741 7849.2823]);      free.E_G   = 1; 
units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = [6.122e+02 9.566e+03 2.073e+03 3.989e+03 9.509e+03 1.341e+04 8.602e+03];   free.E_Hb  = [1 1 1 1 1 1 1];   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = [8.116e+03 2.016e+05 1.441e+04 2.975e+04 1.597e+05 2.337e+05 1.453e+05];   free.E_Hp  = [1 1 1 1 1 1 1];   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = [1.096e-08 1.491e-09 9.015e-09 3.817e-09 1.522e-09 1.250e-09 1.147e-09];    free.h_a   = [1 1 1 1 1 1 1];   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;                                                                     free.s_G   = 0;                 units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hpm = [9.473e+04 0 9.346e+03 1.875e+04 1.383e+05 1.797e+05 1.838e+05]; free.E_Hpm = [1 0 1 1 1 1 1];   units.E_Hpm = 'J';        label.E_Hpm = 'maturity at puberty for males'; 
% par.del_M = [0.29222 0.28564 0.26833 0.23964 0.26048 0.25723 0.22604];               free.del_M = [1 1 1 1 1 1 1];   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_M = mean([0.29222 0.28564 0.26833 0.23964 0.26048 0.25723 0.22604]);  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;                                                                           free.f     = 0;                 units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
% par.f_tL_c = [NaN NaN 0.26062 NaN NaN NaN NaN];                                      free.f_tL_c  = [0 0 1 0 0 0 0]; units.f_tL_c = '-';       label.f_tL_c = 'scaled functional response for tL data caesaris'; 
% par.f_tL_g = [NaN NaN NaN 1.1919 NaN NaN NaN];                                       free.f_tL_g  = [0 0 0 1 0 0 0]; units.f_tL_g = '-';       label.f_tL_g = 'scaled functional response for tL data galloti'; 
% par.f_tL_s = [NaN NaN NaN NaN NaN NaN 1];                                            free.f_tL_s  = [0 0 0 0 0 0 1]; units.f_tL_s = '-';       label.f_tL_s = 'scaled functional response for tL data stehlini'; 
par.f_tL_c = 0.26062;                                      free.f_tL_c  = 0; units.f_tL_c = '-';       label.f_tL_c = 'scaled functional response for tL data caesaris'; 
par.f_tL_g = 1.1919;                                       free.f_tL_g  = 0; units.f_tL_g = '-';       label.f_tL_g = 'scaled functional response for tL data galloti'; 
par.f_tL_s = 1;                                            free.f_tL_s  = 0; units.f_tL_s = '-';       label.f_tL_s = 'scaled functional response for tL data stehlini'; 
par.z_m = [2.463 5.4412 2.4573 3.0984 4.1402 4.8562 4.2334];                         free.z_m   = [1 1 1 1 1 1 1];   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[phylum, class] = metaData2taxo(metaData);
[par, units, label, free] = addchem(par, units, label, free, phylum, class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
