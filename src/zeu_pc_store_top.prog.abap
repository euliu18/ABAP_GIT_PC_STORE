*&---------------------------------------------------------------------*
*& Include ZEU_PC_STORE_TOP                         - Module Pool      ZEU_PC_STORE
*&---------------------------------------------------------------------*
PROGRAM zeu_pc_store.

TABLES: zeu_invoice.

DATA: ok_code LIKE sy-ucomm,
      ok_code2 LIKE sy-ucomm,
      ok_code3 LIKE sy-ucomm.

SELECTION-SCREEN BEGIN OF SCREEN 120 AS SUBSCREEN.
  SELECT-OPTIONS   s_indate FOR zeu_invoice-in_date OBLIGATORY.
SELECTION-SCREEN END OF SCREEN 120.

DATA: gt_invoice TYPE TABLE OF zeu_invoice,
      gs_invoice TYPE zeu_invoice,
      gv_mark TYPE char01.

DATA: gv_in_id       TYPE zeu_invoice-in_id,
      gv_eid      TYPE zeu_invoice-eid,
      gv_cid      TYPE zeu_invoice-cid,
      gv_in_date     TYPE zeu_invoice-in_date,
      gv_in_value    TYPE zeu_invoice-in_value,
      gv_waers TYPE zeu_invoice-waers.

*&SPWIZARD: DECLARATION OF TABLECONTROL 'TC' ITSELF
CONTROLS: tc TYPE TABLEVIEW USING SCREEN 0110.

*&SPWIZARD: LINES OF TABLECONTROL 'TC'
DATA:     g_tc_lines  LIKE sy-loopc.
