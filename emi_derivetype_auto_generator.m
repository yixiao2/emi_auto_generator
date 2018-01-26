function emi_derivetype_auto_generator()

addpath xml2struct

elm_types = {
    'Atm2LndType', ...
    'CanopyStateType', ...
    'ChemStateType', ...
    'EnergyFluxType', ...
    'SoilHydrologyType', ...
    'SoilStateType', ...
    'TemperatureType', ...
    'WaterFluxType', ...
    'WaterStateType'
    };

constants_mods_to_include = elm_types;
constants_mods_to_include{length(constants_mods_to_include)+1} = 'Filter';
constants_mods_to_include{length(constants_mods_to_include)+1} = 'ColumnType';
constants_mods_to_include{length(constants_mods_to_include)+1} = 'Landunit';


system('mkdir -p F90');

for ivar = 1:length(elm_types)
    elm_type          = elm_types{ivar};
    xml_filename      = ['xml/' elm_type '.xml'];
    mod_filename      = ['F90/EMI_' elm_type '_ExchangeMod.F90'];
    constant_filename = ['F90/EMI_' elm_type '_Constants.F90'];
    
    constant_names = generate_EMI_ALMTtype_ExchangeMod_F90(xml_filename, mod_filename, constants_mods_to_include);
    
    generate_EMI_ALMTtype_Constants_F90(xml_filename, constant_names, constant_filename)
end
