-- PERCORRENDO COM LOOP BASICO

SET SERVEROUTPUT ON
DECLARE
    CURSOR cEMPLOYEES IS
    SELECT * FROM EMPLOYEES;
    employees_record cEMPLOYEES%ROWTYPE;
BEGIN
    OPEN cEMPLOYEES;
    
    LOOP
        FETCH cEMPLOYEES
        INTO employees_record;
        EXIT WHEN cEMPLOYEES%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id    || ' - ' || 
                            employees_record.first_name      || ' - ' || 
                            employees_record.last_name       || ' - ' ||
                            employees_record.phone_number    || ' - ' ||
                            employees_record.job_id          || ' - ' ||
                            TO_CHAR(employees_record.salary)
                         ); 
    END LOOP;
    
         DBMS_OUTPUT.PUT_LINE(employees_record.employee_id    || ' - ' || 
                            employees_record.first_name      || ' - ' || 
                            employees_record.last_name       || ' - ' ||
                            employees_record.phone_number    || ' - ' ||
                            employees_record.job_id          || ' - ' ||
                            TO_CHAR(employees_record.salary)
                         ); 
    CLOSE cEMPLOYEES;
END;

--PERCORRENDO COM WHILE LOOP

SET SERVEROUTPUT ON
DECLARE
    CURSOR cEMPLOYEES IS
    SELECT * FROM EMPLOYEES;
    employees_record cEMPLOYEES%ROWTYPE;
BEGIN
    OPEN cEMPLOYEES;
    
    FETCH cEMPLOYEES
        INTO employees_record;
    
    WHILE cEMPLOYEES%FOUND LOOP
    
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id    || ' - ' || 
                            employees_record.first_name      || ' - ' || 
                            employees_record.last_name       || ' - ' ||
                            employees_record.phone_number    || ' - ' ||
                            employees_record.job_id          || ' - ' ||
                            TO_CHAR(employees_record.salary)
                         ); 
        FETCH cEMPLOYEES
        INTO employees_record;
    END LOOP;
    
    CLOSE cEMPLOYEES;
END;