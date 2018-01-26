function EnergyFluxType()

filename = 'F90/EMI_EnergyFluxType_ExchangeMod.F90';

alm_type = read_xml_data('EnergyFluxType.xml');

generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
