close all;
global pets

pets = {'Gallotia_atlantica','Gallotia_bravoana','Gallotia_caesaris','Gallotia_galloti','Gallotia_intermedia','Gallotia_simonyi','Gallotia_stehlini',};

estim_options('default');
estim_options('max_step_number', 1e3);
estim_options('max_fun_evals',5e3);

estim_options('pars_init_method', 2);
estim_options('results_output', 5);
estim_options('method', 'no');

estim_pars;

