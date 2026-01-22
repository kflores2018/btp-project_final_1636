CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    CONSTANTS:
      BEGIN OF order_status,
        open     TYPE int1 VALUE 1,
        accepted TYPE int1 VALUE 2,
        rejected TYPE int1 VALUE 3,
      END OF order_status.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Header RESULT result.

    METHODS acceptOrder FOR MODIFY
      IMPORTING keys FOR ACTION Header~acceptOrder RESULT result.

    METHODS rejectOrder FOR MODIFY
      IMPORTING keys FOR ACTION Header~rejectOrder RESULT result.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Header~Resume.

    METHODS setOrderNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Header~setOrderNumber.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateDates.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateEmail.

    METHODS setStatusToOpen FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Header~setStatusToOpen.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD acceptOrder.

    MODIFY ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( Orderstatus )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                           Orderstatus = order_status-accepted
                                        ) ).

    READ ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    result = VALUE #( FOR header IN headers ( %tky   = header-%tky
                                              %param = header
                                            ) ).

  ENDMETHOD.

  METHOD rejectOrder.

    MODIFY ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( Orderstatus )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky
                                           Orderstatus = order_status-rejected
                                        ) ).

    READ ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    result = VALUE #( FOR header IN headers ( %tky   = header-%tky
                                              %param = header
                                            ) ).
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD setOrderNumber.

    READ ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    FIELDS ( HeaderID )
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    DELETE headers WHERE HeaderID IS NOT INITIAL.

    SELECT SINGLE FROM zsalesord_h_1636
          FIELDS MAX( header_id )
          INTO @DATA(max_HeaderID).

    MODIFY ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
          ENTITY Header
          UPDATE
          FIELDS ( HeaderID )
          WITH VALUE #( FOR header IN headers INDEX INTO i ( %tky = header-%tky
                                                             HeaderID = conv int1( max_headerid + i )
                                                            ) ).

  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

  METHOD validateEmail.
  ENDMETHOD.

  METHOD setStatusToOpen.

    READ ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    FIELDS ( Orderstatus )
    WITH CORRESPONDING #( keys )
    RESULT DATA(headers).

    DELETE headers WHERE Orderstatus IS NOT INITIAL.

    CHECK headers IS NOT INITIAL.

    MODIFY ENTITIES OF zsalesordh_r_1636 IN LOCAL MODE
    ENTITY Header
    UPDATE
    FIELDS ( Orderstatus )
    WITH VALUE #( FOR header IN headers ( %tky = header-%tky
                                          Orderstatus = order_status-open
                                        )
                 ).

  ENDMETHOD.

ENDCLASS.
