-- F15_C3_RFE.ddl
-- Member 1: David Parker EID: dp24559
-- Member 2: Spencer Shadley EID: srs
-- Member 3: Cheng Ma EID: cm

DROP TABLE F15_C3_Auth
DROP TABLE F15_C3_Comment
DROP TABLE F15_C3_Document
DROP TABLE F15_C3_Lab
DROP TABLE F15_C3_RFE
DROP TABLE F15_C3_Status_Code
DROP TABLE F15_C3_Sts_His
DROP TABLE F15_C3_Task
DROP TABLE F15_C3_employee
DROP TABLE Relation_11
DROP TABLE approvers
DROP TABLE contacts

CREATE TABLE F15_C3_Auth
  (
    auth_id                INTEGER NOT NULL ,
    RIGHT                  VARCHAR2 (10) ,
    F15_C3_employee_emp_id INTEGER
  ) ;
CREATE UNIQUE INDEX F15_C3_Auth__IDX ON F15_C3_Auth
  (
    F15_C3_employee_emp_id ASC
  )
  ;
ALTER TABLE F15_C3_Auth ADD CONSTRAINT F15_C3_Auth_PK PRIMARY KEY ( auth_id ) ;


CREATE TABLE F15_C3_Comment
  (
    comment_id             INTEGER NOT NULL ,
    F15_C3_employee_emp_id INTEGER ,
    entry_date             DATE ,
    comments               VARCHAR2 (4000)
  ) ;
ALTER TABLE F15_C3_Comment ADD CONSTRAINT F15_C3_Comment_PK PRIMARY KEY ( comment_id ) ;


CREATE TABLE F15_C3_Document
  (
    doc_id            INTEGER NOT NULL ,
    F15_C3_RFE_ref_id INTEGER ,
    name              VARCHAR2 (255)
  ) ;
ALTER TABLE F15_C3_Document ADD CONSTRAINT F15_C3_Document_PK PRIMARY KEY ( doc_id ) ;


CREATE TABLE F15_C3_Lab
  ( lab_id INTEGER NOT NULL , name VARCHAR2 (4)
  ) ;
ALTER TABLE F15_C3_Lab ADD CONSTRAINT F15_C3_Lab_PK PRIMARY KEY ( lab_id ) ;


CREATE TABLE F15_C3_RFE
  (
    ref_id                       INTEGER NOT NULL ,
    F15_C3_employee_emp_id       INTEGER ,
    F15_C3_Status_Code_status_id INTEGER ,
    F15_C3_Task_task_id          INTEGER ,
    explaination                 VARCHAR2 (4000) ,
    alt_protections              VARCHAR2 (4000) ,
    approval_review_date         DATE
  ) ;
ALTER TABLE F15_C3_RFE ADD CONSTRAINT F15_C3_RFE_PK PRIMARY KEY ( ref_id ) ;


CREATE TABLE F15_C3_Status_Code
  (
    status_id      INTEGER NOT NULL ,
    effective_date DATE ,
    name           VARCHAR2 (40) ,
    description    VARCHAR2 (400) ,
    status_code    VARCHAR2 (1)
  ) ;
ALTER TABLE F15_C3_Status_Code ADD CONSTRAINT F15_C3_Status_Code_PK PRIMARY KEY ( status_id ) ;


CREATE TABLE F15_C3_Sts_His
  (
    his_id            INTEGER NOT NULL ,
    F15_C3_RFE_ref_id INTEGER
  ) ;
ALTER TABLE F15_C3_Sts_His ADD CONSTRAINT F15_C3_Sts_His_PK PRIMARY KEY ( his_id ) ;


CREATE TABLE F15_C3_Task
  (
    task_id           INTEGER NOT NULL ,
    effective_date    DATE ,
    task_abbreviation VARCHAR2 (15) ,
    description       VARCHAR2 (4000)
  ) ;
ALTER TABLE F15_C3_Task ADD CONSTRAINT F15_C3_Task_PK PRIMARY KEY ( task_id ) ;


CREATE TABLE F15_C3_employee
  (
    emp_id              INTEGER NOT NULL ,
    F15_C3_Auth_auth_id INTEGER ,
    F15_C3_Lab_lab_id   INTEGER ,
    active              CHAR (1) ,
    name                VARCHAR2 (30) ,
    email               VARCHAR2 (90) ,
    office              VARCHAR2 (5) ,
    phone               VARCHAR2 (25) ,
    status_eff_date     DATE ,
    type                VARCHAR2 (40)
  ) ;
CREATE UNIQUE INDEX F15_C3_employee__IDX ON F15_C3_employee
  (
    F15_C3_Auth_auth_id ASC
  )
  ;
ALTER TABLE F15_C3_employee ADD CONSTRAINT F15_C3_employee_PK PRIMARY KEY ( emp_id ) ;


