*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEU_EMPLOYEE....................................*
DATA:  BEGIN OF STATUS_ZEU_EMPLOYEE                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEU_EMPLOYEE                  .
CONTROLS: TCTRL_ZEU_EMPLOYEE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEU_EMPLOYEE                  .
TABLES: ZEU_EMPLOYEE                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
