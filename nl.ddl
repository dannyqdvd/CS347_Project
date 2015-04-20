-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-20 17:13:59 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




CREATE TABLE NL_Document
  (
    document_id   INTEGER ,
    filename      VARCHAR2 (4000 BYTE) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512) ,
    file_data BLOB ,
    file_comments       VARCHAR2 (4000) ,
    tags                VARCHAR2 (4000) ,
    NL_Member_member_id INTEGER NOT NULL
  ) ;

CREATE TABLE NL_Member
  (
    member_id               INTEGER NOT NULL ,
    type                    VARCHAR2 (255) ,
    status                  VARCHAR2 (255) ,
    name                    VARCHAR2 (4000) ,
    description             VARCHAR2 (4000) ,
    ownership_division_code VARCHAR2 (255) ,
    external_view_name      VARCHAR2 (4000) ,
    status_effective_date   DATE ,
    NL_admin_user_id        INTEGER NOT NULL
  ) ;
ALTER TABLE NL_Member ADD CONSTRAINT NL_Member_PK PRIMARY KEY ( member_id ) ;

CREATE TABLE NL_User
  ( user_id INTEGER NOT NULL
  ) ;
ALTER TABLE NL_User ADD CONSTRAINT NL_User_PK PRIMARY KEY ( user_id ) ;

CREATE TABLE NL_admin
  ( user_id INTEGER NOT NULL
  ) ;
ALTER TABLE NL_admin ADD CONSTRAINT NL_admin_PK PRIMARY KEY ( user_id ) ;

CREATE TABLE m2m
  (
    m2m_id               INTEGER NOT NULL ,
    NL_Member_member_id  INTEGER NOT NULL ,
    NL_Member_member_id1 INTEGER NOT NULL
  ) ;
ALTER TABLE m2m ADD CONSTRAINT m2m_PK PRIMARY KEY ( m2m_id ) ;

ALTER TABLE NL_Document ADD CONSTRAINT NL_Document_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE NL_Member ADD CONSTRAINT NL_Member_NL_admin_FK FOREIGN KEY ( NL_admin_user_id ) REFERENCES NL_admin ( user_id ) ;

ALTER TABLE NL_admin ADD CONSTRAINT NL_admin_NL_User_FK FOREIGN KEY ( user_id ) REFERENCES NL_User ( user_id ) ;

ALTER TABLE m2m ADD CONSTRAINT m2m_NL_Member_FK FOREIGN KEY ( NL_Member_member_id ) REFERENCES NL_Member ( member_id ) ;

ALTER TABLE m2m ADD CONSTRAINT m2m_NL_Member_FKv1 FOREIGN KEY ( NL_Member_member_id1 ) REFERENCES NL_Member ( member_id ) ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
