function constant_names = generate_EMI_ALMTtype_ExchangeMod_F90(xml_filename, f90_filename, constants_mods_to_include)

%
% PreProcessing
%

alm_data = read_xml_data(xml_filename);

elm_mod_name  = alm_data.elm_mod_name;

fid = fopen(f90_filename,'w');

generate_Module_Definition(alm_data, fid, constants_mods_to_include);

subroutine_defn = 0;
constant_names = generate_subroutine_defn_or_subroutine(alm_data, fid, subroutine_defn);

fprintf(fid, '\n');
fprintf(fid, 'end module EMI_%s_ExchangeMod\n', elm_mod_name);

fclose(fid);


