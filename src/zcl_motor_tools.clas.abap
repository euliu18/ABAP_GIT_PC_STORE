CLASS zcl_motor_tools DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_motorTools TYPE string,

      get_motorTools RETURNING VALUE(rv_motorTools) TYPE string,
      set_motorTools IMPORTING iv_motorTools TYPE string,
      confirm_receipt IMPORTING iv_motor TYPE string.

    EVENTS: set_motorTools_called EXPORTING VALUE(ev_message) TYPE string.

  PROTECTED SECTION.
    DATA: mv_motorTools TYPE string.
ENDCLASS.



CLASS ZCL_MOTOR_TOOLS IMPLEMENTATION.


  METHOD confirm_receipt.
    DATA lv_message TYPE string.
    lv_message = |Message processed by { iv_motor }.|.
    WRITE: / lv_message.
  ENDMETHOD.


  METHOD constructor.
    me->mv_motorTools = iv_motorTools.
  ENDMETHOD.


  METHOD get_motorTools.
    rv_motorTools = me->mv_motorTools.
  ENDMETHOD.


  METHOD set_motorTools.
    me->mv_motorTools = iv_motorTools.

    RAISE EVENT set_motorTools_called EXPORTING ev_message = iv_motorTools.
  ENDMETHOD.
ENDCLASS.
