CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_COM_LIMIT(pPERCENTUAL IN NUMBER)
IS
    TYPE employee_id_table_type IS TABLE OF EMPLOYEES.EMPLOYEE_ID%TYPE INDEX BY PLS_INTEGER;
    employee_id_table employee_id_table_type;
    
    vLimit NUMBER := 30;
    
    CURSOR cursor_employee_id IS
        SELECT 
            EMPLOYEE_ID
        FROM 
            EMPLOYEES;
BEGIN
    OPEN cursor_employee_id;
    
    LOOP
        FETCH 
            cursor_employee_id
        BULK COLLECT INTO
            employee_id_table LIMIT vLimit;
            
        EXIT WHEN employee_id_table.COUNT = 0;
        
        DBMS_OUTPUT.PUT_LINE(employee_id_table.COUNT);
        
        FORALL indice IN 1..employee_id_table.COUNT
            UPDATE
                EMPLOYEES
            SET
                SALARY = SALARY * (1 + (pPERCENTUAL / 100))
            WHERE
                EMPLOYEES.EMPLOYEE_ID = employee_id_table(indice);
                
    END LOOP;
    
    CLOSE cursor_employee_id;
        
END;

-- Testando
SET SERVEROUTPUT ON
EXECUTE PRC_AUMENTA_SALARIO_COM_LIMIT(10);
