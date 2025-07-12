SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vPercentualAumento          NUMBER(3);
    vDeparatamentoId            employees.DEPARTMENT_ID%type := &pdepartment_id;
BEGIN
    IF
        vDeparatamentoId = 50
    THEN
        vPercentualAumento := 20;
    ELSIF
        vDeparatamentoId = 30
    THEN
        vPercentualAumento := 17.5;
    ELSIF
        vDeparatamentoId = 10
    THEN
        vPercentualAumento := 15;
    ELSIF
        vDeparatamentoId = 60
    THEN
        vPercentualAumento := 12.5;
    ELSE
        vPercentualAumento := 10;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Id  do departamento: ' || vDeparatamentoId);
    DBMS_OUTPUT.PUT_LINE('Percentual de aumento : ' || vPercentualAumento || '%');
    
    UPDATE
        employees
    SET
        salary = salary *(1 + (vPercentualAumento / 100))
    WHERE
        DEPARTMENT_ID = vDeparatamentoId;
    COMMIT;
END;