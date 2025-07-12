DECLARE
    vEmployee_id employees.employee_id%type := 208;
BEGIN
    DELETE FROM
        employees
    WHERE
        employee_id = vEmployee_id;
END;