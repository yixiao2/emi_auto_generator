function generate_AddDataByID_code(alm_data)

%
% PreProcessing
%

if (isfield(alm_data,'pack_vars_at_column_level'))
    emi_constants_prefix = ['L2E_' alm_data.emi_constants_prefix];
    vars                 = alm_data.pack_vars_at_column_level;
    long_name_suffix     = 'ALM to External Model';
    
    generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix);
end

if (isfield(alm_data,'pack_vars_at_patch_level'))
    emi_constants_prefix = ['L2E_' alm_data.emi_constants_prefix];
    vars                 = alm_data.pack_vars_at_patch_level;
    long_name_suffix     = 'ALM to External Model';
    
    generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix);
end

if (isfield(alm_data,'pack_vars_at_grid_level'))
    emi_constants_prefix = ['L2E_' alm_data.emi_constants_prefix];
    vars                 = alm_data.pack_vars_at_grid_level;
    long_name_suffix     = 'ALM to External Model';
    
    generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix);
end

if (isfield(alm_data,'unpack_vars_at_column_level'))
    emi_constants_prefix = ['E2L_' alm_data.emi_constants_prefix];
    vars                 = alm_data.unpack_vars_at_column_level;
    long_name_suffix     = 'External Model to ALM';
    
    generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix);
end

if (isfield(alm_data,'unpack_vars_at_patch_level'))
    emi_constants_prefix = ['E2L_' alm_data.emi_constants_prefix];
    vars                 = alm_data.unpack_vars_at_patch_level;
    long_name_suffix     = 'External Model to ALM';
    
    generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix);
end

if (isfield(alm_data,'unpack_vars_at_grid_level'))
    emi_constants_prefix = ['E2L_' alm_data.emi_constants_prefix];
    vars                 = alm_data.unpack_vars_at_grid_level;
    long_name_suffix     = 'External Model to ALM';
    
    generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix);
end


