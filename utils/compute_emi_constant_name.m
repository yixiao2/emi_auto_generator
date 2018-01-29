% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% 
% Given a variables, computes a the EMI contants variable name.
%
% EMI_VAR_CONTANT_NAME = CONSTANT_PREFIX '_' CONSTANT_NAME
%
% where 
%   CONSTANT_PREFIX = var.emi_constant_prefix    if var.emi_constant_prefix exists
%                   = constant_prefix
%
%   CONSTANT_NAME   = var.emi_constant_name      if var.emi_constant_name exists
%                   = upper(var.alm_name)
%
% E.g. of EMI contant variable name are:
%  - 'L2E_STATE_FORC_PBOT_DOWNSCALED'
%  - 'E2L_STATE_FSUN'
%  - 'L2E_PARAMETER_WATSATC'
%
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function emi_constant_name = compute_emi_constant_name(var,constant_prefix)

if (~isfield(var,'emi_constant_name'))
    tmp = findstr(var.alm_name,'_');
    if(~isfield(var,'emi_constants_prefix'))
        emi_constant_name = [constant_prefix '_' upper(var.alm_name(1:tmp(end)-1))];
    else
        emi_constant_name = [upper(var.emi_constants_prefix) '_' upper(var.alm_name(1:tmp(end)-1))];
    end
else
    if(~isfield(var,'emi_constants_prefix'))
        emi_constant_name = [constant_prefix '_' upper(var.emi_constant_name)];
    else
        emi_constant_name = [upper(var.emi_constants_prefix) '_' upper(var.emi_constant_name)];
    end
end
