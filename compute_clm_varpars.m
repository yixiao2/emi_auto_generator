function clm_varpars = compute_clm_varpars(vars)

clm_varpars = '';

for vv = 1:length(vars)
    switch vars{vv}.dimension
        case 1
            name = compute_clm_varpar(vars{vv}.dim1_beg_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim1_end_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
        case 2
            name = compute_clm_varpar(vars{vv}.dim1_beg_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim1_end_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim2_beg_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim2_end_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
        case 3
            name = compute_clm_varpar(vars{vv}.dim1_beg_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim1_end_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim2_beg_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim2_end_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim3_beg_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
            name = compute_clm_varpar(vars{vv}.dim3_end_name);if (~isempty(name)); clm_varpars = update_list(clm_varpars, name); end
        otherwise
    end
end