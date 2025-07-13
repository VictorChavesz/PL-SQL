SET SERVEROUTPUT ON
ACCEPT idFuncionario PROMPT 'Digite o id do funcionario'
DECLARE 
    TYPE inf_func_record_type IS RECORD(
        EMPLOYEE_ID     EMPLOYEES.EMPLOYEE_ID%TYPE,
        FIRST_NAME      EMPLOYEES.FIRST_NAME%TYPE,
        LAST_NAME       EMPLOYEES.LAST_NAME%TYPE,
        EMAIL           EMPLOYEES.EMAIL%TYPE,
        PHONE_NUMBER    EMPLOYEES.PHONE_NUMBER%TYPE
    );
    inf_func_record inf_func_record_type;
BEGIN
    SELECT
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER
    INTO
        inf_func_record.EMPLOYEE_ID,
        inf_func_record.FIRST_NAME,
        inf_func_record.LAST_NAME,
        inf_func_record.EMAIL,
        inf_func_record.PHONE_NUMBER
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = &idFuncionario;
        
    DBMS_OUTPUT.PUT_LINE('Primeiro nome: ' || inf_func_record.FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('Ultimo nome: '   || inf_func_record.LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('EMAIL: '         || inf_func_record.EMAIL);
    DBMS_OUTPUT.PUT_LINE('Celular: '       || inf_func_record.PHONE_NUMBER);
END;