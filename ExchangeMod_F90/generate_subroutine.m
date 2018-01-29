function generate_subroutine(fid, elm_mod_name, elm_var_name, elm_type_name, vars, emi_constants_prefix, Pack_Or_Unpack, Level_text_name)

constant_names      = compute_emi_constant_names(vars,emi_constants_prefix);
[associate_var_names, associate_var_names_buffers] = compute_associate_var_names(vars);

fprintf(fid,'!-----------------------------------------------------------------------\n');
switch Pack_Or_Unpack
    case 'Pack'
        fprintf(fid,'  subroutine EMI_%s_%s_at_%s_for_EM(data_list, em_stage, &\n',Pack_Or_Unpack, elm_mod_name, Level_text_name);
    case 'Unpack'
        fprintf(fid,'  subroutine EMI_%s_%s_at_%s_from_EM(data_list, em_stage, &\n',Pack_Or_Unpack, elm_mod_name, Level_text_name);
    otherwise
        error(['Unknown Pack_Or_Unpack: ' Pack_Or_Unpack]);
end
fprintf(fid,'        num_filter, filter, %s_vars)\n', lower(elm_var_name));
fprintf(fid,'    !\n');
fprintf(fid,'    ! !DESCRIPTION:\n');
switch Pack_Or_Unpack
    case 'Pack'
        fprintf(fid,'    ! Pack data from ALM %s_vars for EM\n',lower(elm_var_name));
    case 'Unpack'
        fprintf(fid,'    ! Unpack data for ALM %s_vars from EM\n',lower(elm_var_name));
    otherwise
        error(['Unknown Pack_or_Unpack stage: ' Pack_Or_Unpack]);
end
fprintf(fid,'    !\n');
fprintf(fid,'    ! !USES:\n');

% for vv = 1:length(constant_names)
%     fprintf(fid,'    use ExternalModelConstants , only : %s\n',constant_names{vv});
% end
fprintf(fid,'    use clm_varpar             , only : nlevsoi, nlevgrnd, nlevsno\n');
fprintf(fid,'    !\n');
fprintf(fid,'    implicit none\n');
fprintf(fid,'    !\n');
fprintf(fid,'    ! !ARGUMENTS:\n');

[buffer_1, buffer_2] = compute_buffer('    class(emi_data_list)   ,',sprintf('    type(%s) ,', elm_type_name));
fprintf(fid,'    class(emi_data_list)   %s, intent(in) :: data_list\n',buffer_1);
fprintf(fid,'    integer                %s, intent(in) :: em_stage\n',buffer_1);
fprintf(fid,'    integer                %s, intent(in) :: num_filter\n',buffer_1);
fprintf(fid,'    integer                %s, intent(in) :: filter(:)\n',buffer_1);
fprintf(fid,'    type(%s) %s, intent(in) :: %s_vars\n',elm_type_name, buffer_2, lower(elm_var_name));

fprintf(fid,'    !\n');
fprintf(fid,'    ! !LOCAL_VARIABLES:\n');
switch Level_text_name
    case 'Column_Level'
        local_level_variable_name = 'c';
    case 'Patch_Level'
        local_level_variable_name = 'p';
    case 'Grid_Level'
        local_level_variable_name = 'g';
    otherwise
        error(['Unknow Level_text_name: ', Level_text_name]);
end

fprintf(fid,'    integer                             :: f%s,%s,j\n',local_level_variable_name,local_level_variable_name);
fprintf(fid,'    class(emi_data), pointer            :: cur_data\n');
fprintf(fid,'    logical                             :: need_to_pack\n');
fprintf(fid,'    integer                             :: istage\n');
fprintf(fid,'    integer                             :: count\n');

fprintf(fid,'\n');
fprintf(fid,'    associate(& \n');
for vv = 1:length(associate_var_names)-1
    tmp = findstr(associate_var_names{vv},'_');
    fprintf(fid,'         %s %s=> %s_vars%s%s %s, &\n', associate_var_names{vv}(1:tmp(end)-1), associate_var_names_buffers{vv},  lower(elm_var_name), char(37), associate_var_names{vv}, associate_var_names_buffers{vv});
end
vv = length(associate_var_names);
tmp = findstr(associate_var_names{vv},'_');
fprintf(fid,'         %s %s=> %s_vars%s%s %s  &\n', associate_var_names{vv}(1:tmp(end)-1), associate_var_names_buffers{vv},  lower(elm_var_name), char(37), associate_var_names{vv}, associate_var_names_buffers{vv});
fprintf(fid,'         )\n');
fprintf(fid,'\n');


