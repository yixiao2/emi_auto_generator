function generate_AddDataByID_code_for_vars(vars, emi_constants_prefix, long_name_suffix)

constant_names      = compute_emi_constant_names(vars,emi_constants_prefix);
[associate_var_names, associate_var_names_buffers] = compute_associate_var_names(vars);

for vv = 1 : length(vars)
    var = vars{vv};
%     if (~isfield(var,'emi_constants_prefix'))
%         var_id = [emi_constants_prefix '_' constant_names{vv}];
%     else
%         var_id = [var.emi_constants_prefix '_' constant_names{vv}];
%     end
    var_id = constant_names{vv};
    disp(['    case (' var_id ')']);
    disp(['       id_val         = ' var_id ]);
    disp(['       name_val       = ' char(39) var.name char(39) ]);
    disp(['       long_name_val  = ' char(39) var.name ': ' long_name_suffix char(39)]);
    disp(['       units_val      = ' char(39) var.unit char(39) ]);
    if (isfield(var,'is_real'))
        if (var.is_real)
            disp(['       is_real_type   = .true.' ]);
        end
    end
    if (isfield(var,'is_int_type'))
        if (var.is_int_type)
            disp(['       is_int_type    = .true.' ]);
        end
    end
    disp(['       is_int_type    = .true.' ]);
    disp(['       ndim           = ' num2str(var.dimension) ]);
    
    for ii = 1:var.dimension
        switch ii
            case 1
                disp(['       dim1_beg_name  = ' get_dim_name(var.dim1_beg_name)]);
                disp(['       dim1_end_name  = ' get_dim_name(var.dim1_end_name)]);
            case 2
                disp(['       dim2_beg_name  = ' get_dim_name(var.dim2_beg_name)]);
                disp(['       dim2_end_name  = ' get_dim_name(var.dim2_end_name)]);
            case 3
                disp(['       dim3_beg_name  = ' get_dim_name(var.dim3_beg_name)]);
                disp(['       dim3_end_name  = ' get_dim_name(var.dim3_end_name)]);
            case 4
                disp(['       dim3_beg_name  = ' get_dim_name(var.dim4_beg_name)]);
                disp(['       dim3_end_name  = ' get_dim_name(var.dim4_end_name)]);
            otherwise
                error('Dim exceeds 4')
        end
    end
    disp(' ')
end
