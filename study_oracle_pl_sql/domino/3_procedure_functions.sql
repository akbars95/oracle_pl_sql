PROMPT--*****************PROCEDURES***********************
--PROCEDURES
DROP PROCEDURE INSERT_DOMINO;
CREATE OR REPLACE PROCEDURE INSERT_DOMINO(
DOMINO_LEFT_PIECE_IN IN T_DOMINOS.DOMINO_LEFT_PIECE%TYPE, 
DOMINO_RIGHT_PIECE_IN IN T_DOMINOS.DOMINO_RIGHT_PIECE%TYPE) IS
BEGIN
  INSERT INTO T_DOMINOS(DOMINO_LEFT_PIECE, DOMINO_RIGHT_PIECE) 
  VALUES(DOMINO_LEFT_PIECE_IN, DOMINO_RIGHT_PIECE_IN);
  COMMIT;
END;
/

DROP PROCEDURE FILL_INSERT_DOMINO;
CREATE OR REPLACE PROCEDURE FILL_INSERT_DOMINO 
IS
  START_NUMBER NUMBER := 0;
  START_NUMBER_INNER NUMBER := 0;
  END_NUMBER NUMBER := 6;
BEGIN
  WHILE START_NUMBER <= END_NUMBER
  LOOP
    START_NUMBER_INNER := START_NUMBER;
    WHILE START_NUMBER_INNER <= END_NUMBER
    LOOP
      INSERT INTO T_DOMINOS(DOMINO_LEFT_PIECE, DOMINO_RIGHT_PIECE) 
      VALUES(START_NUMBER, START_NUMBER_INNER);
      COMMIT;
      DBMS_OUTPUT.PUT_LINE(START_NUMBER || '|' || START_NUMBER_INNER);
      START_NUMBER_INNER := START_NUMBER_INNER + 1;
    END LOOP;
    START_NUMBER := START_NUMBER + 1;
  END LOOP;
END;
/

PROMPT--*****************FUNCTIONS***********************
--FUNCTIONS
DROP FUNCTION FILL_DOMINO;
CREATE OR REPLACE FUNCTION FILL_DOMINO RETURN NUMBER
IS
  COUNT_DOMINO NUMBER := 0;
  START_NUMBER NUMBER := 0;
  START_NUMBER_INNER NUMBER := 0;
  END_NUMBER NUMBER := 6;
BEGIN
  WHILE START_NUMBER <= END_NUMBER
  LOOP
    START_NUMBER_INNER := START_NUMBER;
    WHILE START_NUMBER_INNER <= END_NUMBER
    LOOP
      DBMS_OUTPUT.PUT_LINE(START_NUMBER || '|' || START_NUMBER_INNER);
      COUNT_DOMINO := COUNT_DOMINO + 1;
      START_NUMBER_INNER := START_NUMBER_INNER + 1;
    END LOOP;
    START_NUMBER := START_NUMBER + 1;
  END LOOP;
  RETURN COUNT_DOMINO;
END;
/
