function generate_EMI_ALMTtype_ExchangeMod_F90(alm_data, filename)

%
% PreProcessing
%

alm_mod_name  = alm_data.alm_mod_name;

fid = fopen(filename,'w');

generate_Module_Definition(alm_data, fid);

subroutine_defn = 0;
generate_subroutine_defn_or_subroutine(alm_data, fid, subroutine_defn)

fprintf(fid, '\n');
fprintf(fid, 'end module EMI_%s_ExchangeMod\n', alm_mod_name);

fclose(fid);