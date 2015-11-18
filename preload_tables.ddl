-- Preload the tables with data
INSERT ALL
  INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'Entered', 'The RFE has been created but has not yet been submitted for approval.', 'A')
INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'Submitted', 'The RFE has been submitted to the Lab System Administrator for approval.', 'B')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'Returned', 'The RFE has been returned for further information or clarification. Once Submitted again, it will follow the same routing as an Entered RFE.', 'C')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'Recalled ', 'The requestor has recalled an RFE that has not yet reached final approval. Once Submitted again, it will follow the same routing as an Entered RFE.', 'D')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'Rejected ', 'The RFE has been rejected and cannot be implemented.', 'E')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'SA Approved', 'The Lab System Administrator has approved the RFE; it has been submitted for Lab Director approval.', 'F')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'LD Approval', 'The Lab Director has approved the RFE; it has been submitted for Network Security Panel approval.', 'G')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'CH Approval ', 'The Lab Director has approved the RFE; it has been submitted to the Chairperson of Security Panel approval.', 'H')
						INTO F15_C3_Status_Code(status_id, effective_date, name, description, status_code) VALUES (DEFAULT,SYSDATE,'Final Approved', 'The Executive Director''s Office has given final approval for the RFE and it may be implemented.', 'I')
SELECT 1 FROM DUAL;
