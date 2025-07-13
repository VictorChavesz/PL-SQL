SET SERVEROUTPUT ON
DECLARE
    TYPE info_varray_type IS VARRAY(200) OF EMPLOYEES%ROWTYPE;
    info_varray info_varray_type := info_varray_type();
BEGIN
    SELECT *
    BULK COLLECT INTO info_varray
    FROM EMPLOYEES;
    
    FOR i IN info_varray.first..info_varray.last LOOP
        DBMS_OUTPUT.PUT_LINE(info_varray(i).employee_id || ' - ' || 
                         info_varray(i).first_name      || ' - ' || 
                         info_varray(i).last_name       || ' - ' ||
                         info_varray(i).phone_number    || ' - ' ||
                         info_varray(i).job_id          || ' - ' ||
                         TO_CHAR(info_varray(i).salary)
                         ); 
    END LOOP;
END;