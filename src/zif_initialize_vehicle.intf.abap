INTERFACE zif_initialize_vehicle
  PUBLIC .

  INTERFACES zif_vehicle.
  ALIASES: initialize FOR zif_vehicle~initialize.
  METHODS: initialize_car RETURNING VALUE(rv_initialize_car) TYPE string.

ENDINTERFACE.
