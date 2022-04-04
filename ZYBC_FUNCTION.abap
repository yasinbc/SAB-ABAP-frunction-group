FUNCTION zybc_write_test.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(TEXT) TYPE  STRING
*"  EXPORTING
*"     REFERENCE(RESULT) TYPE  STRING
*"  EXCEPTIONS
*"      NOT_SUPPORTED
*"----------------------------------------------------------------------

IF text IS INITIAL.
  result = 'Importing parameters is invalid'.
  RAISE not_supported.
ELSE.
  WRITE:/ text.
  result = 'All parameters are valid'.
  write:/ result.
ENDIF.


ENDFUNCTION.














*&---------------------------------------------------------------------*
*& Report ZYBC_FUNCTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZYBC_FUNCTION.
                           "VALUE IS INITIAL,
data: some_text type string value 'Hello CEMOSA!', "Or VALUE IS INITIAL
      some_result type string.

CALL FUNCTION 'ZYBC_WRITE_TEST'
  EXPORTING
    text                = some_text
 IMPORTING
   RESULT              = some_result
 EXCEPTIONS
   NOT_SUPPORTED       = 1
   OTHERS              = 2.

IF sy-subrc EQ 1.
  MESSAGE some_result TYPE 'E' .
elseif sy-subrc eq 2 .
  MESSAGE 'sy-subrc is 2.' type 'E'.
  write:/ 'Result: ',some_result.

endif.