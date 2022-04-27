*&---------------------------------------------------------------------*
*& Include          ZEU_PC_STORE_I01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE ok_code.
    WHEN 'EXIT' OR 'CANCEL' OR 'BACK'.
      LEAVE PROGRAM.
    WHEN 'DISP'.
      PERFORM display_data.
    WHEN 'CREATE'.
      CALL SCREEN '0200'.
  ENDCASE.

ENDMODULE.

*&SPWIZARD: INPUT MODULE FOR TC 'TC'. DO NOT CHANGE THIS LINE!
*&SPWIZARD: PROCESS USER COMMAND
MODULE tc_user_command INPUT.
  ok_code = sy-ucomm.
  PERFORM user_ok_tc USING    'TC'
                              'GT_INVOICE'
                              ' '
                     CHANGING ok_code.
  sy-ucomm = ok_code.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0200  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0200 INPUT.

  CASE ok_code2.
    WHEN 'EXIT' OR 'CANCEL' OR 'BACK'.
      CALL SCREEN '0100'.
    WHEN 'SAVE'.
      PERFORM insert_data.
    WHEN 'REFRESH'.
      PERFORM display_data.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  UPDATE_DATA  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE update_data INPUT.
  CASE ok_code.
    WHEN 'UPDATE'.
      MODIFY zeu_invoice FROM gs_invoice.
      PERFORM display_data.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  DELETE_DATA  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE delete_data INPUT.
  CASE ok_code.
    WHEN 'DELETE'.
     CALL SCREEN 300 STARTING AT 2 02 ENDING AT 70 15.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0300  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0300 INPUT.
  CASE ok_code3.
    WHEN 'ENTER'.
       READ TABLE gt_invoice INTO gs_invoice INDEX tc-current_line.
      IF sy-subrc IS INITIAL.
        DELETE zeu_invoice FROM gs_invoice.
        PERFORM display_data.
        CALL SCREEN '0100'.
        IF sy-subrc IS INITIAL.
          COMMIT WORK AND WAIT.
          MESSAGE 'Record deleted succesfully' TYPE 'S'.
        ENDIF.
      ENDIF.
    WHEN 'CANCEL'.
      CALL SCREEN '0100'.
   ENDCASE.
ENDMODULE.
