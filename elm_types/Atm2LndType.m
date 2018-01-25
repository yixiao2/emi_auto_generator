function Atm2LndType()

filename = 'F90/EMI_Atm2LndType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'FLUX';
alm_type.alm_mod_name         = 'Atm2LndType';
alm_type.alm_var_name         = 'Atm2LndType';
alm_type.alm_type_name        = 'atm2lnd_type';

%
% L2E at grid level
%

count = 0;

% 01)
var.name              = 'Incident solar radiation';
var.unit              = '[W/m2]';
var.emi_constant_name = 'SOLAR_DIRECT_RADDIATION';
var.alm_name          = 'forc_solad_grc';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begg';
var.dim1_end_name     = 'endg';
var.dim2_beg_name     = '1';
var.dim2_end_name     = '2';
count=count+1;alm_type.pack_vars.grid_level{count} = var; clear var;

% 02)
var.name              = 'Incident diffuse solar radiation';
var.unit              = '[W/m2]';
var.emi_constant_name = 'SOLAR_DIFFUSE_RADDIATION';
var.alm_name          = 'forc_solai_grc';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begg';
var.dim1_end_name     = 'endg';
var.dim2_beg_name     = '1';
var.dim2_end_name     = '2';
count=count+1;alm_type.pack_vars.grid_level{count} = var; clear var;

%
% L2E at grid level
%

count = 0;

% 01)
var.name              = 'Downscaled atm pressure';
var.unit              = '[Pa]';
var.emi_constant_name = 'FORC_PBOT_DOWNSCALED';
var.alm_name          = 'forc_pbot_downscaled_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.emi_constants_prefix = 'L2E_STATE';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

% 02)
var.name              = 'Downscaled atm temperature';
var.unit              = '[K]';
var.emi_constant_name = 'FORC_T_DOWNSCALED';
var.alm_name          = 'forc_t_downscaled_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.emi_constants_prefix = 'L2E_STATE';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
