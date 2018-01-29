# EMI Autocode Generator
External Model Interface (EMI) is for coupling the ELM (E3SM Land Model) 
with external models (EMs) such as SBeTR, VSFM, FATES, PFLOTRAN, etc.
These MATLAB script generate the Fortran code to exchange data from
various derived type of ELM.


## Description



## Terminology of EMI

1. Data from any ELM's derived type (e.g. `WaterStateType`) can exchanged with any EM.
2. An XML file describes the ELM derived type.
   2.1. `elm_mod_name` : Module name
   2.2. `elm_mod_name` : Module name
   2.3. `elm_mod_name` : Module name
   2.4. `elm_mod_name` : Module name



```
<elm_type>    
    <emi_constants_prefix>STATE</emi_constants_prefix>
    <elm_mod_name>WaterStateType</elm_mod_name>
    <elm_var_name>WaterState</elm_var_name>
    <elm_type_name>waterstate_type</elm_type_name>
    <constant_offset>100</constant_offset>
    
    <pack_vars>
        <column_level>
            <emi_constant_name>H2OSOI_LIQ_NLEVGRND</emi_constant_name>
            <name>soil liq water</name>
            <unit>[kg/m2]</unit>
            <elm_name>h2osoi_liq_col</elm_name>
            <dimension>2</dimension>
            <is_real>1</is_real>
            <dim1_beg_name>begc</dim1_beg_name>
            <dim1_end_name>endc</dim1_end_name>
            <dim2_beg_name>1</dim2_beg_name>
            <dim2_end_name>nlevgrnd</dim2_end_name>
        </column_level>
    </pack_vars>
    <unpack_vars>
        <column_level>
            <emi_constant_name>VSFM_PROGNOSTIC_SOILP</emi_constant_name>
            <name>Soil matric pressure</name>
            <unit>[Pa]</unit>
            <elm_name>soilp_col</elm_name>
            <dimension>2</dimension>
            <is_real>1</is_real>
            <dim1_beg_name>begc</dim1_beg_name>
            <dim1_end_name>endc</dim1_end_name>
            <dim2_beg_name>1</dim2_beg_name>
            <dim2_end_name>nlevgrnd</dim2_end_name>
        </column_level>

    </unpack_vars>
<elm_type>

```
