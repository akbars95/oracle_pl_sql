CREATE OR REPLACE PROCEDURE INSERT_OPERATION(OPERATION_NAME_IN IN T_C_OPERATIONS.OPERATION_NAME%TYPE) IS
BEGIN
  INSERT INTO T_C_OPERATIONS(OPERATION_NAME) VALUES(OPERATION_NAME_IN);
END INSERT_OPERATION;