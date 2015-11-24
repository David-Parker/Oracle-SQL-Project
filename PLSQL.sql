-- Page 5
select REF_ID as RFE_ID,
      e1.emp_id,
      e1.role,
      e1.F15_C3_Lab_lab_id,
      a.right,
      F15_C3_employee_emp_id,
      'View Comments' as Comments,
      'View Documents' as Documents,
      'Accept/Reject' as Action,
      "REF_ID", 
"F15_C3_STATUS_CODE_STATUS_ID",
"F15_C3_TASK_TASK_ID",
"EXPLAINATION",
"ALT_PROTECTIONS",
"APPROVAL_REVIEW_DATE"
 from F15_C3_employee e1 join F15_C3_auth a on e1.F15_C3_Auth_auth_id = a.auth_id,
              (F15_C3_RFE r join F15_C3_employee e2 on r.F15_C3_Employee_emp_id = e2.emp_id)
              where e1.emp_id = :P1_EMP_v2
              AND
              (
e1.role = 'System Admin' AND
"F15_C3_STATUS_CODE_STATUS_ID" = 101 AND
(select e3.F15_C3_Lab_lab_id from F15_C3_Employee e3 where e3.emp_id = F15_C3_employee_emp_id) = e1.F15_C3_Lab_lab_id
)

UNION

select REF_ID as RFE_ID,
      e1.emp_id,
      e1.role,
      e1.F15_C3_Lab_lab_id,
      a.right,
      F15_C3_employee_emp_id,
      'View Comments' as Comments,
      'View Documents' as Documents,
            'Accept/Reject' as Action,
      "REF_ID", 
"F15_C3_STATUS_CODE_STATUS_ID",
"F15_C3_TASK_TASK_ID",
"EXPLAINATION",
"ALT_PROTECTIONS",
"APPROVAL_REVIEW_DATE"
 from F15_C3_employee e1 join F15_C3_auth a on e1.F15_C3_Auth_auth_id = a.auth_id,
              (F15_C3_RFE r join F15_C3_employee e2 on r.F15_C3_Employee_emp_id = e2.emp_id)
              where e1.emp_id = :P1_EMP_v2
              AND
              (
e1.role = 'Lab Director' AND
"F15_C3_STATUS_CODE_STATUS_ID" = 105 AND
(select e3.F15_C3_Lab_lab_id from F15_C3_Employee e3 where e3.emp_id = F15_C3_employee_emp_id) = e1.F15_C3_Lab_lab_id
)

UNION

select REF_ID as RFE_ID,
      e1.emp_id,
      e1.role,
      e1.F15_C3_Lab_lab_id,
      a.right,
      F15_C3_employee_emp_id,
      'View Comments' as Comments,
      'View Documents' as Documents,
            'Accept/Reject' as Action,
      "REF_ID", 
"F15_C3_STATUS_CODE_STATUS_ID",
"F15_C3_TASK_TASK_ID",
"EXPLAINATION",
"ALT_PROTECTIONS",
"APPROVAL_REVIEW_DATE"
 from F15_C3_employee e1 join F15_C3_auth a on e1.F15_C3_Auth_auth_id = a.auth_id,
              (F15_C3_RFE r join F15_C3_employee e2 on r.F15_C3_Employee_emp_id = e2.emp_id)
              where e1.emp_id = :P1_EMP_v2
              AND
              (
e1.role = 'Chairperson' AND
"F15_C3_STATUS_CODE_STATUS_ID" = 106
)

UNION

select REF_ID as RFE_ID,
      e1.emp_id,
      e1.role,
      e1.F15_C3_Lab_lab_id,
      a.right,
      F15_C3_employee_emp_id,
      'View Comments' as Comments,
      'View Documents' as Documents,
            'Accept/Reject' as Action,
      "REF_ID", 
"F15_C3_STATUS_CODE_STATUS_ID",
"F15_C3_TASK_TASK_ID",
"EXPLAINATION",
"ALT_PROTECTIONS",
"APPROVAL_REVIEW_DATE"
 from F15_C3_employee e1 join F15_C3_auth a on e1.F15_C3_Auth_auth_id = a.auth_id,
              (F15_C3_RFE r join F15_C3_employee e2 on r.F15_C3_Employee_emp_id = e2.emp_id)
              where e1.emp_id = :P1_EMP_v2
              AND
              (
e1.role = 'Executive Director' AND
"F15_C3_STATUS_CODE_STATUS_ID" = 107
);

