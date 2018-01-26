function Atm2LndType()

filename = 'F90/EMI_Atm2LndType_ExchangeMod.F90';

alm_type = read_xml_data('Atm2LndType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
