*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEU_INVOICE.....................................*
DATA:  BEGIN OF STATUS_ZEU_INVOICE                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEU_INVOICE                   .
CONTROLS: TCTRL_ZEU_INVOICE
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEU_INVOICE                   .
TABLES: ZEU_INVOICE                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
