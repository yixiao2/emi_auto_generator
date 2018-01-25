function ChemStateType()

filename = 'F90/EMI_ChemStateType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'STATE';
alm_type.alm_mod_name         = 'ChemStateType';
alm_type.alm_var_name         = 'ChemState';
alm_type.alm_type_name        = 'chemstate_type';

%
% L2E at column level
%

count = 0;

% 01)
var.name              = 'Soil pH';
var.unit              = '[-]';
var.emi_constant_name = 'SOIL_PH';
var.alm_name          = 'soil_ph';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;


generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
