--Concedendo privilegios ao usuario hr
GRANT EXECUTE ON DBMS_FLASHBACK TO hr

--Gerando problema

SELECT * FROM EMPLOYEES;

UPDATE 
    EMPLOYEES
SET 
    SALARY = 100;
    
SELECT * FROM EMPLOYEES;

COMMIT;

--Desfazer a cagada

DECLARE
    CURSOR C_EMPLOYEES IS
        SELECT * 
        FROM 
            EMPLOYEES;
    
    V_RECORD C_EMPLOYEES%ROWTYPE;
BEGIN
    DBMS_FLASHBACK.ENABLE_AT_TIME(SYSDATE - 40/1440);
    
    OPEN C_EMPLOYEES;
    
    DBMS_FLASHBACK.DISABLE;
    
    LOOP
        FETCH C_EMPLOYEES
        INTO V_RECORD;
        
        EXIT WHEN C_EMPLOYEES%NOTFOUND;
        
        UPDATE 
            EMPLOYEES
        SET
            SALARY = V_RECORD.SALARY
        WHERE
            EMPLOYEE_ID = V_RECORD.EMPLOYEE_ID;
        
    END LOOP;
    
    CLOSE C_EMPLOYEES;
    
    COMMIT;
END;
     