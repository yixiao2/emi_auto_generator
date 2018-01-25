function CanopyStateType()

filename = 'F90/EMI_CanopyStateType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'STATE';
alm_type.alm_mod_name         = 'CanopyStateType';
alm_type.alm_var_name         = 'CanopyState';
alm_type.alm_type_name        = 'canopystate_type';

%
% L2E at column level
%

count = 0;

% 01)
var.name              = 'Maximum annual depth of thaw';
var.unit              = '[m]';
var.emi_constant_name = 'ALTMAX';
var.alm_name          = 'altmax_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 02)
var.name              = 'Prior year maximum annual depth of thaw';
var.unit              = '[m]';
var.emi_constant_name = 'ALTMAX_LASTYEAR';
var.alm_name          = 'altmax_lastyear_col';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;


%
% L2E at patch level
%

count = 0;

% 01)
var.name              = 'Laminar boundary layer resistance for water over dry leaf';
var.unit              = '[s/m]';
var.emi_constant_name = 'LBL_RSC_H2O';
var.alm_name          = 'lbl_rsc_h2o_patch';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
count=count+1;alm_type.pack_vars_at_patch_level{count} = var; clear var;

% 02)
var.name              = 'Canopy one-sided leaf area index with burying by snow';
var.unit              = '[-]';
var.emi_constant_name = 'ELAI';
var.alm_name          = 'elai_patch';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
count=count+1;alm_type.pack_vars_at_patch_level{count} = var; clear var;

%
% E2L at patch level
%

count = 0;

% 01)
var.name              = 'Sunlit fraction';
var.unit              = '[-]';
var.emi_constant_name = 'FSUN';
var.alm_name          = 'fsun_patch';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
count=count+1;alm_type.unpack_vars_at_patch_level{count} = var; clear var;

% 02)
var.name              = 'Sunlit projected leaf area index';
var.unit              = '[-]';
var.emi_constant_name = 'LAISUN';
var.alm_name          = 'laisun_patch';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
count=count+1;alm_type.unpack_vars_at_patch_level{count} = var; clear var;

% 03)
var.name              = 'Shaded projected leaf area index';
var.unit              = '[]';
var.emi_constant_name = 'LAISHA';
var.alm_name          = 'laisha_patch';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
count=count+1;alm_type.unpack_vars_at_patch_level{count} = var; clear var;


generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