CREATE TABLE Relation_11
  (
    F15_C3_RFE_ref_id         INTEGER NOT NULL ,
    F15_C3_Comment_comment_id INTEGER NOT NULL
  ) ;
ALTER TABLE Relation_11 ADD CONSTRAINT Relation_11_PK PRIMARY KEY ( F15_C3_RFE_ref_id, F15_C3_Comment_comment_id ) ;


CREATE TABLE approvers
  (
    F15_C3_employee_emp_id INTEGER NOT NULL ,
    F15_C3_RFE_ref_id      INTEGER NOT NULL
  ) ;
ALTER TABLE approvers ADD CONSTRAINT approvers_PK PRIMARY KEY ( F15_C3_employee_emp_id, F15_C3_RFE_ref_id ) ;


CREATE TABLE contacts
  (
    F15_C3_employee_emp_id INTEGER NOT NULL ,
    F15_C3_RFE_ref_id      INTEGER NOT NULL
  ) ;
ALTER TABLE contacts ADD CONSTRAINT contacts_PK PRIMARY KEY ( F15_C3_employee_emp_id, F15_C3_RFE_ref_id ) ;


ALTER TABLE F15_C3_Auth ADD CONSTRAINT F15_C3_Auth_F15_C3_employee_FK FOREIGN KEY ( F15_C3_employee_emp_id ) REFERENCES F15_C3_employee ( emp_id ) ;

ALTER TABLE F15_C3_Comment ADD CONSTRAINT F15_C3_Comment_F15_C3_emp_FK FOREIGN KEY ( F15_C3_employee_emp_id ) REFERENCES F15_C3_employee ( emp_id ) ;

ALTER TABLE F15_C3_Document ADD CONSTRAINT F15_C3_Document_F15_C3_RFE_FK FOREIGN KEY ( F15_C3_RFE_ref_id ) REFERENCES F15_C3_RFE ( ref_id ) ;

ALTER TABLE F15_C3_RFE ADD CONSTRAINT F15_C3_RFE_F15_C3_Sts_Code_FK FOREIGN KEY ( F15_C3_Status_Code_status_id ) REFERENCES F15_C3_Status_Code ( status_id ) ;

ALTER TABLE F15_C3_RFE ADD CONSTRAINT F15_C3_RFE_F15_C3_Task_FK FOREIGN KEY ( F15_C3_Task_task_id ) REFERENCES F15_C3_Task ( task_id ) ;

ALTER TABLE F15_C3_RFE ADD CONSTRAINT F15_C3_RFE_F15_C3_employee_FK FOREIGN KEY ( F15_C3_employee_emp_id ) REFERENCES F15_C3_employee ( emp_id ) ;

ALTER TABLE F15_C3_Sts_His ADD CONSTRAINT F15_C3_Sts_His_F15_C3_RFE_FK FOREIGN KEY ( F15_C3_RFE_ref_id ) REFERENCES F15_C3_RFE ( ref_id ) ;

ALTER TABLE F15_C3_employee ADD CONSTRAINT F15_C3_employee_F15_C3_Auth_FK FOREIGN KEY ( F15_C3_Auth_auth_id ) REFERENCES F15_C3_Auth ( auth_id ) ;

ALTER TABLE F15_C3_employee ADD CONSTRAINT F15_C3_employee_F15_C3_Lab_FK FOREIGN KEY ( F15_C3_Lab_lab_id ) REFERENCES F15_C3_Lab ( lab_id ) ;

ALTER TABLE Relation_11 ADD CONSTRAINT FK_ASS_19 FOREIGN KEY ( F15_C3_RFE_ref_id ) REFERENCES F15_C3_RFE ( ref_id ) ;

ALTER TABLE Relation_11 ADD CONSTRAINT FK_ASS_20 FOREIGN KEY ( F15_C3_Comment_comment_id ) REFERENCES F15_C3_Comment ( comment_id ) ;

ALTER TABLE approvers ADD CONSTRAINT FK_ASS_26 FOREIGN KEY ( F15_C3_employee_emp_id ) REFERENCES F15_C3_employee ( emp_id ) ;

ALTER TABLE approvers ADD CONSTRAINT FK_ASS_27 FOREIGN KEY ( F15_C3_RFE_ref_id ) REFERENCES F15_C3_RFE ( ref_id ) ;

ALTER TABLE contacts ADD CONSTRAINT FK_ASS_28 FOREIGN KEY ( F15_C3_employee_emp_id ) REFERENCES F15_C3_employee ( emp_id ) ;

ALTER TABLE contacts ADD CONSTRAINT FK_ASS_29 FOREIGN KEY ( F15_C3_RFE_ref_id ) REFERENCES F15_C3_RFE ( ref_id ) ;
