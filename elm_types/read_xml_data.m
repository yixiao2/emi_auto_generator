function new_data = read_xml_data(xml_filename)

stages        = {'pack_vars','unpack_vars'};
subgrid_level = {'column_level','patch_level','grid_level'};


xml_data = xml2struct(xml_filename);

xml_data = xml_data.elm_type;

field_names = fieldnames(xml_data);

new_data = '';

for ii = 1:length(field_names)
    if ~(strcmp(field_names{ii},'pack_vars') || strcmp(field_names{ii},'unpack_vars'))
        
        tmp = getfield(xml_data,field_names{ii});
        new_data =setfield(new_data,field_names{ii},tmp.Text);
    end
end


for istage = 1:length(stages)
    
    if (isfield(xml_data,stages{istage}))
        
        stage_data = getfield(xml_data, stages{istage});
        
        new_level_data = '';
        for ilevel = 1:length(subgrid_level)
            if (isfield(stage_data, subgrid_level{ilevel}))
                
                tmp = strsplit(stages{istage},'_');
                stage_name = [upper(tmp{1}(1)) tmp{1}(2:end)];
                
                tmp = strsplit(subgrid_level{ilevel},'_');
                level_name = [upper(tmp{1}(1)) tmp{1}(2:end) '_' upper(tmp{2}(1)) tmp{2}(2:end)];
                
                level_data = getfield(stage_data, subgrid_level{ilevel});
                
                if (length(level_data) == 1)
                    tmp = level_data;
                    clear level_data;
                    level_data{1} = tmp;
                    clear tmp
                end
                
                for ii = 1:length(level_data)
                    field_names = fieldnames(level_data{ii});
                    new_var_data = '';
                    for jj = 1:length(field_names)
                        field_name = field_names{jj};
                        tmp_field_value = getfield(level_data{ii},field_name);
                        
                        switch field_name
                            case {'name','unit','emi_constant_name', ...
                                    'emi_constants_prefix','alm_name',...
                                    'dim1_beg_name','dim1_end_name', ...
                                    'dim2_beg_name','dim2_end_name', ...
                                    'dim3_beg_name','dim3_end_name', ...
                                    'dim4_beg_name','dim4_end_name'}
                                new_var_data = setfield(new_var_data,field_name,tmp_field_value.Text);
                            case {'dimension','is_real'}
                                new_var_data = setfield(new_var_data,field_name,str2num(tmp_field_value.Text));
                            otherwise
                                error(['Unknown field: ' field_name])
                        end
                    end
                    new_vars_data{ii} = new_var_data;
                end
                clear new_var_data;
                
                new_level_data = setfield(new_level_data,subgrid_level{ilevel},new_vars_data);
                
            end
        end
        
        if (~isempty(new_level_data))
            new_data = setfield(new_data,stages{istage},new_level_data);
        end
        
    end
    
end
