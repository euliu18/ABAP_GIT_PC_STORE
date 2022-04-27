*----------------------------------------------------------------------*
***INCLUDE LZEU_TEST_TABLE1F01.
*----------------------------------------------------------------------*

FORM create.
** -- Data Declarations
  DATA: lv_timestamp TYPE tzonref-tstamps,
        lv_tmp       TYPE tzonref-tstamps
        .
*-- Time stamp conversion
  CALL FUNCTION 'ABI_TIMESTAMP_CONVERT_INTO'
    EXPORTING
      iv_date          = sy-datum
      iv_time          = sy-uzeit
    IMPORTING
      ev_timestamp     = lv_timestamp
    EXCEPTIONS
      conversion_error = 1
      OTHERS           = 2.
  IF sy-subrc = 0.
** -- Created On & Created By
    zeu_test_table1-created_by = sy-uname.
    lv_tmp = lv_timestamp(8).
    zeu_test_table1-created_on = lv_tmp.
  ENDIF.
ENDFORM.
