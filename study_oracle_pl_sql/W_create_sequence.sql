--delete sequence
drop SEQUENCE COUNTRY_SEQ;
drop SEQUENCE CITY_SEQ;

--create sequence
CREATE SEQUENCE CITY_SEQ
MINVALUE 1
MAXVALUE 999999999
START WITH 1
INCREMENT BY 1
CACHE 100;

CREATE SEQUENCE COUNTRY_SEQ
MINVALUE 1
MAXVALUE 999
START WITH 1
INCREMENT BY 1
CACHE 20;

--get value from sequence
select COUNTRY_SEQ.NEXTVAL from dual;



--alter sequence
alter sequence COUNTRY_SEQ
INCREMENT BY 10;