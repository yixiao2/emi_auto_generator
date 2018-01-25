function generate_subroutine_defn_or_subroutine(alm_data, fid, subroutine_defn)

stages        = {'pack_vars','unpack_vars'};
stages_prefix = {'L2E', 'E2L'};
subgrid_level = {'column_level','patch_level','grid_level'};

alm_mod_name  = alm_data.alm_mod_name;
alm_var_name  = alm_data.alm_var_name;
alm_type_name = alm_data.alm_type_name;

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
                    fprintf(fid, '  public :: EMI_%s_%s_at_%s_for_EM\n',stage_name,alm_mod_name,level_name);
                else
                    
                    level_data = getfield(stage_data, subgrid_level{ilevel});
                    
                    emi_constants_prefix = [stages_prefix{istage} '_' alm_data.emi_constants_prefix];
                    vars                 = level_data;
                    Pack_Or_Unpack       = stage_name;
                    Level_text_name      = level_name;
                    
                    generate_subroutine(fid, alm_mod_name, alm_var_name, alm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name);
                end
                
            end
        end
    end
end
