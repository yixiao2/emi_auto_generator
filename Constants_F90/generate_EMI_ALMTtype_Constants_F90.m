function generate_EMI_ALMTtype_Constants_F90(xml_filename, constant_names, constants_f90_filename)

alm_data = read_xml_data(xml_filename);

elm_mod_name  = alm_data.elm_mod_name;
alm_constant_offset = alm_data.constant_offset;

% Determine unique variable names for the constants

count = 1;
unique_constant_names{count} = constant_names{1};

for ii = 2:length(constant_names)
    found = false;
    for jj = 1:count
        if (strcmp(constant_names{ii},unique_constant_names{jj}))
            found = true;
            break
        end
    end
    if ~found
        count = count + 1;
        unique_constant_names{count} = constant_names{ii};
    end
end

clear constant_names
constant_names = unique_constant_names;

% Rearrange the constants name

id_1_order = {'L2E','E2L'};
id_2_order = {'STATE','FLUX','PARAMETER'};

count = 0;
for ii = 1:length(id_1_order)
    for jj = 1:length(id_2_order)        
        for kk = 1:length(constant_names)
           tmp = strsplit(constant_names{kk},'_');
           if (strcmp(tmp{1},id_1_order{ii}) && strcmp(tmp{2},id_2_order{jj}))
               count = count + 1;
               ordered_constant_names{count} = constant_names{kk};
           end
        end
    end
end
clear constant_names
constant_names = ordered_constant_names;


fid = fopen(constants_f90_filename,'w');

fprintf(fid, 'module EMI_%s_Constants\n', elm_mod_name);
fprintf(fid, '  !\n');

max_name_len = 0;
for ii = 1:length(constant_names)
    max_name_len = max([ max_name_len length(constant_names{ii})]);
end
max_name_len = max_name_len + 1;

%
% USE statemnets
%
fprintf(fid, '  implicit none\n');
fprintf(fid, '  private\n');
fprintf(fid, '  !\n');


for ii = 1:length(constant_names)
    tmp = strsplit(constant_names{ii},'_');
    
    if (ii == 1)
        prev_id_1 = tmp{1};
        prev_id_2 = tmp{2};
    else
        if (~strcmp(prev_id_2,tmp{2}))
            fprintf(fid,'\n');
            prev_id_1 = tmp{1};
            prev_id_2 = tmp{2};
        elseif (~strcmp(prev_id_1,tmp{1}))
            fprintf(fid,'\n');
        prev_id_1 = tmp{1};
        prev_id_2 = tmp{2};
        end            
    end
    
    fprintf(fid, '  integer, parameter, public :: %s',constant_names{ii});
    for jj = 1:max_name_len - length(constant_names{ii})
        fprintf(fid,' ');
    end
    fprintf(fid, ' = %04d\n', ii + alm_constant_offset);
    
        
end
fprintf(fid, '\n');

fprintf(fid, 'end module EMI_%s_Constants\n', elm_mod_name);

fclose(fid);
