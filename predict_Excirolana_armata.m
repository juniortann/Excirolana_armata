function [prdData, info] = predict_Excirolana_armata(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_ur = tempcorr(temp.Ri, T_ref, T_A); kT_M_ur = k_M * TC;
  
  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f (remove d_V for wet weight)
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);      % g,  wet weight at puberty
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight (remove d_V for wet weight)
 
  % reproduction
  pars_R_ur = [kap; kap_R; g; k_J; kT_M_ur; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R_ur);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T


  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % time-length
  [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f);
  rT_B = kT_M/ 3/ (1 + f/ g);  L_i = L_m * f; L_b = L_m * l_b;      
  [t L] = ode45(@get_L, tL(:,1), L_b, [], rT_B, L_i, T_ref, T_A); % cm, structural length 
  ELw = L/ del_M;                       % g, total length
  
  
  % L-N data
  
    % Brazil
  pars_R_br = [kap; kap_R; g; k_J; kT_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN_br = TC * reprod_rate (LN_br(:,1) * del_M, f, pars_R_br) * 365/ 5;  % #/d, clutch size for spawning five times per yr (every two months)
  
    % Uruguai
  EN_ur = TC * reprod_rate (LN_ur(:,1) * del_M, f, pars_R_ur) * 365/ 5;  % #/d, clutch size for spawning five times per yr (every two months)
  

  %% pack to output
  prdData.tL = ELw;  
  prdData.LN_br = EN_br;
  prdData.LN_ur = EN_ur;
  
end

function dL = get_L(t, L, r_B, L_i, T_ref, T_A)
  TC = tempcorr(C2K(23+4*sin(2*pi*(t+10)/365)), T_ref, T_A); 
  dL = TC * r_B * (L_i - L);
end