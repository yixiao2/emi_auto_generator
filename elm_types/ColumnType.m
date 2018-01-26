function ColumnType()

filename = 'F90/EMI_ColumnType_ExchangeMod.F90';

alm_type = read_xml_data('ColumnType.xml');

%generate_EMI_ALMTtype_ExchangeMod_F90(alm_type,filename)
clc;generate_AddDataByID_code(alm_type)
