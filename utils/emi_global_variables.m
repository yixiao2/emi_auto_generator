function emi_global_variables

global stages stages_prefix subgrid_level

stages        = {'pack_vars','unpack_vars'};
stages_prefix = {'L2E', 'E2L'};
subgrid_level = {'column_level','patch_level','grid_level'};
