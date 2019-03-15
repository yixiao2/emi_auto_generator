function generate_Module_Definition(alm_data, fid, constants_mods_to_include)

elm_mod_name  = alm_data.elm_mod_name;
elm_type_name = alm_data.elm_type_name;

fprintf(fid, 'module EMI_%s_ExchangeMod\n', elm_mod_name);
fprintf(fid, '  !\n');

%
% USE statemnets
%
[buffer_1, buffer_2] = compute_buffer('  use EMI_DataDimensionMod ,',sprintf('  use %s ,', elm_mod_name));
fprintf(fid, '  use shr_kind_mod                          %s, only : r8 => shr_kind_r8\n',buffer_1);
fprintf(fid, '  use shr_log_mod                           %s, only : errMsg => shr_log_errMsg\n',buffer_1);
fprintf(fid, '  use abortutils                            %s, only : endrun\n',buffer_1);
fprintf(fid, '  use clm_varctl                            %s, only : iulog\n',buffer_1);
fprintf(fid, '  use EMI_DataMod                           %s, only : emi_data_list, emi_data\n',buffer_1);
fprintf(fid, '  use EMI_DataDimensionMod                  %s, only : emi_data_dimension_list_type\n',buffer_1);
fprintf(fid, '  use %s %s, only : %s\n', elm_mod_name,buffer_2,elm_type_name);

for ii = 1:length(constants_mods_to_include)
    fprintf(fid, '  use EMI_%s_Constants\n', constants_mods_to_include{ii});
end
fprintf(fid, '  !\n');
fprintf(fid, '  implicit none\n');
fprintf(fid, '  !\n');
fprintf(fid, '  !\n');

subroutine_defn = 1;
generate_subroutine_defn_or_subroutine(alm_data, fid, subroutine_defn)

fprintf(fid, '\n');
fprintf(fid, 'contains\n');
fprintf(fid, '  \n');
