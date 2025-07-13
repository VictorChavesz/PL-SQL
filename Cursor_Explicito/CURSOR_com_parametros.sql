SET SERVEROUTPUT ON
DECLARE
    CURSOR cEMPLOYEES(pDepartment_id NUMBER, pJob_id VARCHAR2) IS
    SELECT * 
    FROM 
        EMPLOYEES
    WHERE
        Department_id = pDepartment_id
        AND pJob_id = Job_id;
BEGIN
    
    FOR employees_record IN cEMPLOYEES(60, 'IT_PROG')
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