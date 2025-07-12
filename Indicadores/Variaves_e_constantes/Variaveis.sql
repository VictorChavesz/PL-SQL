--Tipo number

SET SERVEROUTPUT ON
DECLARE
    vNumero NUMBER(11,2):= 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Valor = ' || vNumero);
END;

--Tipo CHAR e VARCHAR2

SET SERVEROUTPUT ON
DECLARE
    vEstado CHAR(2) := 'GO';
    vCidade VARCHAR2(30) := 'Rio Verde';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Estado: ' || vEstado);
    DBMS_OUTPUT.PUT_LINE('Cidade: ' || vCidade);
END;

--Tipo DATA

SET SERVEROUTPUT ON
DECLARE 
    vData1 DATE := '21/11/2004';
    vData2 DATE := '21/11/25';
BEGIN
    DBMS_OUTPUT.PUT_LINE(vData1);
    DBMS_OUTPUT.PUT_LINE(vData2);
END;