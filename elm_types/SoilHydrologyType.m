function SoilHydrologyType()

filename = 'F90/EMI_SoilHydrologyType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'STATE';
alm_type.alm_mod_name         = 'SoilHydrologyType';
alm_type.alm_var_name         = 'SoilHydrology';
alm_type.alm_type_name        = 'soilhydrology_type';

%
% L2E at column level
%

count = 0;

% 01)
var.name              = 'Water table depth';
var.unit              = '[m]';
var.emi_constant_name = 'WTD';
var.alm_name          = 'zwt_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

% 02)
var.name              = 'Aquifer recharge rate';
var.unit              = '[mm/s]';
var.emi_constant_name = 'QCHARGE';
var.alm_name          = 'qcharge_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.emi_constants_prefix = 'L2E_FLUX';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

% 03)
var.name              = 'Fractional impermeability';
var.unit              = '[-]';
var.alm_name          = 'fracice_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;


%
% E2L at column level
%

count = 0;

% 01)
var.name              = 'Water table depth';
var.unit              = '[m]';
var.emi_constant_name = 'WTD';
var.alm_name          = 'zwt_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.unpack_vars.column_level{count} = var; clear var;

% 02)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'AQUIFER_RECHARGE';
var.alm_name          = 'qcharge_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.emi_constants_prefix = 'E2L_FLUX';
count=count+1;alm_type.unpack_vars.column_level{count} = var; clear var;


generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)

