CREATE TABLE F15_C3_Document
  (
    doc_id            INTEGER NOT NULL ,
    F15_C3_RFE_ref_id INTEGER ,
    filename          VARCHAR2 (255) ,
    file_mimetype     VARCHAR2 (20) ,
    file_charset      VARCHAR2 (25) ,
    file_blob BLOB ,
    comments VARCHAR2 (4000) ,
    tags     VARCHAR2 (255)
  ) ;
  
ALTER TABLE F15_C3_Document ADD CONSTRAINT F15_C3_Document_PK PRIMARY KEY ( doc_id ) ;

ALTER TABLE F15_C3_Document ADD CONSTRAINT F15_C3_Document_F15_C3_RFE_FK FOREIGN KEY ( F15_C3_RFE_ref_id ) REFERENCES F15_C3_RFE ( ref_id ) ;