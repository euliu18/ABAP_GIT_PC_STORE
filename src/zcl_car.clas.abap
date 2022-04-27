class ZCL_CAR definition
  public
  inheriting from ZCL_VEHICLE
  create public

  global friends ZCL_MOTOR .

public section.

  interfaces ZIF_VEHICLE .
  interfaces ZIF_INITIALIZE_VEHICLE .

  aliases INITIALIZE
    for ZIF_INITIALIZE_VEHICLE~INITIALIZE .
  aliases INITIALIZE_CAR
    for ZIF_INITIALIZE_VEHICLE~INITIALIZE_CAR .

  methods CONSTRUCTOR
    importing
      !IV_PRICE type I
      !IV_YEAR type I
      !IV_WHEELNR type I
      !IV_COLOR type STRING .
  methods GET_COLOR
    returning
      value(RV_COLOR) type STRING .
  methods SET_COLOR
    importing
      !IV_COLOR type STRING .
  class-methods GETNROFCARS
    returning
      value(RV_NROFCARS) type I
    raising
      ZCX_CAR_EXCEPTION .

  methods GET_DETAILS
    redefinition .
  PROTECTED SECTION.
    DATA: mv_color TYPE string.
    CLASS-DATA: sv_nrOfCars TYPE i VALUE 0.

ENDCLASS.



CLASS ZCL_CAR IMPLEMENTATION.


  METHOD constructor.
    super->constructor(
    EXPORTING
      iv_price = iv_price
      iv_year = iv_year
      iv_wheelnr = iv_wheelnr ).
    me->mv_color = iv_color.
    sv_nrOfCars = sv_nrOfCars + 1.
  ENDMETHOD.


  METHOD getNrOfCars.
    rv_nrOfCars = sv_nrOfCars.
    IF rv_nrOfCars > 10.
      RAISE EXCEPTION TYPE zcx_car_exception.
    ENDIF.
  ENDMETHOD.


  METHOD get_color.
    rv_color = me->mv_color.
  ENDMETHOD.


  METHOD get_details.
    rv_details = |Car Color: { mv_color }, Price: { mv_price }, Year: { mv_year }, Wheel Number: { mv_wheelnr }|.
  ENDMETHOD.


  METHOD initialize.
    rv_initialize = |THIS IS A VEHICLE|.
  ENDMETHOD.


  METHOD initialize_car.
    rv_initialize_car = |THE VEHICLE IS A CAR|.
  ENDMETHOD.


  METHOD set_color.
    me->mv_color = iv_color.
  ENDMETHOD.
ENDCLASS.
