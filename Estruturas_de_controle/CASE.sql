SET SERVEROUTPUT ON
ACCEPT pdepartment_id PROMPT 'Digite o Id do departamento: '
DECLARE
    vPercentualAumento          NUMBER(3);
    vDeparatamentoId            employees.DEPARTMENT_ID%type := &pdepartment_id;
BEGIN
    CASE vDeparatamentoId
    WHEN 50
    THEN 
        vPercentualAumento := 20;
    WHEN 30
    THEN
        vPercentualAumento := 17.5;
    WHEN 10
    THEN
        vPercentualAumento := 15;
    WHEN 60
    THEN
        vPercentualAumento := 12.5;
    ELSE
        vPercentualAumento := 10;
    END CASE;
    
    DBMS_OUTPUT.PUT_LINE('Id  do departamento: ' || vDeparatamentoId);
    DBMS_OUTPUT.PUT_LINE('Percentual de aumento : ' || vPercentualAumento || '%');
END;