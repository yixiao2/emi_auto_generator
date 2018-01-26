function SoilHydrologyType()

filename = 'F90/EMI_SoilHydrologyType_ExchangeMod.F90';

alm_type = read_xml_data('SoilHydrologyType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)

