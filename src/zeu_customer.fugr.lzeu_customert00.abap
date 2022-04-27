*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEU_CUSTOMER....................................*
DATA:  BEGIN OF STATUS_ZEU_CUSTOMER                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEU_CUSTOMER                  .
CONTROLS: TCTRL_ZEU_CUSTOMER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEU_CUSTOMER                  .
TABLES: ZEU_CUSTOMER                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
