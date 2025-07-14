DECLARE
    vFIRST_NAME     EMPLOYEES.FIRST_NAME%TYPE := 'PAULO';
    vLAST_NAME      EMPLOYEES.LAST_NAME%TYPE := 'CHAVES';
    vEMAIL          EMPLOYEES.EMAIL%TYPE := 'PAULO@GMAIL.COM';
    vPHONE_NUMBER   EMPLOYEES.PHONE_NUMBER%TYPE := '666666666';
    vJOB_ID         EMPLOYEES.JOB_ID%TYPE := 'XX_YYYY';
    eFk_inexistente EXCEPTION;
    PRAGMA EXCEPTION_INIT(eFk_inexistente, -2291);
BEGIN
    INSERT INTO employees (employee_id, first_name, last_name, phone_number, email, hire_date,job_id)
    VALUES (employees_seq.nextval, vFIRST_NAME, vLAST_NAME, vPHONE_NUMBER, vEMAIL, sysdate, vJOB_ID);
    COMMIT;
EXCEPTION
    WHEN eFk_inexistente
    THEN
        RAISE_APPLICATION_ERROR(-20003,'JOB INEXISTENTE');
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20004, SQLCODE || ' ' || SQLERRM);
END;