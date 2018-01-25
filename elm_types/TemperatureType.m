function TemperatureType()

filename = 'F90/EMI_TemperatureType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'STATE';
alm_type.alm_mod_name         = 'TemperatureType';
alm_type.alm_var_name         = 'Temperature';
alm_type.alm_type_name        = 'temperature_type';

%
% L2E at column level
%

count = 0;

var.name              = 'Soil temperature';
var.unit              = '[K]';
var.emi_constant_name = 'TSOIL_NLEVGRND';
var.alm_name          = 't_soisno_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

var.name              = 'Snow temperature';
var.unit              = '[K]';
var.emi_constant_name = 'TSNOW';
var.alm_name          = 't_soisno_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '-nlevsno + 1';
var.dim2_end_name     = '0';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

var.name              = 'Standing water temperature';
var.unit              = '[K]';
var.alm_name          = 't_h2osfc_col';
var.emi_constant_name = 'TH2OSFC';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

var.name              = 'Soil temperature in top 10cm';
var.unit              = '[K]';
var.alm_name          = 't_soi10cm_col';
var.emi_constant_name = 'TSOI10CM';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

var.name              = 'Soil temperature in nlevsoi';
var.unit              = '[K]';
var.alm_name          = 't_soisno_col';
var.emi_constant_name = 'TSOIL_NLEVSOI';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevsoi';
count=count+1;alm_type.pack_vars.column_level{count} = var; clear var;

%
% L2E at patch level
%

count = 0;

var.name              = 'Vegetation temperature';
var.unit              = '[K]';
var.alm_name          = 't_veg_patch';
var.emi_constant_name = 'TVEG';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
count=count+1;alm_type.pack_vars.patch_level{count} = var; clear var;

%
% E2L at column level
%

count = 0;

var.name              = 'Soil temperature';
var.unit              = '[K]';
var.emi_constant_name = 'TSOIL_NLEVGRND';
var.alm_name          = 't_soisno_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.unpack_vars.column_level{count} = var; clear var;

var.name              = 'Snow temperature';
var.unit              = '[K]';
var.emi_constant_name = 'TSNOW_NLEVSNOW';
var.alm_name          = 't_soisno_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '-nlevsno + 1';
var.dim2_end_name     = '0';
count=count+1;alm_type.unpack_vars.column_level{count} = var; clear var;

var.name              = 'Standing water temperature';
var.unit              = '[K]';
var.alm_name          = 't_h2osfc_col';
var.emi_constant_name = 'TH2OSFC';
var.dimension         = 1;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
count=count+1;alm_type.unpack_vars.column_level{count} = var; clear var;

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
