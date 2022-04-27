CLASS zcl_vehicle DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .
  PUBLIC SECTION.
    METHODS:
      constructor IMPORTING iv_price   TYPE i
                            iv_year    TYPE i
                            iv_wheelnr TYPE i,

      get_price RETURNING VALUE(rv_price) TYPE i,
      get_year RETURNING VALUE(rv_year) TYPE i,
      get_wheelnr RETURNING VALUE(rv_wheelnr) TYPE i,

      set_price IMPORTING iv_price TYPE i,
      set_year IMPORTING iv_year TYPE i,
      set_wheelnr IMPORTING iv_wheelnr TYPE i,

      get_details ABSTRACT RETURNING VALUE(rv_details) TYPE string.

  PROTECTED SECTION.
    DATA: mv_price   TYPE i,
          mv_year    TYPE i,
          mv_wheelnr TYPE i.
ENDCLASS.



CLASS ZCL_VEHICLE IMPLEMENTATION.


  METHOD constructor.
    me->mv_price = iv_price.
    me->mv_year = iv_year.
    me->mv_wheelnr = iv_wheelnr.
  ENDMETHOD.


  METHOD get_price.
    rv_price = me->mv_price.
  ENDMETHOD.


  METHOD get_wheelnr.
    rv_wheelnr = me->mv_wheelnr.
  ENDMETHOD.


  METHOD get_year.
    rv_year = me->mv_year.
  ENDMETHOD.


  METHOD set_price.
    me->mv_price = iv_price.
  ENDMETHOD.


  METHOD set_wheelnr.
    me->mv_wheelnr = iv_wheelnr.
  ENDMETHOD.


  METHOD set_year.
    me->mv_year = iv_year.
  ENDMETHOD.
ENDCLASS.
