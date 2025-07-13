SET SERVEROUTPUT ON
DECLARE
    TYPE info_table_type IS TABLE OF EMPLOYEES%ROWTYPE INDEX BY BINARY_INTEGER;
    info_table info_table_type;
BEGIN
    SELECT *
    BULK COLLECT INTO
        info_table
    FROM
        EMPLOYEES;
    
    FOR i IN info_table.first..info_table.last LOOP
        DBMS_OUTPUT.PUT_LINE(info_table(i).employee_id || ' - ' || 
                         info_table(i).first_name      || ' - ' || 
                         info_table(i).last_name       || ' - ' ||
                         info_table(i).phone_number    || ' - ' ||
                         info_table(i).job_id          || ' - ' ||
                         TO_CHAR(info_table(i).salary)
                         ); 
    END LOOP;
END;
/