function emi_constant_name = compute_emi_constant_name(var,constant_prefix)

if (~isfield(var,'emi_constant_name'))
    tmp = findstr(var.alm_name,'_');
    if(~isfield(var,'emi_constants_prefix'))
        emi_constant_name = [constant_prefix '_' upper(var.alm_name(1:tmp(end)-1))];
    else
        emi_constant_name = [upper(var.emi_constants_prefix) '_' upper(var.alm_name(1:tmp(end)-1))];
    end
else
    if(~isfield(var,'emi_constants_prefix'))
        emi_constant_name = [constant_prefix '_' upper(var.emi_constant_name)];
    else
        emi_constant_name = [upper(var.emi_constants_prefix) '_' upper(var.emi_constant_name)];
    end
end
