function [var_names, buffers] = compute_associate_var_names(vars)

var_names = '';
for vv = 1:length(vars)  
    var_names = update_list(var_names, vars{vv}.alm_name);    
end

var_name_max_length = 0;
for vv = 1:length(var_names)
    var_name_max_length = max([var_name_max_length length(var_names{vv})]);
end

for vv = 1:length(var_names)
    buffers{vv} = '';
    for ii = length(var_names{vv})+1:var_name_max_length
        buffers{vv} = [buffers{vv} ' '];
    end
end