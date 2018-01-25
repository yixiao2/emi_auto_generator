function generate_Module_Definition(alm_data, fid)

stages        = {'pack_vars','unpack_vars'};
subgrid_level = {'column_level','patch_level','grid_level'};

alm_mod_name  = alm_data.alm_mod_name;
alm_type_name = alm_data.alm_type_name;

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


for istage = 1:length(stages)
    
    if (isfield(alm_data,stages{istage}))
        
        stage_data = getfield(alm_data, stages{istage});
        
        for ilevel = 1:length(subgrid_level)
            if (isfield(stage_data, subgrid_level{ilevel}))
                
                tmp = strsplit(stages{istage},'_');
                stage_name = [upper(tmp{1}(1)) tmp{1}(2:end)];
                
                tmp = strsplit(subgrid_level{ilevel},'_');
                level_name = [upper(tmp{1}(1)) tmp{1}(2:end) '_' upper(tmp{2}(1)) tmp{2}(2:end)];
                
                fprintf(fid, '  public :: EMI_%s_%s_at_%s_for_EM\n',stage_name,alm_mod_name,level_name);
                
            end
        end
    end
end

fprintf(fid, '\n');
fprintf(fid, 'contains\n');
fprintf(fid, '  \n');
