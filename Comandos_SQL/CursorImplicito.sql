SET SERVEROUTPUT ON
DECLARE
    vDepartment_id employees.department_id%type := 60;
    vPercentualAumento NUMBER(3) := 15.6;
BEGIN
    UPDATE
        employees
    SET
        salary = salary * (1 + (vPercentualAumento/100))
    WHERE
        department_id = vDepartment_id;
    
    DBMS_OUTPUT.PUT_LINE('O total de linhas afetadas pelo UPDATE eh ' || SQL%ROWCOUNT);
END;

ROLLBACK