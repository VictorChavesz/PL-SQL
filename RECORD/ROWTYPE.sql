SET SERVEROUTPUT ON
ACCEPT idFuncionario PROMPT 'Digite o id do funcionario'
DECLARE 
    inf_func_record EMPLOYEES%ROWTYPE;
BEGIN
    SELECT
        *
    INTO
        inf_func_record
    FROM
        EMPLOYEES
    WHERE
        EMPLOYEE_ID = &idFuncionario;
        
    DBMS_OUTPUT.PUT_LINE('Primeiro nome: ' || inf_func_record.FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('Ultimo nome: '   || inf_func_record.LAST_NAME);
    DBMS_OUTPUT.PUT_LINE('EMAIL: '         || inf_func_record.EMAIL);
    DBMS_OUTPUT.PUT_LINE('Celular: '       || inf_func_record.PHONE_NUMBER);
END;
/