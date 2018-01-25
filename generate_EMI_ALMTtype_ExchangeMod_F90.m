function generate_EMI_ALMTtype_ExchangeMod_F90(alm_data, filename)

%
% PreProcessing
%

alm_mod_name  = alm_data.alm_mod_name;
alm_var_name  = alm_data.alm_var_name;
alm_type_name = alm_data.alm_type_name;

fid = fopen(filename,'w');

fprintf(fid, 'module EMI_%s_ExchangeMod\n', alm_mod_name);
fprintf(fid, '  !\n');

%
% USE statemnets
%
[buffer_1, buffer_2] = compute_buffer('  use ExternalModelIntefaceDataDimensionMod ,',sprintf('  use %s ,', alm_mod_name));
fprintf(fid, '  use shr_kind_mod                          %s, only : r8 => shr_kind_r8\n',buffer_1);
fprintf(fid, '  use shr_log_mod                           %s, only : errMsg => shr_log_errMsg\n',buffer_1);
fprintf(fid, '  use abortutils                            %s, only : endrun\n',buffer_1);
fprintf(fid, '  use clm_varctl                            %s, only : iulog\n',buffer_1);
fprintf(fid, '  use ExternalModelInterfaceDataMod         %s, only : emi_data_list, emi_data\n',buffer_1);
fprintf(fid, '  use ExternalModelIntefaceDataDimensionMod %s, only : emi_data_dimension_list_type\n',buffer_1);
fprintf(fid, '  use %s %s, only : %s\n', alm_mod_name,buffer_2,alm_type_name);
fprintf(fid, '  !\n');
fprintf(fid, '  implicit none\n');
fprintf(fid, '  !\n');
fprintf(fid, '  !\n');

if (isfield(alm_data,'pack_vars_at_column_level'))
    fprintf(fid, '  public :: EMI_Pack_%s_at_Column_Level_for_EM\n',alm_mod_name);
end
if (isfield(alm_data,'pack_vars_at_patch_level'))
    fprintf(fid, '  public :: EMI_Pack_%s_at_Patch_Level_for_EM\n',alm_mod_name);
end
if (isfield(alm_data,'pack_vars_at_grid_level'))
    fprintf(fid, '  public :: EMI_Pack_%s_at_Grid_Level_for_EM\n',alm_mod_name);
end
if (isfield(alm_data,'unpack_vars_at_column_level'))
    fprintf(fid, '  public :: EMI_Unpack_%s_at_Column_Level_from_EM\n',alm_mod_name);
end
if (isfield(alm_data,'unpack_vars_at_patch_level'))
    fprintf(fid, '  public :: EMI_Unpack_%s_at_Patch_Level_from_EM\n',alm_mod_name);
end
if (isfield(alm_data,'unpack_vars_at_grid_level'))
    fprintf(fid, '  public :: EMI_Unpack_%s_at_Grid_Level_from_EM\n',alm_mod_name);
end

fprintf(fid, '\n');
fprintf(fid, 'contains\n');
fprintf(fid, '  \n');


if (isfield(alm_data,'pack_vars_at_column_level'))
    emi_constants_prefix = ['L2E_' alm_data.emi_constants_prefix];
    vars                 = alm_data.pack_vars_at_column_level;
    Pack_Or_Unpack       = 'Pack';
    Level_text_name      = 'Column_Level';
    
    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
end

if (isfield(alm_data,'pack_vars_at_patch_level'))
    emi_constants_prefix = ['L2E_' alm_data.emi_constants_prefix];
    vars                 = alm_data.pack_vars_at_patch_level;
    Pack_Or_Unpack       = 'Pack';
    Level_text_name      = 'Patch_Level';
    
    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
end

if (isfield(alm_data,'pack_vars_at_grid_level'))
    emi_constants_prefix = ['L2E_' alm_data.emi_constants_prefix];
    vars                 = alm_data.pack_vars_at_grid_level;
    Pack_Or_Unpack       = 'Pack';
    Level_text_name      = 'Grid_Level';    
    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
end

if (isfield(alm_data,'unpack_vars_at_column_level'))
    emi_constants_prefix = ['E2L_' alm_data.emi_constants_prefix];
    vars                 = alm_data.unpack_vars_at_column_level;
    Pack_Or_Unpack       = 'Unpack';
    Level_text_name      = 'Column_Level';
    
    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
end

if (isfield(alm_data,'unpack_vars_at_patch_level'))
    emi_constants_prefix = ['E2L_' alm_data.emi_constants_prefix];
    vars                 = alm_data.unpack_vars_at_patch_level;
    Pack_Or_Unpack       = 'Unpack';
    Level_text_name      = 'Patch_Level';
    
    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
end

if (isfield(alm_data,'unpack_vars_at_grid_level'))
    emi_constants_prefix = ['E2L_' alm_data.emi_constants_prefix];
    vars                 = alm_data.unpack_vars_at_grid_level;
    Pack_Or_Unpack       = 'Unpack';
    Level_text_name      = 'Grid_Level';
    
    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
end

fprintf(fid, '\n');
fprintf(fid, 'end module EMI_%s_ExchangeMod\n', alm_mod_name);

fclose(fid);