CREATE OR REPLACE PROCEDURE PRC_CONSULTA_DADOS_EMPREGADO(
    vEMPLOYEE_ID    IN  EMPLOYEES.EMPLOYEE_ID%TYPE,
    vFIRST_NAME     OUT EMPLOYEES.FIRST_NAME%TYPE,
    vLAST_NAME      OUT EMPLOYEES.LAST_NAME%TYPE,
    vEMAIL          OUT EMPLOYEES.EMAIL%TYPE,
    vPHONE_NUMBER   OUT EMPLOYEES.PHONE_NUMBER%TYPE,
    vHIRE_DATE      OUT EMPLOYEES.HIRE_DATE%TYPE,
    vJOB_ID         OUT EMPLOYEES.JOB_ID%TYPE,
    vSALARY         OUT EMPLOYEES.SALARY%TYPE,
    vCOMMISSION_PCT OUT EMPLOYEES.COMMISSION_PCT%TYPE,
    vMANAGER_ID     OUT EMPLOYEES.MANAGER_ID%TYPE,
    vDEPARTMENT_ID  OUT EMPLOYEES.DEPARTMENT_ID%TYPE
    )
IS
BEGIN
    SELECT
        FIRST_NAME,   
        LAST_NAME,   
        EMAIL,         
        PHONE_NUMBER,  
        HIRE_DATE,     
        JOB_ID,        
        SALARY,        
        COMMISSION_PCT,
        MANAGER_ID,    
        DEPARTMENT_ID
    INTO
        vFIRST_NAME,   
        vLAST_NAME,    
        vEMAIL,         
        vPHONE_NUMBER,  
        vHIRE_DATE,     
        vJOB_ID,        
        vSALARY,       
        vCOMMISSION_PCT,
        vMANAGER_ID,    
        vDEPARTMENT_ID 
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = vEMPLOYEE_ID;
EXCEPTION   
    WHEN NO_DATA_FOUND
    THEN
        RAISE_APPLICATION_ERROR(-20001,'ID EMPREGADO NAO EXISTE' || vEMPLOYEE_ID);
    WHEN OTHERS
    THEN
        RAISE_APPLICATION_ERROR(-20001,'ERRO ORACLE ' || SQLCODE || SQLERRM);
END;
/

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
  EMPLOYEES_record  EMPLOYEES%ROWTYPE;
BEGIN
    PRC_CONSULTA_DADOS_EMPREGADO(100, EMPLOYEES_record.first_name, EMPLOYEES_record.last_name, EMPLOYEES_record.email,
    EMPLOYEES_record.phone_number, EMPLOYEES_record.hire_date, EMPLOYEES_record.job_id, EMPLOYEES_record.salary, 
    EMPLOYEES_record.commission_pct, EMPLOYEES_record.manager_id, EMPLOYEES_record.department_id);
    DBMS_OUTPUT.PUT_LINE(EMPLOYEES_record.first_name || ' ' || 
                         EMPLOYEES_record.last_name || ' - ' ||
                         EMPLOYEES_record.department_id || ' - ' ||
                         EMPLOYEES_record.job_id || ' - ' ||
                         EMPLOYEES_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(EMPLOYEES_record.salary, 'L99G999G999D99')));
END;