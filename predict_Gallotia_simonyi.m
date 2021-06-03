function [prdData, info] = predict_Gallotia_simonyi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_E; % g, egg wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap; % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v; % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m); % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G; % mol/mol, reserve capacity
  ome_m = m_Em_m * w_E/ w_V; % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m; L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, max ultimate length
  pars_tpm = [g_m k l_T v_Hb v_Hpm]; % pars for males
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % - , scaled time, length
  L_bm = L_mm * l_bm; L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M;  % cm, lengths
  Ww_im = L_im^3 * (1 + f * ome_m); % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % length - yearly fecundity
    f_LN = f; % assume same f as zero-variate as default
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  LN = TC_LN * 365 * reprod_rate(LN(:,1) * del_M, f_LN, pars_R); % #, yearly fecundity

  % time-SVL juveniles
  f_tL = f; % assume same f as zero-variate as default
    L_i = L_m * (f_tL-l_T);  % cm, ultimate structural length at f; if f_tL very different, L_b needs to be recalculated too
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  ELwj = (L_i - (L_i - L_b) * exp( - rT_B * tL_j(:,1)))/ del_M; % cm, SVL 
  
  % time-SVL adults
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, SVL 
  
  % pack to output
  prdData.LN = LN;
  prdData.tL_j = ELwj;
  prdData.tL = ELw;
  
