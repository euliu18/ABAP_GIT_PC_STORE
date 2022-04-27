*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEU_TEST_TABLE1.................................*
DATA:  BEGIN OF STATUS_ZEU_TEST_TABLE1               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZEU_TEST_TABLE1               .
CONTROLS: TCTRL_ZEU_TEST_TABLE1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZEU_TEST_TABLE1               .
TABLES: ZEU_TEST_TABLE1                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
