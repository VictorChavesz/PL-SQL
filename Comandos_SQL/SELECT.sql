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

--Simulando NO DATA FOUND

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
        first_name = 'JOHN'
        AND last_name = 'Seo';
        
    DBMS_OUTPUT.PUT_LINE(vPrimeiroNome || ' ' || vUltimoNome || ' recebe ' || vSalario);
    
    EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);
        
END;

--SIMULANDO TOO MANY ROWS

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
        first_name = 'John';
        
    DBMS_OUTPUT.PUT_LINE(vPrimeiroNome || ' ' || vUltimoNome || ' recebe ' || vSalario);
    
    EXCEPTION
    WHEN OTHERS
    THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || SQLERRM);
        
END;