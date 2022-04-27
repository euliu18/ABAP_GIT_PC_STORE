*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZEU_TEST_TABLE1
*   generation date: 26.04.2022 at 16:58:41
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZEU_TEST_TABLE1    .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
