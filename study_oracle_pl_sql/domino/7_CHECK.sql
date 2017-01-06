--------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
BEGIN
  SELECT * FROM V_USER_ACCOUNTS;
  SELECT * FROM V_GAMES;
  SELECT * FROM V_USERS_CREATED_GAMES;
  SELECT * FROM V_GAMES_ATTENDEES;
  SELECT * FROM V_GAME_ATTENDEES_USERS;
  
  SELECT DOMINO_ID FROM MV_DOMINOS
  MINUS
  SELECT DOMINO_ID FROM T_GAME_USER_DOMINOS
  ORDER BY DOMINO_ID;
  
  select *
  from T_GAME_USER_DOMINOS TGUD
  WHERE TGUD.GAME_ATTENDEE_ID IN (
    SELECT TGAOUT.GAME_ATTENDEE_ID
    FROM T_GAMES_ATTENDEES TGAOUT
    WHERE TGAOUT.GAME_ID IN (
      select TGA.GAME_ID
      from T_GAMES_ATTENDEES TGA
      WHERE TGA.GAME_ATTENDEE_ID = :GAME_ATTENDEE_ID
    )
  );
 
END;

--------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  CUR_RANDOM_INTERATION INTEGER;
  DOMINO_COUNT INTEGER := PKG_DOMINOS_DOMINOS.GET_DOMINO_COUNT;
  
  FUNCTION GET_RANDOM
  RETURN INTEGER
  IS
    CUR_RANDOM INTEGER;
  BEGIN
    SELECT ROUND(SYS.DBMS_RANDOM.VALUE * 28) INTO CUR_RANDOM FROM DUAL;
    RETURN CUR_RANDOM;
  END;
    
BEGIN
  --SELECT SYS.DBMS_RANDOM.RANDOM FROM DUAL;
  FOR I IN 1 .. 100
  LOOP
    CUR_RANDOM_INTERATION := GET_RANDOM;
    IF CUR_RANDOM_INTERATION >= 27 THEN
      DBMS_OUTPUT.PUT_LINE(I || ' ----- ' || CUR_RANDOM_INTERATION);
    END IF;  
  END LOOP;
END;  

--------------------------------------------------------------------------------
SET SERVEROUTPUT ON;
DECLARE
  DOMINO T_DOMINOS%ROWTYPE;
BEGIN
  DOMINO := PKG_DOMINOS_DOMINOS.GET_RANDOM_DOMINO;
  DBMS_OUTPUT.PUT_LINE(DOMINO.DOMINO_LEFT_PIECE || '|' || DOMINO.DOMINO_RIGHT_PIECE);
END;
--------------------------------------------------------------------------------
BEGIN
  
  SELECT MVD.DOMINO_ID
  FROM MV_DOMINOS MVD
  MINUS
  SELECT GUDOUT.DOMINO_ID
  FROM T_GAME_USER_DOMINOS GUDOUT
  WHERE GUDOUT.GAME_ATTENDEE_ID IN (
    SELECT OUTGA.GAME_ATTENDEE_ID
    FROM T_GAMES_ATTENDEES OUTGA
    WHERE OUTGA.GAME_ID = (
      select DISTINCT GA.GAME_ID
      from T_GAME_USER_DOMINOS GUD INNER JOIN T_GAMES_ATTENDEES GA ON GUD.GAME_ATTENDEE_ID = GA.GAME_ATTENDEE_ID 
      WHERE GA.GAME_ATTENDEE_ID = 49--:GA
    )
  );
  
  select * from T_GAME_USER_DOMINOS;
  
END;

--------------------------------------------------------------------------------
DECLARE
    L_DOMINO_ID T_GAME_USER_DOMINOS.DOMINO_ID%TYPE;
    L_FLAG_EXISTS BOOLEAN := FALSE;
BEGIN
--  LOOP
      L_DOMINO_ID := PKG_DOMINOS_DOMINOS.GET_RANDOM_DOMINO_ID;
      DBMS_OUTPUT.PUT_LINE('L_DOMINO_ID = ' || L_DOMINO_ID);
      FOR d IN (SELECT MVD.DOMINO_ID
                  FROM MV_DOMINOS MVD
                  MINUS
                  SELECT GUDOUT.DOMINO_ID
                  FROM T_GAME_USER_DOMINOS GUDOUT
                  WHERE GUDOUT.GAME_ATTENDEE_ID IN (
                    SELECT OUTGA.GAME_ATTENDEE_ID
                    FROM T_GAMES_ATTENDEES OUTGA
                    WHERE OUTGA.GAME_ID = (
                      select DISTINCT GA.GAME_ID
                      from T_GAME_USER_DOMINOS GUD INNER JOIN T_GAMES_ATTENDEES GA ON GUD.GAME_ATTENDEE_ID = GA.GAME_ATTENDEE_ID 
                      WHERE GA.GAME_ATTENDEE_ID = 49
                    )
                  )
      )
      LOOP
        DBMS_OUTPUT.PUT_LINE('d=' || d.DOMINO_ID);
--        IF L_FLAG_EXISTS = FALSE THEN
--          IF d = L_DOMINO_ID THEN
--            DBMS_OUTPUT.PUT_LINE('false');
----            L_FLAG_EXISTS := TRUE;
--          END IF;
--        END IF;
      END LOOP;
      DBMS_OUTPUT.PUT_LINE('end');
--    EXIT WHEN L_FLAG_EXISTS = FALSE;  
--    END LOOP;
END;

--------------------------------------------------------------------------------
DECLARE
    L_DOMINO_ID T_GAME_USER_DOMINOS.DOMINO_ID%TYPE;
    L_DOMINO_ID_IN T_GAME_USER_DOMINOS.DOMINO_ID%TYPE;
BEGIN
  L_DOMINO_ID_IN := 5;
  FOR I IN 1 .. 100 LOOP
    L_DOMINO_ID := PKG_DOMINOS_DOMINOS.GET_RANDOM_DOMINO_ID;
    IF L_DOMINO_ID_IN = L_DOMINO_ID THEN
      DBMS_OUTPUT.PUT_LINE('I = ' || I || ' - L_DOMINO_ID = ' || L_DOMINO_ID);
    END IF;
  END LOOP;
END;