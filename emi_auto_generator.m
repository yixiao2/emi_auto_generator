function emi_auto_generator()

addpath utils
addpath utils/xml2struct
addpath Constants_F90
addpath DataMod_F90
addpath ExchangeMod_F90

elm_types = {
    'Atm2LndType', ...
    'CanopyStateType', ...
    'ChemStateType', ...
    'CNCarbonStateType', ...
    'EnergyFluxType', ...
    'SoilHydrologyType', ...
    'SoilStateType', ...
    'TemperatureType', ...
    'WaterFluxType', ...
    'WaterStateType'
    };

emi_global_variables();

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
    datamod_filename  = ['F90/EMI_' elm_type '_DataMod.F90'];
    
    disp(['Processing: ' elm_type]);
    constant_names = generate_EMI_ALMTtype_ExchangeMod_F90(xml_filename, mod_filename, constants_mods_to_include);
    
    generate_EMI_ALMTtype_Constants_F90(xml_filename, constant_names, constant_filename);
    
    generate_EMI_ALMTtype_DataMod_F90(xml_filename, datamod_filename);

end
