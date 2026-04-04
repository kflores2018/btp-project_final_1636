
CLASS zcl_vir_elem_sadl_c1636 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_vir_elem_sadl_c1636 IMPLEMENTATION.

  METHOD if_sadl_exit_calc_element_read~calculate.

    data: lt_original_data type STANDARD TABLE OF ZSALESORDH_C_1636 WITH DEFAULT KEY.

    lt_original_data = CORRESPONDING #( it_original_data ).

    LOOP AT lt_original_data ASSIGNING FIELD-SYMBOL(<fs_orginal_data>).
       <fs_orginal_data>-ImagePreview = <fs_orginal_data>-Imageurl.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #( lt_original_data ).
    free: lt_original_data.

  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

*    CASE iv_entity.
*      WHEN 'ZSALESORDH_C_1636'.
*
*        LOOP AT it_requested_calc_elements INTO DATA(ls_calc_elem).
*            IF ls_calc_elem = 'EstadoOrden'.
*               insert conv #( 'Orderstatus' ) into table et_requested_orig_elements.
*            ENDIF.
*        ENDLOOP.
*
*    ENDCASE.

  ENDMETHOD.

ENDCLASS.
