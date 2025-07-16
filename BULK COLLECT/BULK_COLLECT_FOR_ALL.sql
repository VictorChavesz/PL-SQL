CREATE OR REPLACE PROCEDURE PRC_AUMENTA_TODOS_SALARIOS(pPercentual IN NUMBER)
IS
    TYPE info_employeeid_type_record IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE INDEX BY PLS_INTEGER;
    info_employee_record info_employeeid_type_record;
BEGIN
    SELECT 
        EMPLOYEE_ID
    BULK COLLECT INTO 
        info_employee_record
    FROM 
        EMPLOYEES;
    
    FORALL indice IN 1..info_employee_record.COUNT
        UPDATE 
            EMPLOYEES
        SET 
            SALARY = SALARY * (1 + (pPercentual/100))
        WHERE EMPLOYEE_ID = info_employee_record(indice);
               
END PRC_AUMENTA_TODOS_SALARIOS;

--Testando

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES ORDER BY EMPLOYEE_ID;

EXEC PRC_AUMENTA_TODOS_SALARIOS(10);

ROLLBACK;