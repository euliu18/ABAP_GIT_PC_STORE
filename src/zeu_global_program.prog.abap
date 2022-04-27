*&---------------------------------------------------------------------*
*& Report ZEU_GLOBAL_PROGRAM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZEU_GLOBAL_PROGRAM.

*Creating object reference variables

  DATA :lo_car1 TYPE REF TO zcl_car,
        lo_car2 TYPE REF TO zcl_car,
        lo_motor1 TYPE REF TO zcl_motor,
        lo_motor2 TYPE REF TO zcl_motor,
        lo_motor_tools TYPE REF TO zcl_motor_tools,
        lo_car_error TYPE REF TO zcx_car_exception.

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
         /,
         / lo_motor1->get_carColor( ),
         /.


  WRITE: / 'There are',lo_motor1->get_nrOfPassagers( ), 'passagers.',
         /.

*WORKING WITH EVENTS
  lo_motor_tools->set_motorTools('Some extra tools').


*WORKING WITH EXCEPTIONS
  TRY.
      WRITE: / 'There are',zcl_car=>getNrOfCars( ), 'cars.'.
    CATCH zcx_car_exception INTO lo_car_error.
      MESSAGE lo_car_error TYPE 'I'.
  ENDTRY.

*WORKING WITH COMPOSITION
  WRITE: / lo_motor2->get_motor_tools( lo_motor_tools ).
