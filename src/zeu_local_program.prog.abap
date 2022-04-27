*&---------------------------------------------------------------------*
*& Report ZEU_LOCAL_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zeu_local_program.

*Creating an exception class

CLASS lcx_car_exception DEFINITION
  INHERITING FROM cx_static_check.
ENDCLASS.

*Creating an interface
INTERFACE lif_vehicle.
  METHODS: initialize RETURNING VALUE(rv_initialize) TYPE string.
ENDINTERFACE.


*Creating a nested interface
INTERFACE lif_initialize_vehicle.
  INTERFACES lif_vehicle.
  ALIASES: initialize FOR lif_vehicle~initialize.
  METHODS: initialize_car RETURNING VALUE(rv_initialize_car) TYPE string.
ENDINTERFACE.


* Defining an abstract class
CLASS lcl_vehicle DEFINITION ABSTRACT.
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

*Implementing an abstract class
CLASS lcl_vehicle IMPLEMENTATION.
  METHOD constructor.
    me->mv_price = iv_price.
    me->mv_year = iv_year.
    me->mv_wheelnr = iv_wheelnr.
  ENDMETHOD.

  METHOD get_price.
    rv_price = me->mv_price.
  ENDMETHOD.

  METHOD get_year.
    rv_year = me->mv_year.
  ENDMETHOD.

  METHOD get_wheelnr.
    rv_wheelnr = me->mv_wheelnr.
  ENDMETHOD.

  METHOD set_price.
    me->mv_price = iv_price.
  ENDMETHOD.

  METHOD set_year.
    me->mv_year = iv_year.
  ENDMETHOD.

  METHOD set_wheelnr.
    me->mv_wheelnr = iv_wheelnr.
  ENDMETHOD.
ENDCLASS.

*Creating Car subclass that inherits from the abstract superclass Vehicle.

CLASS lcl_motor DEFINITION DEFERRED.
CLASS lcl_car DEFINITION INHERITING FROM lcl_vehicle FRIENDS lcl_motor.
  PUBLIC SECTION.
    INTERFACES lif_initialize_vehicle.
    ALIASES: initialize FOR lif_initialize_vehicle~initialize,
             initialize_car FOR lif_initialize_vehicle~initialize_car.

    METHODS:
      constructor IMPORTING iv_price   TYPE i
                            iv_year    TYPE i
                            iv_wheelnr TYPE i
                            iv_color   TYPE string,

      get_color RETURNING VALUE(rv_color) TYPE string,
      set_color IMPORTING iv_color TYPE string,
      get_details REDEFINITION.

     CLASS-METHODS: getNrOfCars RETURNING VALUE(rv_nrOfCars) TYPE i
                                RAISING   lcx_car_exception.

  PROTECTED SECTION.
    DATA: mv_color TYPE string.
    CLASS-DATA: sv_nrOfCars TYPE i VALUE 0.
ENDCLASS.



CLASS lcl_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor(
    EXPORTING
      iv_price = iv_price
      iv_year = iv_year
      iv_wheelnr = iv_wheelnr ).
    me->mv_color = iv_color.
    sv_nrOfCars = sv_nrOfCars + 1.
  ENDMETHOD.

  METHOD get_color.
    rv_color = me->mv_color.
  ENDMETHOD.

  METHOD set_color.
    me->mv_color = iv_color.
  ENDMETHOD.

  METHOD initialize.
    rv_initialize = |THIS IS A VEHICLE|.
  ENDMETHOD.

  METHOD initialize_car.
    rv_initialize_car = |THE VEHICLE IS A CAR|.
  ENDMETHOD.

  METHOD get_details.
    rv_details = |Car Color: { mv_color }, Price: { mv_price }, Year: { mv_year }, Wheel Number: { mv_wheelnr }|.
  ENDMETHOD.

  METHOD getNrOfCars.
    rv_nrOfCars = sv_nrOfCars.

    IF rv_nrOfCars > 10.
      RAISE EXCEPTION TYPE lcx_car_exception.
    ENDIF.
  ENDMETHOD.
ENDCLASS.

*Creating a new class to demostrate an example with events and composition.
CLASS lcl_motor_tools DEFINITION.
  PUBLIC SECTION.
    METHODS: constructor IMPORTING iv_motorTools TYPE string,

      get_motorTools RETURNING VALUE(rv_motorTools) TYPE string,
      set_motorTools IMPORTING iv_motorTools TYPE string,
      confirm_receipt IMPORTING iv_motor TYPE string.

    EVENTS: set_motorTools_called EXPORTING VALUE(ev_message) TYPE string.

  PROTECTED SECTION.
    DATA: mv_motorTools TYPE string.
ENDCLASS.



