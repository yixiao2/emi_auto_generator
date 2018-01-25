function EnergyFluxType()

filename = 'F90/EMI_EnergyFluxType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'FLUX';
alm_type.alm_mod_name         = 'EnergyFluxType';
alm_type.alm_var_name         = 'EnergyFlux';
alm_type.alm_type_name        = 'energyflux_type';

%
% L2E at column level
%

count = 0;

% 01)
var.emi_constant_name = 'ABSORBED_SOLAR_RADIATION';
var.alm_name          = 'eflx_sabg_lyr_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '-nlevsno+1';
var.dim2_end_name     = '1';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 03)
var.emi_constant_name = 'SOIL_HEAT_FLUX';
var.alm_name          = 'eflx_hs_soil_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 04)
var.emi_constant_name = 'SNOW_HEAT_FLUX';
var.alm_name          = 'eflx_hs_top_snow_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 05)
var.emi_constant_name = 'H2OSFC_HEAT_FLUX';
var.alm_name          = 'eflx_hs_h2osfc_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 06)
var.emi_constant_name = 'DERIVATIVE_OF_HEAT_FLUX';
var.alm_name          = 'eflx_dhsdT_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
