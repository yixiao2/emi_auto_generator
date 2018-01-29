function constant_names = generate_subroutine_defn_or_subroutine(alm_data, fid, subroutine_defn)

global stages stages_prefix subgrid_level

elm_mod_name  = alm_data.elm_mod_name;
elm_var_name  = alm_data.elm_var_name;
elm_type_name = alm_data.elm_type_name;

count = 0;

for istage = 1:length(stages)
    
    if (isfield(alm_data,stages{istage}))
        
        stage_data = getfield(alm_data, stages{istage});
        
        for ilevel = 1:length(subgrid_level)
            if (isfield(stage_data, subgrid_level{ilevel}))
                
                tmp = strsplit(stages{istage},'_');
                stage_name = [upper(tmp{1}(1)) tmp{1}(2:end)];
                
                tmp = strsplit(subgrid_level{ilevel},'_');
                level_name = [upper(tmp{1}(1)) tmp{1}(2:end) '_' upper(tmp{2}(1)) tmp{2}(2:end)];
                
                if (subroutine_defn)
                    switch stage_name
                        case 'Pack'                            
                            fprintf(fid, '  public :: EMI_%s_%s_at_%s_for_EM\n',stage_name,elm_mod_name,level_name);
                        case 'Unpack'
                            fprintf(fid, '  public :: EMI_%s_%s_at_%s_from_EM\n',stage_name,elm_mod_name,level_name);
                        otherwise
                            error('Unknown value for Pack_or_Unpack')
                    end
                else
                    
                    level_data = getfield(stage_data, subgrid_level{ilevel});
                    
                    emi_constants_prefix = [stages_prefix{istage} '_' alm_data.emi_constants_prefix];
                    vars                 = level_data;
                    Pack_Or_Unpack       = stage_name;
                    Level_text_name      = level_name;
                    
                    generate_subroutine(fid, elm_mod_name, elm_var_name, elm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
                    
                    tmp_constant_names = compute_emi_constant_names(vars, emi_constants_prefix);
                    
                    for kk = 1:length(tmp_constant_names)
                        count = count + 1;
                        constant_names{count} = tmp_constant_names{kk};
                    end
                end
                
            end
        end
    end
end