fprintf(fid,'    count = 0\n');
fprintf(fid,'    cur_data => data_list%sfirst\n', char(37));
fprintf(fid,'    do\n');
fprintf(fid,'       if (.not.associated(cur_data)) exit\n');
fprintf(fid,'       count = count + 1\n');
fprintf(fid,'\n');
fprintf(fid,'       need_to_pack = .false.\n');
fprintf(fid,'       do istage = 1, cur_data%snum_em_stages\n', char(37));
fprintf(fid,'          if (cur_data%sem_stage_ids(istage) == em_stage) then\n', char(37));
fprintf(fid,'             need_to_pack = .true.\n');
fprintf(fid,'             exit\n');
fprintf(fid,'          endif\n');
fprintf(fid,'       enddo\n');
fprintf(fid,'\n');
fprintf(fid,'       if (need_to_pack) then\n');
fprintf(fid,'\n');
fprintf(fid,'          select case (cur_data%sid)\n', char(37));
fprintf(fid,'\n');

for vv = 1:length(vars)
    emi_constant_name = compute_emi_constant_name(vars{vv},emi_constants_prefix);
    tmp = findstr(vars{vv}.elm_name,'_');
    
    switch vars{vv}.dimension
        case 1
            fprintf(fid,'          case (%s)\n',emi_constant_name);
            fprintf(fid,'             do f%s = 1, num_filter\n',local_level_variable_name);
            fprintf(fid,'                %s = filter(f%s)\n',local_level_variable_name,local_level_variable_name);
            switch Pack_Or_Unpack
                case 'Pack'
                    if (vars{vv}.is_real)
                        fprintf(fid,'                cur_data%sdata_real_1d(%s) = %s(%s)\n', char(37),local_level_variable_name,vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name);
                    else
                        fprintf(fid,'                cur_data%sdata_int_1d(%s) = %s(%s)\n', char(37),local_level_variable_name,vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name);
                    end
                case 'Unpack'
                    if (vars{vv}.is_real)
                        fprintf(fid,'                %s(%s) = cur_data%sdata_real_1d(%s)\n', vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name, char(37),local_level_variable_name);
                    else
                        fprintf(fid,'                %s(%s) = cur_data%sdata_int_1d(%s)\n',vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name, char(37),local_level_variable_name);
                    end
                otherwise
                    error(['Unknown Pack_Or_Unpack: ' Pack_Or_Unpack]);
            end
            
            fprintf(fid,'             enddo\n');
            fprintf(fid,'             cur_data%sis_set = .true.\n', char(37));
            fprintf(fid,'\n');
        case 2
            fprintf(fid,'          case (%s)\n',emi_constant_name);
            fprintf(fid,'             do f%s = 1, num_filter\n',local_level_variable_name);
            fprintf(fid,'                %s = filter(f%s)\n',local_level_variable_name,local_level_variable_name);
            fprintf(fid,'                do j = %s, %s\n',vars{vv}.dim2_beg_name,vars{vv}.dim2_end_name);
            switch Pack_Or_Unpack
                case 'Pack'
                    if (vars{vv}.is_real)
                        fprintf(fid,'                   cur_data%sdata_real_2d(%s,j) = %s(%s,j)\n', char(37),local_level_variable_name,vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name);
                    else
                        fprintf(fid,'                   cur_data%sdata_int_2d(%s,j) = %s(%s,j)\n', char(37),local_level_variable_name,vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name);
                    end
                case 'Unpack'
                    if (vars{vv}.is_real)
                        fprintf(fid,'                   %s(%s,j) = cur_data%sdata_real_2d(%s,j)\n',vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name, char(37),local_level_variable_name);
                    else
                        fprintf(fid,'                   %s(%s,j) = cur_data%sdata_int_2d(%s,j)\n',vars{vv}.elm_name(1:tmp(end)-1),local_level_variable_name, char(37),local_level_variable_name);
                    end
                otherwise
                    error(['Unknown Pack_Or_Unpack: ' Pack_Or_Unpack]);
            end
            fprintf(fid,'                enddo\n');
            fprintf(fid,'             enddo\n');
            fprintf(fid,'             cur_data%sis_set = .true.\n', char(37));
            fprintf(fid,'\n');
        otherwise
            error(['Unsupported dimension: ' num2str(vars{vv}.dimension)])
    end
end

fprintf(fid,'          end select\n');
fprintf(fid,'\n');
fprintf(fid,'       endif\n');
fprintf(fid,'\n');
fprintf(fid,'       cur_data => cur_data%snext\n', char(37));
fprintf(fid,'    enddo\n');
fprintf(fid,'\n');
fprintf(fid,'    end associate\n');
fprintf(fid,'\n');
switch Pack_Or_Unpack
    case 'Pack'
        fprintf(fid,'  end subroutine EMI_%s_%s_at_%s_for_EM\n',Pack_Or_Unpack, elm_mod_name, Level_text_name);
    case 'Unpack'
        fprintf(fid,'  end subroutine EMI_%s_%s_at_%s_from_EM\n',Pack_Or_Unpack, elm_mod_name, Level_text_name);
    otherwise
        error(['Unknown Pack_Or_Unpack: ' Pack_Or_Unpack]);
end

fprintf(fid,'\n');