CLASS lcl_motor_tools IMPLEMENTATION.
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

  METHOD confirm_receipt.
    DATA lv_message TYPE string.
    lv_message = |Message processed by { iv_motor }.|.
    WRITE: / lv_message.
  ENDMETHOD.
ENDCLASS.


*Creating Motor subclass that inherits from the abstract superclass Vehicle.
CLASS lcl_motor DEFINITION INHERITING FROM lcl_vehicle.
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
      on_message FOR EVENT set_motorTools_called OF lcl_motor_tools IMPORTING ev_message sender,
      get_motor_tools IMPORTING io_tools        TYPE REF TO lcl_motor_tools
                      RETURNING VALUE(rv_tools) TYPE string.


  PROTECTED SECTION.
    DATA mv_model TYPE string.
    CONSTANTS CO_nrOfPassagers TYPE i VALUE 2.
ENDCLASS.



CLASS lcl_motor IMPLEMENTATION.
  METHOD constructor.
    super->constructor(
    EXPORTING
      iv_price = iv_price
      iv_year = iv_year
      iv_wheelnr = iv_wheelnr ).
    me->mv_model = iv_model.

    SET HANDLER on_message FOR ALL INSTANCES.
  ENDMETHOD.

  METHOD get_model.
    rv_model = me->mv_model.
  ENDMETHOD.

  METHOD set_model.
    me->mv_model = iv_model.
  ENDMETHOD.

  METHOD get_nrOfPassagers.
    rv_nrOfPassagers = CO_nrOfPassagers.
  ENDMETHOD.

  METHOD get_carColor.
    DATA(lo_car3) = NEW lcl_car( iv_price = 1300 iv_year = 2008 iv_wheelnr = 4 iv_color = 'Green' ).
    rv_carColor = lo_car3->mv_color.
  ENDMETHOD.

  METHOD get_details.
    rv_details = |Motor Model: { mv_model }, Price: { mv_price }, Year: { mv_year }, Wheel Number: { mv_wheelnr }|.
  ENDMETHOD.

  METHOD on_message.
    DATA lv_message TYPE string.
    lv_message = |Received message [{ ev_message }]|.
    WRITE: / lv_message.
    sender->confirm_receipt( 'LCL_MOTOR' ).
  ENDMETHOD.

  METHOD get_motor_tools.
    rv_tools = io_tools->get_motorTools( ).
  ENDMETHOD.
ENDCLASS.


START-OF-SELECTION.

*Creating object reference variables

  DATA :lo_car1 TYPE REF TO lcl_car,
        lo_car2 TYPE REF TO lcl_car,
        lo_motor1 TYPE REF TO lcl_motor,
        lo_motor2 TYPE REF TO lcl_motor,
        lo_motor_tools TYPE REF TO lcl_motor_tools,
        lo_car_error TYPE REF TO lcx_car_exception.

*Creating objects

  CREATE OBJECT lo_car1
    EXPORTING
      iv_price   = 1500
      iv_year    = 2010
      iv_wheelnr = 4
      iv_color   = 'White'.

  CREATE OBJECT lo_car2
    EXPORTING
      iv_price   = 1600
      iv_year    = 2009
      iv_wheelnr = 4
      iv_color   = 'Blue'.

  CREATE OBJECT lo_motor1
    EXPORTING
      iv_price   = 1900
      iv_year    = 2005
      iv_wheelnr = 2
      iv_model   = 'Scooter'.

  CREATE OBJECT lo_motor2
    EXPORTING
      iv_price   = 1200
      iv_year    = 2007
      iv_wheelnr = 2
      iv_model   = 'Scooter'.

  CREATE OBJECT lo_motor_tools
    EXPORTING
      iv_motorTools = 'Some tools'.

* WORKING WITH INTERFACES
  WRITE: / lo_car1->initialize( ),
         /,
         / lo_car1->initialize_car( ),
         /.

*WORKING WITH ABSTRACT METHODS
  WRITE: / lo_car1->get_details( ),
         /,
         / lo_motor1->get_details( ),
         /.

*Friend Concept
  WRITE: / lo_motor1->get_carColor( ),
         /.

  WRITE: / 'There are',lo_motor1->get_nrOfPassagers( ), 'passagers.',
         /.

*WORKING WITH EVENTS
  lo_motor_tools->set_motorTools('Some extra tools').


*WORKING WITH EXCEPTIONS
  TRY.
      WRITE: / 'There are',lcl_car=>getNrOfCars( ), 'cars.'.
    CATCH lcx_car_exception INTO lo_car_error.
      MESSAGE lo_car_error TYPE 'I'.
  ENDTRY.

*WORKING WITH COMPOSITION
  WRITE: / lo_motor2->get_motor_tools( lo_motor_tools ).
