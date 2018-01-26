function ChemStateType()

filename = 'F90/EMI_ChemStateType_ExchangeMod.F90';

alm_type = read_xml_data('ChemStateType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
