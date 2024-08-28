-- Ensure you are working in the correct pluggable database
ALTER SESSION SET CONTAINER = XEPDB1;

SET ECHO OFF
SET VERIFY OFF

-- Cleanup section
BEGIN
  EXECUTE IMMEDIATE 'DROP USER hr CASCADE';
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE != -1918 THEN
      RAISE;
    END IF;
END;
/

-- Prompt for parameters
PROMPT specify password for HR as parameter 1:
ACCEPT pass CHAR PROMPT 'HR Password: '

PROMPT specify default tablespace for HR as parameter 2:
ACCEPT tbs CHAR PROMPT 'Default Tablespace: '

PROMPT specify temporary tablespace for HR as parameter 3:
ACCEPT ttbs CHAR PROMPT 'Temporary Tablespace: '

PROMPT specify password for SYS as parameter 4:
ACCEPT pass_sys CHAR PROMPT 'SYS Password: '

PROMPT specify log path as parameter 5:
ACCEPT log_path CHAR PROMPT 'Log Path: '

PROMPT specify connect string as parameter 6:
ACCEPT connect_string CHAR PROMPT 'Connect String: '

-- Start spooling to the log file
SPOOL &log_path/hr_main.log

-- Create the HR user
CREATE USER hr IDENTIFIED BY &pass;

ALTER USER hr DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER hr TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO hr;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO hr;

-- Grants from sys schema
CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
GRANT execute ON sys.dbms_stats TO hr;

-- Create hr schema objects
CONNECT hr/&pass@&connect_string
WHENEVER SQLERROR EXIT SQL.SQLCODE

-- Run SQL scripts to create HR schema
@D:\ABDULREHMAN\SOFTWARES\ORACLE_DB\ORACLE_DB_XE_21C\SETUP\dbhomeXE\demo\schema\human_resources\hr_cre.sql
@D:\ABDULREHMAN\SOFTWARES\ORACLE_DB\ORACLE_DB_XE_21C\SETUP\dbhomeXE\demo\schema\human_resources\hr_popul.sql
@D:\ABDULREHMAN\SOFTWARES\ORACLE_DB\ORACLE_DB_XE_21C\SETUP\dbhomeXE\demo\schema\human_resources\hr_idx.sql
@D:\ABDULREHMAN\SOFTWARES\ORACLE_DB\ORACLE_DB_XE_21C\SETUP\dbhomeXE\demo\schema\human_resources\hr_code.sql
@D:\ABDULREHMAN\SOFTWARES\ORACLE_DB\ORACLE_DB_XE_21C\SETUP\dbhomeXE\demo\schema\human_resources\hr_comnt.sql
@D:\ABDULREHMAN\SOFTWARES\ORACLE_DB\ORACLE_DB_XE_21C\SETUP\dbhomeXE\demo\schema\human_resources\hr_analz.sql

-- Stop spooling
SPOOL OFF

-- Reconnect in case of disconnection and verify creation
CONNECT sys/&pass_sys@&connect_string AS SYSDBA;
