function emi_constant_names = compute_emi_constant_names(vars,constant_prefix)

emi_constant_names = '';

for vv = 1:length(vars)    
    emi_constant_name = compute_emi_constant_name(vars{vv},constant_prefix);
    emi_constant_names = update_list(emi_constant_names, emi_constant_name);
end