-- Page 36
declare status NUMBER;
BEGIN
select F15_C3_Status_Code_status_id into status from F15_C3_RFE where ref_id = :P6_RFE_v2;

IF status <> 108 AND status <> 104 THEN
    update F15_C3_RFE
    set F15_C3_Status_Code_status_id = 103
    where ref_id = :P6_RFE_v2;
END IF;

END;

DECLARE statusid NUMBER;
        duplicate NUMBER;
        history NUMBER;
BEGIN
select F15_C3_Status_Code_status_id into statusid
from F15_C3_RFE where ref_id = :P6_RFE_v2;

    -- Is return_for empty?
    select count(*) into duplicate from return_to r
    where r.F15_C3_RFE_ref_id = :P6_RFE_v2;
      
     IF statusid = 102 THEN
        select status_id into history from return_to where his_id = :P6_RFE_v2;
        update F15_C3_RFE
        set F15_C3_Status_Code_status_id = history
        where ref_id = :P6_RFE_v2;
       ELSE
           history := 101; 
     END IF;
      
    IF duplicate = 0 THEN
        insert into return_to Values(:P6_RFE_v2, :P6_RFE_v2, 101);
    ELSE 
        update return_to
        set F15_C3_RFE_ref_id = :P6_RFE_v2, status_id = history
        where his_id = :P6_RFE_v2;
    END IF;

    IF statusid  = 100 THEN
        update F15_C3_RFE
        -- 101 = submitted status
        set F15_C3_Status_Code_status_id=101
        where ref_id = :P6_RFE_v2;
    END IF;
    
    
     insert into F15_C3_Sts_His values(F15_C3_Sts_His_seq.nextval, :P6_RFE_v2, 101);
END;

-- Page 37
DECLARE statusid NUMBER;
BEGIN
       update F15_C3_RFE
       set F15_C3_Status_Code_status_id = 102
       where ref_id = :P5_RFE_v2;
    
    select F15_C3_Status_Code_status_id into statusid
        from F15_C3_RFE where ref_id = :P5_RFE_v2;

    insert into F15_C3_Sts_His values(F15_C3_Sts_His_seq.nextval, :P5_RFE_v2, statusid);

END;

DECLARE statusid NUMBER;
BEGIN
select F15_C3_Status_Code_status_id into statusid
from F15_C3_RFE where ref_id = :P6_RFE_v2;
    -- Submitted
        update F15_C3_RFE
        set F15_C3_Status_Code_status_id = 104
        where ref_id = :P6_RFE_v2;
END;

DECLARE statusid NUMBER;
        duplicate NUMBER;
BEGIN
select F15_C3_Status_Code_status_id into statusid
from F15_C3_RFE where ref_id = :P5_RFE_v2;
    
    -- Submitted
    IF statusid = 101 THEN
        update F15_C3_RFE
        set F15_C3_Status_Code_status_id = 105
        where ref_id = :P5_RFE_v2;
    
    -- SA Approved
    ELSIF statusid = 105 THEN
        update F15_C3_RFE
        set F15_C3_Status_Code_status_id = 106
        where ref_id = :P5_RFE_v2;
    
    -- LD Approved
    ELSIF statusid = 106 THEN
        update F15_C3_RFE
        set F15_C3_Status_Code_status_id = 107
        where ref_id = :P5_RFE_v2;
    
        -- CH Approved
    ELSIF statusid = 107 THEN
        update F15_C3_RFE
        set F15_C3_Status_Code_status_id = 108
        where ref_id = :P5_RFE_v2;
    
    END IF;
    
    select F15_C3_Status_Code_status_id into statusid
        from F15_C3_RFE where ref_id = :P5_RFE_v2;

    insert into F15_C3_Sts_His values(F15_C3_Sts_His_seq.nextval, :P5_RFE_v2, statusid);
    
        -- Is return_for empty?
    select count(*) into duplicate from return_to r
    where r.F15_C3_RFE_ref_id = :P5_RFE_v2;
    
    IF duplicate = 0 THEN
        insert into return_to Values(:P5_RFE_v2, :P5_RFE_v2, statusid);
    ELSE 
        update return_to
        set F15_C3_RFE_ref_id = :P5_RFE_v2, status_id = statusid
        where his_id = :P5_RFE_v2;
    END IF;

END;