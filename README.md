# EMI Autocode Generator
External Model Interface (EMI) is for coupling the ELM (E3SM Land Model) 
with external models (EMs) such as SBeTR, VSFM, FATES, PFLOTRAN, etc.
These MATLAB script generate the Fortran code to exchange data from
various derived type of ELM.


## Description

Input: XML file that describes that variables that will exchanges between ELM's derived type and EMs.

Output: For each `derived-type`, following Fortran codes are generated:

1. `F90/EMI_<derived-type>_Constants.F90`: Lists constants corresponding to all variables that can be exchanged.

2. `F90/EMI_<derived-type>_DataMod.F90`: Contains code that defines all attributes of supported variables.

3. `F90/EMI_<derived-type>_ExchangeMod.F90`: Contains code that exchanges data between ELM and EMs.


### Terminonology of EMI

* Stage of data:
    * `pack` data : Send data from ELM to EM.
    * `unpack` data : Send data from EM to ELM.

* Subgrid hierarchy of data:
    * `grid_level` data : Data is defined at grid level
    * `landunit_level` data : Data is defined at landunit level
    * `column_level` data : Data is defined at column level
    * `patch_level` data: Data is defined at patch level


### Input XML file format


1. Global attributes:

   1.1. `elm_mod_name` : Name of the module (e.g. `WaterStateType` in `WaterStateType.F90`)
   
   1.2. `elm_var_name` : Name of the instant definied in `clm_instMod.F90` (e.g. `waterstate_vars`)
   
   1.3. `elm_type_name` : Name of ELM derived type
   
   1.4. `constant_offset` : An integer offset for creating global constant of variables that will be exchanged.
   
   1.5. `emi_constants_prefix` : Prefix that defines the data stored in the derived-type (e.g. `STATE`s are stored in `WaterStateType`)

2. Within `<pack_vars>...</pack_vars>` and `<unpack_vars>...</unpack_vars>` list all data that ELM sends to EMs and EMs sent to ELM, respectively.

3. Data definition

    3.1. `emi_constant_name` : Contants name for the data

    3.2. `name` : Name of the data

    3.3. `unit` : Unit of the data

    3.4. `elm_name` : ELM variable name in the derived type

    3.5. `is_real` : 1 if data is real and 0 if data is integer

    3.6. `dimension` : Dimension of the data

    3.7. `dim1_beg_name` and `dim1_end_name` : Beginning and ending of 1st dimension of the data

    3.8. `dim2_beg_name` and `dim2_end_name` : Beginning and ending of 2nd dimension of the data

    3.9. `dim3_beg_name` and `dim3_end_name` : Beginning and ending of 3rd dimension of the data

    3.10. `dim4_beg_name` and `dim4_end_name` : Beginning and ending of 4th dimension of the data
    
    3.11. `emi_constants_prefix` : Overrides the `emi_constants_prefix` from Global attribution definition.


#### An example of XML file for `waterstate_type` derived type

* ELM sends liquid soil water (`h2osoi_liq_col`) to EM. `h2osoi_liq_col` is a 2D, real data that is defined over `(begc:endc,1:nlevgrnd)`.
* EM sends soil matric pressure (`soilp_col`) to ELM. `soilp_col` is a 2D, real data that is defined over `(begc:endc,1:nlevgrnd)`.

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
</elm_type>
```

#### Example of `EMI_WaterStateType_Constants.F90`

```
module EMI_WaterStateType_Constants
  !
  implicit none
  private
  !
  integer, parameter, public :: L2E_STATE_H2OSOI_LIQ_NLEVGRND    = 0101

  integer, parameter, public :: E2L_STATE_VSFM_PROGNOSTIC_SOILP  = 0102

end module EMI_WaterStateType_Constants
```

#### Example of `EMI_WaterStateType_DataMod.F90`

```
module EMI_WaterStateType_DataMod
  !
  use EMI_WaterStateType_Constants
  !
  implicit none
  !
  public :: EMI_WaterStateType_DataInfoByID

contains

