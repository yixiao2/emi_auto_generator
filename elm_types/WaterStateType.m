function WaterStateType()

filename = 'F90/EMI_WaterStateType_ExchangeMod.F90';

alm_type = read_xml_data('WaterStateType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
