CLASS zcls_cargardatos_1636 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcls_cargardatos_1636 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    "DELETE FROM zsalesord_h_1636.

    TRY.

        DATA: lv_header_uuid TYPE sysuuid_x16,
              lv_item_uuid1  TYPE sysuuid_x16,
              lv_item_uuid2  TYPE sysuuid_x16.

        DATA: ls_header TYPE zsalesord_h_1636,
              ls_item   TYPE zsalesord_i_1636.


        cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = lv_header_uuid ).
        cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = lv_item_uuid1 ).
        cl_system_uuid=>create_uuid_x16_static( RECEIVING uuid = lv_item_uuid2 ).


        CLEAR ls_header.
        ls_header-client        = sy-mandt.
        ls_header-header_uuid  = lv_header_uuid.
        ls_header-header_id    = 'H0003'.
        ls_header-email        = 'brayan.alonzo@yahoo.es'.
        ls_header-firstname    = 'Brayan'.
        ls_header-lastname     = 'Alonzo'.
        ls_header-country      = 'Costa Rica'.
        ls_header-createon     = sy-datum.
        ls_header-deliverydate = sy-datum + 5.
        ls_header-orderstatus  = 1.
        ls_header-imageurl     = 'https://server/img/order3.png'.

        INSERT zsalesord_h_1636 FROM @ls_header.

        CLEAR ls_item.
        ls_item-item_uuid    = lv_item_uuid1.
        ls_item-parent_uuid  = lv_header_uuid.
        ls_item-item_id      = 'I0005'.
        ls_item-name         = 'Marcadores'.
        ls_item-description  = 'Marcadores de Pizarra'.
        ls_item-releasedate  = sy-datum - 30.
        ls_item-price        = '10.00'.
        ls_item-height       = '5.500'.
        ls_item-width        = '7.000'.
        ls_item-depth        = '12.000'.
        ls_item-quantity     = '50'.
        ls_item-unitofmeasure = 'EA'.

        INSERT zsalesord_i_1636 FROM @ls_item.

        CLEAR ls_item.
        ls_item-item_uuid    = lv_item_uuid2.
        ls_item-parent_uuid  = lv_header_uuid.
        ls_item-item_id      = 'I0006'.
        ls_item-name         = 'Libretas'.
        ls_item-description  = 'Libretas Agendas'.
        ls_item-releasedate  = sy-datum - 10.
        ls_item-price        = '200.00'.
        ls_item-height       = '3.000'.
        ls_item-width        = '6.000'.
        ls_item-depth        = '10.000'.
        ls_item-quantity     = '7'.
        ls_item-unitofmeasure = 'EA'.

        INSERT zsalesord_i_1636 FROM @ls_item.

        COMMIT WORK.

    CATCH cx_uuid_error.
      out->write( 'Error al generar el uuid' ).
  ENDTRY.




ENDMETHOD.

ENDCLASS.
