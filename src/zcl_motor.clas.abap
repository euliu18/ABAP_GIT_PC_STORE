CLASS zcl_motor DEFINITION
  PUBLIC
  INHERITING FROM zcl_vehicle
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_price   TYPE i
                            iv_year    TYPE i
                            iv_wheelnr TYPE i
                            iv_model   TYPE string,

      get_model RETURNING VALUE(rv_model) TYPE string,
      set_model IMPORTING iv_model TYPE string,
      get_nrOfPassagers RETURNING VALUE(rv_nrOfPassagers) TYPE i,
      get_carColor RETURNING VALUE(rv_carColor) TYPE string,
      get_details REDEFINITION,
      on_message FOR EVENT set_motorTools_called OF zcl_motor_tools IMPORTING ev_message sender,
      get_motor_tools IMPORTING io_tools        TYPE REF TO zcl_motor_tools
                      RETURNING VALUE(rv_tools) TYPE string.


  PROTECTED SECTION.
    DATA mv_model TYPE string.
    CONSTANTS CO_nrOfPassagers TYPE i VALUE 2.
ENDCLASS.



CLASS ZCL_MOTOR IMPLEMENTATION.


METHOD constructor.
    super->constructor(
    EXPORTING
      iv_price = iv_price
      iv_year = iv_year
      iv_wheelnr = iv_wheelnr ).
    me->mv_model = iv_model.

    SET HANDLER on_message FOR ALL INSTANCES.
  ENDMETHOD.


  METHOD get_carColor.
    DATA(lo_car3) = NEW zcl_car( iv_price = 1300 iv_year = 2008 iv_wheelnr = 4 iv_color = 'Green' ).
    rv_carColor = lo_car3->mv_color.
  ENDMETHOD.


  METHOD get_details.
    rv_details = |Motor Model: { mv_model }, Price: { mv_price }, Year: { mv_year }, Wheel Number: { mv_wheelnr }|.
  ENDMETHOD.


  METHOD get_model.
    rv_model = me->mv_model.
  ENDMETHOD.


  METHOD get_motor_tools.
    rv_tools = io_tools->get_motorTools( ).
  ENDMETHOD.


  METHOD get_nrOfPassagers.
    rv_nrOfPassagers = CO_nrOfPassagers.
  ENDMETHOD.


  METHOD on_message.
    DATA lv_message TYPE string.
    lv_message = |Received message [{ ev_message }]|.
    WRITE: / lv_message.
    sender->confirm_receipt( 'LCL_MOTOR' ).
  ENDMETHOD.


  METHOD set_model.
    me->mv_model = iv_model.
  ENDMETHOD.
ENDCLASS.
