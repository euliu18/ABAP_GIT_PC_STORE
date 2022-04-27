*&---------------------------------------------------------------------*
*& Include          ZEU_PC_STORE_O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module STATUS_0100 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
  SET PF-STATUS 'ZEU_STATUS'.
  SET TITLEBAR 'ZEU_TITLE'.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: UPDATE LINES FOR EQUIVALENT SCROLLBAR
MODULE tc_change_tc_attr OUTPUT.
  DESCRIBE TABLE gt_invoice LINES tc-lines.
ENDMODULE.

*&SPWIZARD: OUTPUT MODULE FOR TC 'TC'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: GET LINES OF TABLECONTROL
MODULE tc_get_lines OUTPUT.
  g_tc_lines = sy-loopc.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0110 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0110 OUTPUT.
* SET PF-STATUS 'xxxxxxxx'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0200 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0200 OUTPUT.
 SET PF-STATUS 'ZEU_STATUS2'.
 SET TITLEBAR 'ZEU_TITLE2'.
ENDMODULE.
*&---------------------------------------------------------------------*
*& Module STATUS_0300 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE status_0300 OUTPUT.
 SET PF-STATUS 'ZEU_STATUS3'.
* SET TITLEBAR 'xxx'.
ENDMODULE.