!-----------------------------------------------------------------------
  subroutine EMI_WaterStateType_DataInfoByID(data_id, id_val, name_val, long_name_val,&
        units_val, is_int_type, is_real_type, ndim, &
        dim1_beg_name, dim1_end_name, dim2_beg_name, dim2_end_name, &
        dim3_beg_name, dim3_end_name, dim4_beg_name, dim4_end_name, &
        data_found)
    !
    ! !DESCRIPTION:
    ! Defines information of data exchanged between ELM and EM
    !
    ! !USES:
    use ExternalModelIntefaceDataDimensionMod
    implicit none
    !
    ! !ARGUMENTS:
    integer            , intent(in)  :: data_id
    integer            , intent(out) :: id_val
    character (len=24) , intent(out) :: name_val
    character (len=128), intent(out) :: long_name_val
    character (len=24) , intent(out) :: units_val
    logical            , intent(out) :: is_int_type
    logical            , intent(out) :: is_real_type
    integer            , intent(out) :: ndim
    character (len=24) , intent(out) :: dim1_beg_name
    character (len=24) , intent(out) :: dim1_end_name
    character (len=24) , intent(out) :: dim2_beg_name
    character (len=24) , intent(out) :: dim2_end_name
    character (len=24) , intent(out) :: dim3_beg_name
    character (len=24) , intent(out) :: dim3_end_name
    character (len=24) , intent(out) :: dim4_beg_name
    character (len=24) , intent(out) :: dim4_end_name
    logical            , intent(out) :: data_found

    is_int_type    = .false.
    is_real_type   = .false.
    dim1_beg_name  = ''
    dim2_beg_name  = ''
    dim3_beg_name  = ''
    dim4_beg_name  = ''
    dim1_end_name  = ''
    dim2_end_name  = ''
    dim3_end_name  = ''
    dim4_end_name  = ''

    select case(data_id)

    case(L2E_STATE_H2OSOI_LIQ_NLEVGRND)
       id_val         =  L2E_STATE_H2OSOI_LIQ_NLEVGRND
       name_val       =  'soil liq water'
       long_name_val  =  'soil liq water: ELM to EM'
       units_val      =  '[kg/m2]'
       is_real_type   =  .true.
       ndim           =  2
       dim1_beg_name  =  dimname_begc
       dim1_end_name  =  dimname_endc
       dim2_beg_name  =  dimname_one
       dim2_end_name  =  dimname_nlevgrnd
       data_found   =  .true.

    case(E2L_STATE_VSFM_PROGNOSTIC_SOILP)
       id_val         =  E2L_STATE_VSFM_PROGNOSTIC_SOILP
       name_val       =  'Soil matric pressure'
       long_name_val  =  'Soil matric pressure: EM to ELM'
       units_val      =  '[Pa]'
       is_real_type   =  .true.
       ndim           =  2
       dim1_beg_name  =  dimname_begc
       dim1_end_name  =  dimname_endc
       dim2_beg_name  =  dimname_one
       dim2_end_name  =  dimname_nlevgrnd
       data_found   =  .true.
    end select

  end subroutine EMI_WaterStateType_DataInfoByID

end module EMI_WaterStateType_DataMod
```


#### Example of `EMI_WaterStateType_ExchangeMod.F90`


```
module EMI_WaterStateType_ExchangeMod
  !
  use shr_kind_mod                          , only : r8 => shr_kind_r8
  use shr_log_mod                           , only : errMsg => shr_log_errMsg
  use abortutils                            , only : endrun
  use clm_varctl                            , only : iulog
  use ExternalModelInterfaceDataMod         , only : emi_data_list, emi_data
  use ExternalModelIntefaceDataDimensionMod , only : emi_data_dimension_list_type
  use WaterStateType                        , only : waterstate_type
  use EMI_test_Constants
  use EMI_Filter_Constants
  use EMI_ColumnType_Constants
  use EMI_Landunit_Constants
  use EMI_Filter_Constants
  use EMI_ColumnType_Constants
  use EMI_Landunit_Constants
  !
  implicit none
  !
  !
  public :: EMI_Pack_WaterStateType_at_Column_Level_for_EM
  public :: EMI_Unpack_WaterStateType_at_Column_Level_from_EM

