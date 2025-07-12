--Utilizando o SELECT

SET SERVEROUTPUT ON
DECLARE
    vPrimeiroNome   employees.first_name%TYPE;
    vUltimoNome     employees.last_name%TYPE;
    vSalario        employees.salary%TYPE;
BEGIN
    
    SELECT
        first_name,
        last_name,
        salary
    INTO
        vPrimeiroNome,
        vUltimoNome,
        vSalario
    FROM
        employees
    WHERE
        first_name = 'John'
        AND last_name = 'Seo';
        
    DBMS_OUTPUT.PUT_LINE(vPrimeiroNome || ' ' || vUltimoNome || ' recebe ' || vSalario);
    
    EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);
        
END;

SET SERVEROUTPUT ON
DECLARE
    vMediaSalario   employees.salary%TYPE;
    vSomaSalario    employees.salary%TYPE;
    vCargo          employees.job_id%TYPE := 'AC_MGR';
BEGIN
    
    SELECT
        ROUND(AVG(salary),2),
        ROUND(SUM(salary),2)
    INTO
        vMediaSalario,
        vSomaSalario
    FROM
        employees
    WHERE
        JOB_ID = vCargo;
        
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vCargo);
    DBMS_OUTPUT.PUT_LINE('Media salario: ' || vMediaSalario);
    DBMS_OUTPUT.PUT_LINE('Soma de todos os salarios: ' || vSomaSalario);
    
    EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);
        
END;

--Simulando NO DATA FOUND

SET SERVEROUTPUT ON
DECLARE
    vPrimeiroNome   employees.first_name%TYPE;
    vUltimoNome     employees.last_name%TYPE;
    vSalario        employees.salary%TYPE;
BEGIN
    
    SELECT
        first_name,
        last_name,
        salary
    INTO
        vPrimeiroNome,
        vUltimoNome,
        vSalario
    FROM
        employees
    WHERE
        first_name = 'JOHN'
        AND last_name = 'Seo';
        
    DBMS_OUTPUT.PUT_LINE(vPrimeiroNome || ' ' || vUltimoNome || ' recebe ' || vSalario);
    
    EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);
        
END;

--SIMULANDO TOO MANY ROWS

SET SERVEROUTPUT ON
DECLARE
    vPrimeiroNome   employees.first_name%TYPE;
    vUltimoNome     employees.last_name%TYPE;
    vSalario        employees.salary%TYPE;
BEGIN
    
    SELECT
        first_name,
        last_name,
        salary
    INTO
        vPrimeiroNome,
        vUltimoNome,
        vSalario
    FROM
        employees
    WHERE
        first_name = 'John';
        
    DBMS_OUTPUT.PUT_LINE(vPrimeiroNome || ' ' || vUltimoNome || ' recebe ' || vSalario);
    
    EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);
        
END;