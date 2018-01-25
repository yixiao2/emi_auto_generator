function ColumnType()

filename = 'F90/EMI_ColumnType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'COLUMN';
alm_type.alm_mod_name         = 'ColumnType';
alm_type.alm_var_name         = 'ColumnType';
alm_type.alm_type_name        = 'column_physical_properties_type';

%
% L2E at column level
%

count = 0;

% 01)
var.name              = 'Column active';
var.unit              = '[-]';
var.emi_constant_name = 'ACTIVE';
var.alm_name          = 'h2osoi_liq_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 02)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_ICE_NLEVGRND';
var.alm_name          = 'h2osoi_ice_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 03)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'VSFM_PROGNOSTIC_SOILP';
var.alm_name          = 'soilp_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 04)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'FRAC_H2OSFC_COL';
var.alm_name          = 'frac_h2osfc_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 05)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'FRAC_INUNDATED';
var.alm_name          = 'finundated_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 06)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_LIQ_VOL_NLEVSOI';
var.alm_name          = 'h2osoi_liqvol_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 07)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_ICE_VOL_NLEVSOI';
var.alm_name          = 'h2osoi_icevol_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 08)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_VOL_NLEVSOI';
var.alm_name          = 'h2osoi_vol_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 09)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'AIR_VOL_NLEVSOI';
var.alm_name          = 'air_vol_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 10)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'RHO_VAP_NLEVSOI';
var.alm_name          = 'rho_vap_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 11)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'RHVAP_SOI_NLEVSOI';
var.alm_name          = 'rhvap_soi_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 12)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'SOIL_MATRIC_POTENTIAL_NLEVSOI';
var.alm_name          = 'smp_l_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 13)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_LIQ_NLEVSOI';
var.alm_name          = 'h2osoi_liq_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 14)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_ICE_NLEVSOI';
var.alm_name          = 'h2osoi_ice_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 15)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_LIQ_NLEVSNOW';
var.alm_name          = 'h2osoi_liq_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '-nlevsno + 1';
var.dim2_end_name     = '0';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 16)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_ICE_NLEVSNOW';
var.alm_name          = 'h2osoi_ice_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '-nlevsno + 1';
var.dim2_end_name     = '0';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 17)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSNOW';
var.alm_name          = 'h2osno_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '-nlevsno + 1';
var.dim2_end_name     = '0';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 18)
var.name              = '';
var.unit              = '[]';
var.alm_name          = 'h2osfc_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 19)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'FRAC_SNOW_EFFECTIVE';
var.alm_name          = 'frac_sno_eff_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;



%
% E2L at column level
%

count = 0;

% 01)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_LIQ_NLEVSOI';
var.alm_name          = 'h2osoi_liq_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.unpack_vars_at_column_level{count} = var; clear var;

% 02)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'H2OSOI_ICE_NLEVSOI';
var.alm_name          = 'h2osoi_ice_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.unpack_vars_at_column_level{count} = var; clear var;

% 03)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'VSFM_PROGNOSTIC_SOILP';
var.alm_name          = 'soilp_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.unpack_vars_at_column_level{count} = var; clear var;


%generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
clc;generate_AddDataByID_code(alm_type)
