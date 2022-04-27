*&---------------------------------------------------------------------*
*& Report ZEU_KM_TESTING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zeu_km_testing.

*tables: zeu_logs.

*DATA: ls_log TYPE zeu_test_table1.

*ls_log-eid = '00001'.

*INSERT zeu_test_table1 FROM ls_log.

*DATA: ls_log TYPE zeu_logs.

*ls_log-lid = '00001'.
*ls_log-created_on = sy-datum.
*ls_log-created_by = sy-uname.

*INSERT zeu_logs FROM ls_log.
