*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEU_LOGS........................................*
DATA:  BEGIN OF STATUS_ZEU_LOGS                      .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEU_LOGS                      .
CONTROLS: TCTRL_ZEU_LOGS
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEU_LOGS                      .
TABLES: ZEU_LOGS                       .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