contains

!-----------------------------------------------------------------------
  subroutine EMI_Pack_WaterStateType_at_Column_Level_for_EM(data_list, em_stage, &
        num_filter, filter, waterstate_vars)
    !
    ! !DESCRIPTION:
    ! Pack data from ALM waterstate_vars for EM
    !
    ! !USES:
    use clm_varpar             , only : nlevsoi, nlevgrnd, nlevsno
    !
    implicit none
    !
    ! !ARGUMENTS:
    class(emi_data_list)   , intent(in) :: data_list
    integer                , intent(in) :: em_stage
    integer                , intent(in) :: num_filter
    integer                , intent(in) :: filter(:)
    type(waterstate_type)  , intent(in) :: waterstate_vars
    !
    ! !LOCAL_VARIABLES:
    integer                             :: fc,c,j
    class(emi_data), pointer            :: cur_data
    logical                             :: need_to_pack
    integer                             :: istage
    integer                             :: count

    associate(&
         h2osoi_liq => waterstate_vars%h2osoi_liq_col   &
         )

    count = 0
    cur_data => data_list%first
    do
       if (.not.associated(cur_data)) exit
       count = count + 1

       need_to_pack = .false.
       do istage = 1, cur_data%num_em_stages
          if (cur_data%em_stage_ids(istage) == em_stage) then
             need_to_pack = .true.
             exit
          endif
       enddo

       if (need_to_pack) then

          select case (cur_data%id)

          case (L2E_STATE_H2OSOI_LIQ_NLEVGRND)
             do fc = 1, num_filter
                c = filter(fc)
                do j = 1, nlevgrnd
                   cur_data%data_real_2d(c,j) = h2osoi_liq(c,j)
                enddo
             enddo
             cur_data%is_set = .true.

          end select

       endif

       cur_data => cur_data%next
    enddo

    end associate

  end subroutine EMI_Pack_WaterStateType_at_Column_Level_for_EM

!-----------------------------------------------------------------------
  subroutine EMI_Unpack_WaterStateType_at_Column_Level_from_EM(data_list, em_stage, &
        num_filter, filter, waterstate_vars)
    !
    ! !DESCRIPTION:
    ! Unpack data for ALM waterstate_vars from EM
    !
    ! !USES:
    use clm_varpar             , only : nlevsoi, nlevgrnd, nlevsno
    !
    implicit none
    !
    ! !ARGUMENTS:
    class(emi_data_list)   , intent(in) :: data_list
    integer                , intent(in) :: em_stage
    integer                , intent(in) :: num_filter
    integer                , intent(in) :: filter(:)
    type(waterstate_type)  , intent(in) :: waterstate_vars
    !
    ! !LOCAL_VARIABLES:
    integer                             :: fc,c,j
    class(emi_data), pointer            :: cur_data
    logical                             :: need_to_pack
    integer                             :: istage
    integer                             :: count

    associate(&
         soilp => waterstate_vars%soilp_col   &
         )

    count = 0
    cur_data => data_list%first
    do
       if (.not.associated(cur_data)) exit
       count = count + 1

       need_to_pack = .false.
       do istage = 1, cur_data%num_em_stages
          if (cur_data%em_stage_ids(istage) == em_stage) then
             need_to_pack = .true.
             exit
          endif
       enddo

       if (need_to_pack) then

          select case (cur_data%id)

          case (E2L_STATE_VSFM_PROGNOSTIC_SOILP)
             do fc = 1, num_filter
                c = filter(fc)
                do j = 1, nlevgrnd
                   soilp(c,j) = cur_data%data_real_2d(c,j)
                enddo
             enddo
             cur_data%is_set = .true.

          end select

       endif

       cur_data => cur_data%next
    enddo

    end associate

  end subroutine EMI_Unpack_WaterStateType_at_Column_Level_from_EM


end module EMI_WaterStateType_ExchangeMod
```