PROMPT--*****************DROP PROFILE PR_USER_DOMINO***********************
DROP PROFILE PR_USER_DOMINO CASCADE;

PROMPT--*****************DROP USER USER_DOMINO***********************
DROP USER USER_DOMINO CASCADE;

PROMPT--*****************CREATE USER USER_DOMINO***********************
CREATE USER USER_DOMINO
IDENTIFIED BY USER_DOMINO999
DEFAULT TABLESPACE TBL_USER_WORLD_DB
TEMPORARY TABLESPACE TEMP_TBL_USER_WORLD_DB;

PROMPT--*****************CREATE PROFILE PR_USER_DOMINO***********************
CREATE PROFILE PR_USER_DOMINO LIMIT PASSWORD_LIFE_TIME 180;
ALTER USER USER_DOMINO PROFILE PR_USER_DOMINO;
ALTER USER USER_DOMINO QUOTA 100M ON TBL_USER_WORLD_DB;
GRANT ROLE_USER_WORLD_DB TO USER_DOMINO;

GRANT CREATE MATERIALIZED VIEW TO USER_DOMINO;
GRANT DROP ANY MATERIALIZED VIEW TO USER_DOMINO;
GRANT QUERY REWRITE TO USER_DOMINO;
