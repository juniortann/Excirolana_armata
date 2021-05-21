% * no input: print values to screen
% * one input:
%
%    'default': sets options at default values
%     any other key (see below): print value to screen
%
% * two inputs
%
%    'loss_function': 
%      're': relative error (symmetric by addition);
%      'sb': multiplicative symmetric bounded (default);
%      'su': multiplicative symmetric unbounded;
%
%    'filter': 
%      1: use filter (default); 
%      0: do not;
%
%    'pars_init_method':
%      0:  get initial estimates from automatized computation 
%      1:  read initial estimates from .mat file (for continuation)
%      2:  read initial estimates from pars_init file (default)
%
%    'results_output':
%      0     - only saves data to .mat (no printing to html or screen and no figures) - use this for (automatic) continuations 
%      1, -1 - no saving to .mat file, prints results to html (1) or screen (-1), shows figures but does not save them
%      2, -2 - saves to .mat file, prints results to html (2) or screen (-2), shows figures but does not save them
%      3, -3 - like 2 (or -2), but also prints graphs to .png files (default is 3)
%      4, -4 - like 3 (or -3), but also prints html with implied traits
%      5, -5 - like 4 (or -4), but includes related species in the implied traits
%      6     - like 5, but also prints html with population traits
%   
%    'method': 
%      'nm': use Nelder-Mead method; 
%      'no': do not estimate;

close all; 
global pets 

pets = {'Excirolana_armata'}; 
check_my_pet(pets);

estim_options('default'); 
estim_options('max_step_number', 5e2); 
estim_options('max_fun_evals', 5e3); 

estim_options('pars_init_method', 2); 
estim_options('results_output', 2); 
estim_options('method', 'no'); 

estim_pars; 
