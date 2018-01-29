function generate_EMI_ALMTtype_DataMod_F90(xml_filename, f90_filename)

global stages stages_prefix subgrid_level

alm_data = read_xml_data(xml_filename);
fid = fopen(f90_filename,'w');

elm_mod_name  = alm_data.elm_mod_name;

fprintf(fid, 'module EMI_%s_DataMod\n', elm_mod_name);
fprintf(fid, '  !\n');
fprintf(fid, '  use EMI_%s_Constants\n', elm_mod_name);
fprintf(fid, '  !\n');
fprintf(fid, '  implicit none\n');
fprintf(fid, '  !\n');
fprintf(fid, '  public :: EMI_%s_DataInfoByID\n', elm_mod_name);
fprintf(fid, '\n');
fprintf(fid, 'contains\n');
fprintf(fid, '  \n');

fprintf(fid,'!-----------------------------------------------------------------------\n');
fprintf(fid,'  subroutine EMI_%s_DataInfoByID(data_id, id_val, name_val, long_name_val,&\n', elm_mod_name);
fprintf(fid,'        units_val, is_int_type, is_real_type, ndim, &\n');
fprintf(fid,'        dim1_beg_name, dim1_end_name, dim2_beg_name, dim2_end_name, &\n');
fprintf(fid,'        dim3_beg_name, dim3_end_name, dim4_beg_name, dim4_end_name, &\n');
fprintf(fid,'        data_found)\n');
fprintf(fid,'    !\n');
fprintf(fid,'    ! !DESCRIPTION:\n');
fprintf(fid,'    ! Defines information of data exchanged between ELM and EM\n');
fprintf(fid,'    !\n');
fprintf(fid,'    ! !USES: \n');
fprintf(fid,'    use ExternalModelIntefaceDataDimensionMod\n');
fprintf(fid,'    implicit none\n');
fprintf(fid,'    !\n');
fprintf(fid,'    ! !ARGUMENTS:\n');
fprintf(fid,'    integer            , intent(in)  :: data_id\n');
fprintf(fid,'    integer            , intent(out) :: id_val\n');
fprintf(fid,'    character (len=24) , intent(out) :: name_val\n');
fprintf(fid,'    character (len=128), intent(out) :: long_name_val\n');
fprintf(fid,'    character (len=24) , intent(out) :: units_val\n');
fprintf(fid,'    logical            , intent(out) :: is_int_type\n');
fprintf(fid,'    logical            , intent(out) :: is_real_type\n');
fprintf(fid,'    integer            , intent(out) :: ndim\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim1_beg_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim1_end_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim2_beg_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim2_end_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim3_beg_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim3_end_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim4_beg_name\n');
fprintf(fid,'    character (len=24) , intent(out) :: dim4_end_name\n');
fprintf(fid,'    logical            , intent(out) :: data_found\n');
fprintf(fid, '\n');
fprintf(fid, '    is_int_type    = .false.\n');
fprintf(fid, '    is_real_type   = .false.\n');
fprintf(fid, '    dim1_beg_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim2_beg_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim3_beg_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim4_beg_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim1_end_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim2_end_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim3_end_name  = %s%s\n',char(39),char(39));
fprintf(fid, '    dim4_end_name  = %s%s\n',char(39),char(39));
fprintf(fid, '\n');
fprintf(fid, '    select case(data_id)\n');

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
                
                level_data = getfield(stage_data, subgrid_level{ilevel});
                
                emi_constants_prefix = [stages_prefix{istage} '_' alm_data.emi_constants_prefix];
                vars                 = level_data;
                Pack_Or_Unpack       = stage_name;
                Level_text_name      = level_name;
                
                switch Pack_Or_Unpack
                    case 'Pack'
                        long_name_suffix = 'ELM to EM';
                    case 'Unpack'
                        long_name_suffix = 'EM to ELM';
                    otherwise
                        error(['Unknown stage_name: ' stage_name]);
                end
                
                constant_names      = compute_emi_constant_names(vars,emi_constants_prefix);
                
                for ivar = 1:length(constant_names)
                    fprintf(fid, '\n');
                    fprintf(fid, '    case(%s)\n',constant_names{ivar});
                    fprintf(fid, '       id_val         =  %s\n',constant_names{ivar});
                    fprintf(fid, '       name_val       =  %s%s%s\n',char(39),vars{ivar}.name,char(39));
                    fprintf(fid, '       long_name_val  =  %s%s: %s%s\n',char(39),vars{ivar}.name,long_name_suffix,char(39));
                    fprintf(fid, '       units_val      =  %s%s%s\n',char(39),vars{ivar}.unit,char(39));
                    if (vars{ivar}.is_real)
                        fprintf(fid, '       is_real_type   =  .true.\n');
                    else
                        fprintf(fid, '       is_int_type    =  .true.\n');
                    end
                    fprintf(fid, '       ndim           =  %d\n',vars{ivar}.dimension);
                    
                    switch (vars{ivar}.dimension)
                        case 1
                            fprintf(fid, '       dim1_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_beg_name));
                            fprintf(fid, '       dim1_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_end_name));
                        case 2
                            fprintf(fid, '       dim1_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_beg_name));
                            fprintf(fid, '       dim1_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_end_name));
                            fprintf(fid, '       dim2_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim2_beg_name));
                            fprintf(fid, '       dim2_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim2_end_name));
                        case 3
                            fprintf(fid, '       dim1_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_beg_name));
                            fprintf(fid, '       dim1_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_end_name));
                            fprintf(fid, '       dim2_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim2_beg_name));
                            fprintf(fid, '       dim2_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim2_end_name));
                            fprintf(fid, '       dim3_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim3_beg_name));
                            fprintf(fid, '       dim3_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim3_end_name));
                        case 4
                            fprintf(fid, '       dim1_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_beg_name));
                            fprintf(fid, '       dim1_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim1_end_name));
                            fprintf(fid, '       dim2_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim2_beg_name));
                            fprintf(fid, '       dim2_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim2_end_name));
                            fprintf(fid, '       dim3_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim3_beg_name));
                            fprintf(fid, '       dim3_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim3_end_name));
                            fprintf(fid, '       dim4_beg_name  =  %s\n',compute_dimension_name(vars{ivar}.dim4_beg_name));
                            fprintf(fid, '       dim4_end_name  =  %s\n',compute_dimension_name(vars{ivar}.dim4_end_name));
                        otherwise
                            error(['Unsupported number of dimension: ' num2str(vars{ivars}.dimension)])
                    end
                    fprintf(fid, '       data_found   =  .true.\n');
                    
                end
                
            end
            
        end
    end
end
fprintf(fid, '    end select\n');
fprintf(fid, '    \n');

fprintf(fid,'  end subroutine EMI_%s_DataInfoByID\n', elm_mod_name);
fprintf(fid,'    \n');
fprintf(fid,'end module EMI_%s_DataMod\n', elm_mod_name);

fclose(fid);
