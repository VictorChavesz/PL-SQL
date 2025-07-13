SET SERVEROUTPUT ON
DECLARE
    CURSOR cEMPLOYEES IS
    SELECT * FROM EMPLOYEES;
BEGIN
    
    FOR employees_record IN cEMPLOYEES
    LOOP
        DBMS_OUTPUT.PUT_LINE(employees_record.employee_id     || ' - ' || 
                             employees_record.first_name      || ' - ' || 
                             employees_record.last_name       || ' - ' ||
                             employees_record.phone_number    || ' - ' ||
                             employees_record.job_id          || ' - ' ||
                             TO_CHAR(employees_record.salary)
                         ); 
    END LOOP;
END;