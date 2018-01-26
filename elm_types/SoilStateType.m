function SoilStateType()

filename = 'F90/EMI_SoilStateType_ExchangeMod.F90';

alm_type = read_xml_data('SoilStateType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
