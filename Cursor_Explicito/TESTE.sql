DECLARE
    CURSOR info_cursor(pDepartment_id NUMBER) IS
        SELECT 
            E.EMPLOYEE_ID,
            E.FIRST_NAME,
            E.LAST_NAME,
            E.EMAIL,
            D.DEPARTMENT_NAME,
            E.SALARY
        FROM
            EMPLOYEES E
        JOIN
            DEPARTMENTS D
        ON
            E.DEPARTMENT_ID = D.DEPARTMENT_ID
        WHERE
            E.DEPARTMENT_ID = pDepartment_id;
    
    TYPE info_table_type IS TABLE OF info_cursor%ROWTYPE INDEX BY PLS_INTEGER;
    info_table info_table_type;
    
    indice PLS_INTEGER := 1;
BEGIN

    FOR r_info IN info_cursor(60) LOOP
        info_table(indice) := r_info;
        indice := indice + 1;
    END LOOP;
    
    FOR i IN info_table.FIRST..info_table.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(info_table(i).employee_id        || ' - ' || 
                             info_table(i).first_name         || ' - ' || 
                             info_table(i).last_name          || ' - ' ||
                             info_table(i).EMAIL              || ' - ' ||
                             info_table(i).DEPARTMENT_NAME    || ' - ' ||
                             TO_CHAR(info_table(i).salary)
                         );
    END LOOP;
END;