DECLARE
    vEmployee_id EMPLOYEES.EMPLOYEE_ID%TYPE := 208;
    vPercentualAumento NUMBER(3) := 25; 
BEGIN
    UPDATE 
        EMPLOYEES
    SET
        SALARY = SALARY * (1 + (vPercentualAumento /100))
    WHERE
        EMPLOYEE_ID = vEmployee_id;
END;