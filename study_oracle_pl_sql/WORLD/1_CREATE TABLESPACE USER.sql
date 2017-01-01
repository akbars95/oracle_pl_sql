PROMPT CREATE TABLESPACE TBL_USER_WORLD_DB;
--CREATE TABLESPACE
CREATE TABLESPACE TBL_USER_WORLD_DB
DATAFILE 'D:\work\TBL_USER_WORLD_DB.DBF' SIZE 500M REUSE
AUTOEXTEND ON NEXT 5M MAXSIZE 750M;

PROMPT CREATE TEMPORARY TABLESPACE TEMP_TBL_USER_WORLD_DB;
CREATE TEMPORARY TABLESPACE TEMP_TBL_USER_WORLD_DB
TEMPFILE 'D:\work\TEMP_TBL_USER_WORLD_DB.DBF' SIZE 32M
AUTOEXTEND ON NEXT 32M MAXSIZE 512M;

--CREATE USER
PROMPT CREATE USER;
CREATE USER USER_WORLD_DB 
IDENTIFIED BY USER_WORLD_DB_999
DEFAULT TABLESPACE TBL_USER_WORLD_DB --QUOTA 100M ON TBL_USER_WORLD_DB
TEMPORARY TABLESPACE TEMP_TBL_USER_WORLD_DB; --QUOTA 10M ON TEMP_TBL_USER_WORLD_DB;

--ALTER USER
ALTER USER USER_WORLD_DB IDENTIFIED BY USER_WORLD_DB_999_N;

PROMPT CREATE PROFILE;
--CREATE PROFILE 
CREATE PROFILE PR_USER_WORLD_DB LIMIT PASSWORD_LIFE_TIME 180;

--ALTER USER ADD PROFILE
ALTER USER USER_WORLD_DB PROFILE PR_USER_WORLD_DB;

ALTER USER USER_WORLD_DB ACCOUNT LOCK;
ALTER USER USER_WORLD_DB ACCOUNT UNLOCK;

/*SELECT *
FROM dba_data_files;

select *
from dba_users;
*/
----------------------------------
/*GRANT CREATE SESSION TO USER_WORLD_DB;
GRANT CREATE TABLE TO USER_WORLD_DB;
GRANT CREATE PROCEDURE TO USER_WORLD_DB;
GRANT CREATE TRIGGER TO USER_WORLD_DB;
GRANT CREATE VIEW TO USER_WORLD_DB;
GRANT CREATE SEQUENCE TO USER_WORLD_DB;

GRANT ALTER ANY TABLE TO USER_WORLD_DB;
GRANT ALTER ANY PROCEDURE TO USER_WORLD_DB;
GRANT ALTER ANY TRIGGER TO USER_WORLD_DB;
GRANT ALTER PROFILE TO USER_WORLD_DB;

GRANT DELETE ANY TABLE TO USER_WORLD_DB;
GRANT DROP ANY TABLE TO USER_WORLD_DB;
GRANT DROP ANY PROCEDURE TO USER_WORLD_DB;
GRANT DROP ANY TRIGGER TO USER_WORLD_DB;
GRANT DROP ANY VIEW TO USER_WORLD_DB;
GRANT DROP PROFILE TO USER_WORLD_DB;
*/
PROMPT CREATE ROLE;
--CREATE ROLE
CREATE ROLE ROLE_USER_WORLD_DB;
GRANT ROLE_USER_WORLD_DB TO USER_WORLD_DB;

PROMPT ADD GRANT PRIVILEGES;
GRANT CREATE ANY PROCEDURE TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY SEQUENCE TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY SYNONYM TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY TRIGGER TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY TYPE TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY VIEW TO ROLE_USER_WORLD_DB;
GRANT CREATE ANY INDEX TO ROLE_USER_WORLD_DB;

GRANT CREATE SESSION TO ROLE_USER_WORLD_DB;
GRANT CREATE TABLE TO ROLE_USER_WORLD_DB;
GRANT CREATE PROCEDURE TO ROLE_USER_WORLD_DB;
GRANT CREATE TRIGGER TO ROLE_USER_WORLD_DB;
GRANT CREATE VIEW TO ROLE_USER_WORLD_DB;
GRANT CREATE ROLE TO ROLE_USER_WORLD_DB;
GRANT CREATE SEQUENCE TO ROLE_USER_WORLD_DB;

GRANT ALTER ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT ALTER ANY PROCEDURE TO ROLE_USER_WORLD_DB;
GRANT ALTER ANY TRIGGER TO ROLE_USER_WORLD_DB;
GRANT ALTER ANY ROLE TO ROLE_USER_WORLD_DB;
GRANT ALTER ANY SEQUENCE TO ROLE_USER_WORLD_DB;
GRANT ALTER ANY INDEX TO ROLE_USER_WORLD_DB;
GRANT ALTER PROFILE TO ROLE_USER_WORLD_DB;
GRANT ALTER SESSION TO ROLE_USER_WORLD_DB;
GRANT ALTER DATABASE TO ROLE_USER_WORLD_DB;
GRANT ALTER USER TO ROLE_USER_WORLD_DB;
GRANT ALTER TABLESPACE TO ROLE_USER_WORLD_DB;

GRANT DELETE ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT DROP ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT DROP ANY PROCEDURE TO ROLE_USER_WORLD_DB;
GRANT DROP ANY SEQUENCE TO ROLE_USER_WORLD_DB;
GRANT DROP ANY TRIGGER TO ROLE_USER_WORLD_DB;
GRANT DROP ANY VIEW TO ROLE_USER_WORLD_DB;
GRANT DROP ANY INDEX TO ROLE_USER_WORLD_DB;
GRANT DROP PROFILE TO ROLE_USER_WORLD_DB;
GRANT DROP ANY ROLE TO ROLE_USER_WORLD_DB;

GRANT EXECUTE ANY PROCEDURE TO ROLE_USER_WORLD_DB;
GRANT GRANT ANY PRIVILEGE TO ROLE_USER_WORLD_DB;
GRANT GRANT ANY ROLE TO ROLE_USER_WORLD_DB;
GRANT INSERT ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT LOCK ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT SELECT ANY TABLE TO ROLE_USER_WORLD_DB;
GRANT SELECT ANY SEQUENCE TO ROLE_USER_WORLD_DB;

--see all sys privileges
--select * from SYS.USER_SYS_PRIVS;