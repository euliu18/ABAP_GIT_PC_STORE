*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZEU_CUSTOMER
*   generation date: 22.04.2022 at 09:57:36
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZEU_CUSTOMER       .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
