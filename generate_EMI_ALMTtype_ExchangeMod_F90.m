function generate_EMI_ALMTtype_ExchangeMod_F90(alm_data, filename)

%
% PreProcessing
%

alm_mod_name  = alm_data.alm_mod_name;
alm_var_name  = alm_data.alm_var_name;
alm_type_name = alm_data.alm_type_name;

fid = fopen(filename,'w');

generate_Module_Definition(alm_data, fid);

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