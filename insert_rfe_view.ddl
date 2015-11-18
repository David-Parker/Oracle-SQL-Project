drop sequence rfe_rfe_id;
create sequence rfe_rfe_id
start with 1
increment by 1
nomaxvalue;

drop view rfe_view ;

create view rfe_view as
SELECT *
FROM F15_C3_RFE ;

CREATE OR REPLACE TRIGGER rfe_view_trigger
   INSTEAD OF INSERT ON rfe_view
   DECLARE
     deptno NUMBER;
   BEGIN
     deptno := rfe_rfe_id.nextval;
     INSERT INTO DEPT(DEPTNO, DNAME, LOC) VALUES (
        deptno,
        :NEW.DNAME,
        :NEW.LOC
     );
     INSERT INTO EMP(EMPNO, DEPTNO) VALUES (10, deptno);
   END rfe_view_trigger;
/

insert into rfe_view(DEPTNO, DNAME, LOC) VALUES (60, 'New_Dept', 'Austin');