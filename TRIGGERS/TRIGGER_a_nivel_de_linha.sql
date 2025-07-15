CREATE TABLE employees_log
(employees_log_id NUMBER (11) NOT NULL,
 dt_log    DATE DEFAULT SYSDATE NOT NULL ,
 usuario   VARCHAR2(30),
 evento    CHAR(1) NOT NULL,
 employee_id  NUMBER(6) NOT NULL,
 salary_old  NUMBER(8,2),
 salary_new  NUMBER(8,2));
 
ALTER TABLE employees_log
ADD CONSTRAINT employees_log_pk PRIMARY KEY (employees_log_id);

CREATE SEQUENCE employees_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYESS_R_TRG
  AFTER INSERT OR UPDATE OF SALARY OR DELETE 
  ON EMPLOYEES
  FOR EACH ROW
DECLARE
	vevento       employees_log.evento%TYPE;
	vemployee_id  employees_log.employee_id%TYPE;
BEGIN
	CASE
		WHEN INSERTING 
        THEN
			vevento      := 'I';
			vemployee_id := :new.employee_id;
		WHEN UPDATING 
        THEN
			vevento      := 'U';
			vemployee_id := :new.employee_id;
		ELSE
			vevento      := 'D';
			vemployee_id := :old.employee_id;
	END CASE;
	INSERT INTO employees_log
		(employees_log_id, 
         dt_log, 
         usuario, 
         evento, 
         employee_id, 
         salary_old, 
         salary_new)
	VALUES
		(employees_log_seq.nextval,
		 SYSDATE,
		 USER,
		 vevento,
		 vemployee_id,
		 :old.salary,
		 :new.salary);
END A_IUD_EMPLOYESS_R_TRG;

BEGIN
    UPDATE EMPLOYEES SET SALARY = SALARY * 1.1 WHERE EMPLOYEE_ID = 100;
END;

COMMIT;

--Com when

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYESS_R_TRG
  AFTER INSERT OR UPDATE OF SALARY OR DELETE 
  ON EMPLOYEES
  FOR EACH ROW
  WHEN(new.job_id <> 'AD-PRES')
DECLARE
	vevento       employees_log.evento%TYPE;
	vemployee_id  employees_log.employee_id%TYPE;
BEGIN
	CASE
		WHEN INSERTING 
        THEN
			vevento      := 'I';
			vemployee_id := :new.employee_id;
		WHEN UPDATING 
        THEN
			vevento      := 'U';
			vemployee_id := :new.employee_id;
		ELSE
			vevento      := 'D';
			vemployee_id := :old.employee_id;
	END CASE;
	INSERT INTO employees_log
		(employees_log_id, 
         dt_log, 
         usuario, 
         evento, 
         employee_id, 
         salary_old, 
         salary_new)
	VALUES
		(employees_log_seq.nextval,
		 SYSDATE,
		 USER,
		 vevento,
		 vemployee_id,
		 :old.salary,
		 :new.salary);
END A_IUD_EMPLOYESS_R_TRG;