function CanopyStateType()

filename = 'F90/EMI_CanopyStateType_ExchangeMod.F90';

alm_type = read_xml_data('CanopyStateType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
