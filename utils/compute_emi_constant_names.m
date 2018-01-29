% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% 
% Given a list of variables, computes a list of EMI contants variable
% names.
% 
% E.g. of contant_prefix = 'L2E_STATE'
% 
% E.g. of EMI contant variable names
%  - 'L2E_STATE_FORC_PBOT_DOWNSCALED'
%  - 'E2L_STATE_FSUN'
%  - 'L2E_PARAMETER_WATSATC'
%
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function emi_constant_names = compute_emi_constant_names(vars,constant_prefix)

emi_constant_names = '';

for vv = 1:length(vars)    
    emi_constant_name = compute_emi_constant_name(vars{vv},constant_prefix);
    emi_constant_names = update_list(emi_constant_names, emi_constant_name);
end