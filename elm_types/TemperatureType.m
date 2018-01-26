function TemperatureType()

filename = 'F90/EMI_TemperatureType_ExchangeMod.F90';

alm_type = read_xml_data('TemperatureType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
