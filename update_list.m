% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% 
% If 'value' is not included in the 'list', the 'value' is added otherwise
% 'list' remains unchanged.
% 
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
function list = update_list(list, value)

count = length(list);
var_found = false;

for ii = 1:count
    if (strcmp(value,list{ii}))
        var_found = true;
        break;
    end
end

if (~var_found)
    count = count + 1;
    list{count} = value;
end
