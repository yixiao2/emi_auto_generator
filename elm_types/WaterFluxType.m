function WaterFluxType()

filename = 'F90/EMI_WaterFluxType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'FLUX';
alm_type.alm_mod_name         = 'WaterFluxType';
alm_type.alm_var_name         = 'WaterFlux';
alm_type.alm_type_name        = 'waterflux_type';

%
% L2E at column level
%

count = 0;

% 01)
var.name              = 'Soil infiltration source';
var.unit              = '[kg/s]';
var.emi_constant_name = 'INFIL_MASS_FLUX';
var.alm_name          = 'mflx_infl_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 02)
var.name              = 'Evapotranspiration sink';
var.unit              = '[kg/s]';
var.emi_constant_name = 'VERTICAL_ET_MASS_FLUX';
var.alm_name          = 'mflx_et_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 03)
var.name              = 'Dew sink';
var.unit              = '[kg/s]';
var.emi_constant_name = 'DEW_MASS_FLUX';
var.alm_name          = 'mflx_dew_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 04)
var.name              = 'Snow layer disappearance sink';
var.unit              = '[kg/s]';
var.emi_constant_name = 'SNOW_SUBLIMATION_MASS_FLUX';
var.alm_name          = 'mflx_sub_snow_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 05)
var.name              = 'Snow layer disappearance sink';
var.unit              = '[kg/s]';
var.emi_constant_name = 'SNOW_LYR_DISAPPERANCE_MASS_FLUX';
var.alm_name          = 'mflx_snowlyr_disp_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 06)
var.name              = 'Snow layer disappearance sink needed at restart';
var.unit              = '[kg/s]';
var.emi_constant_name = 'RESTART_SNOW_LYR_DISAPPERANCE_MASS_FLUX';
var.alm_name          = 'mflx_snowlyr_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 07)
var.name              = 'Drainage sink';
var.unit              = '[kg/s]';
var.emi_constant_name = 'DRAINAGE_MASS_FLUX';
var.alm_name          = 'mflx_drain_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 08)
var.name              = 'Infiltration';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'INFL';
var.alm_name          = 'qflx_infl_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;
% 
% 09)
var.name              = 'Drainage sink';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'TOTDRAIN';
var.alm_name          = 'qflx_totdrain_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 10)
var.name              = 'Gross evaporation from soil';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'GROSS_EVAP_SOIL';
var.alm_name          = 'qflx_gross_evap_soil_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 11)
var.name              = 'Gross evaporation infiltration';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'GROSS_INFL_SOIL';
var.alm_name          = 'qflx_gross_infl_soil_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 12)
var.name              = 'Surface runoff';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'SURF';
var.alm_name          = 'qflx_surf_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 13)
var.name              = 'Surface dew added to ground';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'DEW_GRND';
var.alm_name          = 'qflx_dew_grnd_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 14)
var.name              = 'Surface dew added to snow pacK';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'DEW_SNOW';
var.alm_name          = 'qflx_dew_snow_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 15)
var.name              = 'Sublimation vol from snow pack';
var.unit              = '[mm H2O]';
var.emi_constant_name = 'SUB_SNOW_VOL';
var.alm_name          = 'qflx_h2osfc2topsoi_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 16)
var.name              = 'sublimation rate from snow pack';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'SUB_SNOW';
var.alm_name          = 'qflx_sub_snow_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 17)
var.name              = 'Rate of surface standing water entering top soil';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'H2OSFC2TOPSOI';
var.alm_name          = 'qflx_h2osfc2topsoi_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 18)
var.name              = 'Rate of snow entering top soil';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'SNOW2TOPSOI';
var.alm_name          = 'qflx_snow2topsoi_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 19)
var.name              = 'Root and soil water exchange';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'ROOTSOI';
var.alm_name          = 'qflx_rootsoi_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 20)
var.name              = 'Advective flux across different soil layer interfaces';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'ADV';
var.alm_name          = 'qflx_adv_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '0';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 21)
var.name              = 'liquid water losted as drainage';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'DRAIN_VR';
var.alm_name          = 'qflx_drain_vr_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 22)
var.name              = 'vegetation transpiration';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'TRAN_VEG';
var.alm_name          = 'qflx_tran_veg_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 23)
var.name              = 'Root soil fraction';
var.unit              = '[mm H2O/s]';
var.emi_constant_name = 'ROOTSOI_FRAC';
var.alm_name          = 'qflx_rootsoi_frac_patch';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;


%
% E2L at column level
%

count = 0;

% 01)
var.name              = 'Aquifer recharge rate';
var.unit              = '[mm/s]';
var.emi_constant_name = 'AQUIFER_RECHARGE';
var.alm_name          = 'mflx_recharge_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.unpack_vars_at_column_level{count} = var; clear var;

% 02)
var.name              = 'Snow layer disappearance sink';
var.unit              = '[kg/s]';
var.emi_constant_name = 'SNOW_LYR_DISAPPERANCE_MASS_FLUX';
var.alm_name          = 'mflx_snowlyr_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.unpack_vars_at_column_level{count} = var; clear var;


generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
generate_AddDataByID_code(alm_type)