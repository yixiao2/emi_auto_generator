function SoilStateType()

filename = 'F90/EMI_SoilStateType_ExchangeMod.F90';

alm_type.emi_constants_prefix = 'PARAMETER';
alm_type.alm_mod_name         = 'SoilStateType';
alm_type.alm_var_name         = 'SoilState';
alm_type.alm_type_name        = 'soilstate_type';

%
% L2E at column level
%

count = 0;

% 01)
var.name              = 'Soil porosity';
var.unit              = '[m^3/m^3]';
var.emi_constant_name = 'WATSATC';
var.alm_name          = 'watsat_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 02)
var.name              = 'Soil hydraulic conductivity';
var.unit              = '[mm/s]';
var.emi_constant_name = 'HKSATC';
var.alm_name          = 'hksat_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 03)
var.name              = 'Clapp and Hornberger parameter';
var.unit              = '[-]';
var.emi_constant_name = 'BSWC';
var.alm_name          = 'bsw_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 04)
var.name              = 'Minimum soil sucsatc';
var.unit              = '[mm]';
var.emi_constant_name = 'SUCSATC';
var.alm_name          = 'sucsat_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 05)
var.name              = 'Effective porosity';
var.unit              = '[-]';
var.emi_constant_name = 'EFFPOROSITYC';
var.alm_name          = 'eff_porosity_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 06)
var.name              = 'Heat capacity';
var.unit              = '[W/m/K]';
var.emi_constant_name = 'CSOL';
var.alm_name          = 'csol_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 07)
var.name              = 'Thermal conductivity minearls';
var.unit              = '[W/m/K]';
var.emi_constant_name = 'TKMG';
var.alm_name          = 'tkmg_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 08)
var.name              = 'Thermal conductivity dry soils';
var.unit              = '[W/m/K]';
var.emi_constant_name = 'TKDRY';
var.alm_name          = 'tkdry_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 09)
var.name              = 'Organic matter';
var.unit              = '[-]';
var.emi_constant_name = 'CELLORG';
var.alm_name          = 'cellorg_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 10)
var.name              = 'Clay value';
var.unit              = '[%]';
var.emi_constant_name = 'CELLCLAY';
var.alm_name          = 'cellclay_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 11)
var.name              = 'Sand value';
var.unit              = '[%]';
var.emi_constant_name = 'CELLSAND';
var.alm_name          = 'cellsand_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

% 12)
var.name              = 'Bulk density';
var.unit              = '[kg/m^3]';
var.emi_constant_name = 'BD';
var.alm_name          = 'bd_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;
% 
% 13)
var.name              = 'Volumetric soil water at field capacity';
var.unit              = '[m^3/m^3]';
var.emi_constant_name = 'WATFC';
var.alm_name          = 'watfc_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_column_level{count} = var; clear var;

%
% L2E at patch level
%

count = 0;
% 1)
var.name              = 'Fraction of roots in each soil layer';
var.unit              = '[-]';
var.emi_constant_name = 'ROOTFR_PATCH';
var.alm_name          = 'rootfr_patch';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begp';
var.dim1_end_name     = 'endp';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
count=count+1;alm_type.pack_vars_at_patch_level{count} = var; clear var;

%
% E2L at column level
%

count = 0;

% 01)
var.name              = '';
var.unit              = '[]';
var.emi_constant_name = 'SOIL_MATRIC_POTENTIAL';
var.alm_name          = 'smp_l_col';
var.dimension         = 2;
var.is_real           = true;
var.dim1_beg_name     = 'begc';
var.dim1_end_name     = 'endc';
var.dim2_beg_name     = '1';
var.dim2_end_name     = 'nlevgrnd';
var.emi_constants_prefix = 'E2L_STATE';
count=count+1;alm_type.unpack_vars_at_column_level{count} = var; clear var;

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
generate_AddDataByID_code(alm_type)
